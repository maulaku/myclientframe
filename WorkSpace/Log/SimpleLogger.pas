{********************************************************

动力信息管理系统                                        
版权所有 (C) 2010 动力信息技术有限公司                  
软件功能:  日志类
eg:
  Var
    log;

    log := TLogger.Create;
    log.LogLevel := 4;
    log.Active := True;
    log.HandleLog(nil,1,'这里是日志内容'); //这里可以关联到一个对象的日志事件。

*********************************************************}


unit SimpleLogger;

interface

uses Windows, Messages, Classes, SysUtils, StdCtrls, Forms;

{$I ..\CMPLRSET.INC}

type
  TLogEvent = procedure(Sender: TObject; aType: Integer; S: string) of object;

type
  TLogger = class
  private
    FActive, FSynchronize: Boolean;
    FFileStream: TFileStream;
    FHandle: HWND;
    FLogLevel: Integer;
    FFileName, FPrevFileName: string;
    FFileSizeLimit: Integer;
    procedure SetFileName(AValue: string);
    procedure WndProc(var Msg: TMessage);
    procedure InternalAddLog(PS: PString);
    procedure SetActive(AValue: Boolean);
    procedure RenewLogFile;
  public
    constructor Create;
    destructor Destroy; override;
    procedure HandleLog(Sender: TObject; aType: Integer; S: string);
    procedure FlushFile;
    procedure SaveToFile(AFileName: string);
    procedure SaveToFileAsk(AExt: string = '.txt'; AFilter: string = 'Text files (*.txt)|*.TXT');
    property Active: Boolean read FActive write SetActive;
    property FileName: string read FFileName write SetFileName;
    property LogLevel: Integer read FLogLevel write FLogLevel;
    property FileSizeLimit: Integer read FFileSizeLimit write FFileSizeLimit;
    property Synchronize: Boolean read FSynchronize write FSynchronize;
  end;

const
  LOGLEVEL_ERRORONLY = -1;
  LOGLEVEL_NORMAL = 0;
  LOGLEVEL_DETAIL = 1;

Var
  log:TLogger;

implementation

uses
  XUtils,
{$WARN SYMBOL_PLATFORM OFF}
  FileCtrl,
{$WARN SYMBOL_PLATFORM ON}
  Dialogs, Controls;

const
  UWM_INTERNALADDLOG = WM_USER + 1;

{ TLogger }

constructor TLogger.Create;
begin
  inherited;
  FHandle := AllocateHWnd(WndProc);
  SetParent(FHandle, Application.Handle);
  FLogLevel := LOGLEVEL_NORMAL;
  FFileSizeLimit := 500000;
  FileName := ChangeFileExt(GetModulePathName, '.log');
end;

destructor TLogger.Destroy;
begin
  Active := False;
  DeallocateHWnd(FHandle);
  inherited;
end;

procedure TLogger.HandleLog(Sender: TObject; aType: Integer; S: string);
begin
  S := Format('%s (%d) %s', [DateTimeToStr(Now), aType, S]);
  if aType <= FLogLevel then
  begin
    if FSynchronize then
      SendMessage(FHandle, UWM_INTERNALADDLOG, 0, LPARAM(@S))
    else
      InternalAddLog(@S);
  end;
end;

procedure TLogger.InternalAddLog(PS: PString);
begin
  if Assigned(FFileStream) then
  begin
    PS^ := PS^ + #13#10;
    FFileStream.Write(PChar(PS^)^, Length(PS^));
    if FFileStream.Size > FFileSizeLimit then
      RenewLogFile;
  end;
end;

procedure TLogger.RenewLogFile;
begin
  Windows.CopyFile(PChar(FFileName), PChar(FPrevFileName), False);
  FFileStream.Size := 0;
end;

procedure TLogger.WndProc(var Msg: TMessage);
begin
  with Msg do
  begin
    if Msg = UWM_INTERNALADDLOG then
      InternalAddLog(PString(LParam))
    else
      Result := DefWindowProc(FHandle, Msg, wParam, lParam);
  end;
end;

procedure TLogger.SaveToFile(AFileName: string);
var
  Src: TFileStream;
begin
  ForceDirectories(ExtractFilePath(AFileName));
  with TFileStream.Create(AFileName, fmCreate) do
  try
    if FileExists(FPrevFileName) then
    begin
      Src := TFileStream.Create(FPrevFileName, fmOpenRead);
      try
        CopyFrom(Src, Src.Size);
      finally
        Src.Free;
      end;
    end;

    if Assigned(FFileStream) then
      FlushFileBuffers(FFileStream.Handle);

    if FileExists(FFileName) then
    begin
      Src := TFileStream.Create(FFileName, fmOpenRead);
      try
        CopyFrom(Src, Src.Size);
      finally
        Src.Free;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TLogger.SetFileName(AValue: string);
begin
  FFileName := AValue;
  FPrevFileName := FFileName + '.prev';
  ForceDirectories(ExtractFilePath(FFileName));
end;

procedure TLogger.SaveToFileAsk(AExt, AFilter: string);
var
  FN, Ext: string;
begin
  with TSaveDialog.Create(nil) do
  try
    Filter := AFilter;
    if Execute then
    begin
      FN := FileName;
      Ext := ExtractFileExt(FN);
      if (Ext = '.') or (Ext = '') then
        FN := ChangeFileExt(FN, AExt);

      if FileExists(FN) then
      begin
        if mrYes <> MessageDlg(FN + #13#10#13#10 + '档案己存在, 确定覆盖吗?',
          mtConfirmation, [mbYes, mbNo], 0) then
        begin
          Exit;
        end;
      end;

      try
        SaveToFile(FN);
        MessageDlg('日志存档成功 ' + #13#10#13#10 + FN, mtInformation, [mbOK], 0);
      except
        on E: Exception do MessageDlg(E.Message, mtError, [mbOK], 0);
      end;
    end;
  finally
    Free;
  end;
end;

procedure TLogger.SetActive(AValue: Boolean);
begin
  if FActive <> AValue then
  begin
    if AValue then
    begin
      Assert(FFileName <> '');
      if not FileExists(FFileName) then
        FileClose(FileCreate(FFileName));

      FFileStream := TFileStream.Create(FFileName, fmOpenReadWrite or fmShareDenyWrite);
      FFileStream.Seek(0, soFromEnd);
    end else
    begin
      FreeAndNil(FFileStream);
    end;
    FActive := AValue;
  end;
end;

procedure TLogger.FlushFile;
begin
  if Assigned(FFileStream) then
    FlushFileBuffers(FFileStream.Handle);
end;

initialization
  log := TLogger.Create;
  log.LogLevel := 4;
  log.Active := True;
finalization
  Log.Free;
end.

