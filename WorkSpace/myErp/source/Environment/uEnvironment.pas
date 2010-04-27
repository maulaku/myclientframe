{*******************************************************}
{                                                       }
{       动力信息管理系统                                }
{                                                       }
{       版权所有 (C) 2010 动力信息技术有限公司          }
{       环境变量单元                                                }
{*******************************************************}


unit uEnvironment;

interface
uses SysUtils, Windows, Registry, ActiveX;
const
  sIMPETUS = 'SOFTWARE\IMPETUS\';
  SPort = 'PORT';
  SAddress = 'ADDRESS';

type
  TEnvironment = class
  private
    FReleasePluginPath: string;
    function GetReleasePluginPath: string;
    function GetRoot: string;
  public
    IniMgr: TRegIniFile;
    constructor Create;
    destructor Destroy; override;
    function CreateGuid: string;
    function GetPort: Integer; stdcall;
    function Getserver: string; stdcall;
    function NewGuid: string;
    function ReleasePath: string; stdcall;
    property Port: Integer read GetPort;
    property ReleasePluginPath: string read GetReleasePluginPath write
      FReleasePluginPath;
    property Root: string read GetRoot;
    property server: string read Getserver;
  end;

var
  Env: TEnvironment;

implementation

uses
  uglobalVarians, Dialogs;

constructor TEnvironment.Create;
begin
  inherited;
  iniMgr := TRegIniFile.Create();
  IniMgr.RootKey := HKEY_LOCAL_MACHINE;
end;

destructor TEnvironment.Destroy;
begin
  IniMgr.CloseKey;
  FreeAndNil(IniMgr);
  inherited;
end;


function TEnvironment.CreateGuid: string;
{-------------------------------------------------------------------------------
  过程名:    TEnvironment.CreateGuid
  作者:      罗华春
  日期:      2010.04.27
  参数:      无
  返回值:    string
  详细说明:  另一个方法创建Guid
-------------------------------------------------------------------------------}
var
  guid: TGUID;
begin
  CoCreateGuid(guid);
  result := GUIDToString(guid);
  result := StringReplace(result, '-', '', [rfReplaceAll]);
  result := Copy(result, 2, Length(result) - 2);
end;

{ TConn }


function TEnvironment.GetPort: Integer;
{-------------------------------------------------------------------------------
  过程名:    TConn.getPort
  作者:      罗华春
  日期:      2010.03.20
  参数:      无
  返回值:    Integer
  详细说明:  取得服务器的端口号
-------------------------------------------------------------------------------}
begin
  Result := IniMgr.ReadInteger(SIMPETUS, SPort, -1);
  if Result = 0 then Result := 8527;
end;

function TEnvironment.GetReleasePluginPath: string;
begin
  Result := ReleasePath + 'Plugin\';
end;

function TEnvironment.Getserver: string;
{-------------------------------------------------------------------------------
  过程名:    TConn.getServer
  作者:      罗华春
  日期:      2010.03.20
  参数:      无
  返回值:    string
  详细说明:  取得服务器的地址
-------------------------------------------------------------------------------}
begin
  Result := IniMgr.ReadString(SIMPETUS, SAddress, '');
  if Result = '' then Result := '127.0.0.1';
end;

{ TEnvironment }

function TEnvironment.ReleasePath: string;
begin
  Result := Root;
end;

function TEnvironment.GetRoot: string;
begin
{$WARN SYMBOL_PLATFORM OFF}
  Result := IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)));
{$WARN SYMBOL_PLATFORM ON}
end;


Function TEnvironment.NewGuid: string;
{-------------------------------------------------------------------------------
  过程名:    TEnvironment.NewGuid
  作者:      罗华春
  日期:      2010.04.27
  参数:      无
  返回值:    string
  详细说明:  创建GUID
-------------------------------------------------------------------------------}
type
  TSetOfChars = set of char;

  function ANewGuid: TGUID;
  begin
{$IFDEF MSWINDOWS}
    CoCreateGuid(result);
{$ELSE}
    CreateGuid(result);
{$ENDIF}
  end;
  function NewGuidAsString: string;
  begin
    result := GuidToString(ANewGuid());
  end;
  procedure Remove(var s: string; iChars: TSetOfChars);
  var i, l: Integer;
   // source:string;
  begin
 // source := s;
    l := 0;
    for i := 1 to length(s) do begin
      if not (s[i] in iChars) then begin
        s[l + 1] := s[i];
        inc(l);
      end;
    end;
    SetLength(s, l);
  end;
begin
  result := NewGuidAsString();
  Remove(result, ['-', '{', '}']);
end;

initialization
  Env := TEnvironment.Create;
finalization
  Env := nil;
end.

