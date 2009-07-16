{*******************************************************}
{                                                       }
{       �����������                                    }
{                                                       }
{       ��Ȩ���� (C) 2009 �����Ƽ�                      }
{                                                       }
{*******************************************************}

unit uClientPlugin;


interface

uses
  Windows,
  Forms,
  Classes,
  Controls,
  SysUtils,
  ExtCtrls,
  Messages,
  StdActns, uni, uConfig;

const
  Reg_Plugin = 'RegisterPlugin';
type

  TClientFrame = class;

  //1�������
  TClientPlugin = class(TObject)
  private
    FPluginName: string;
    FModuleHandle: THandle;
    FClientFrame: TClientFrame;
    FMainFormHandle: THandle;
  public
//    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    //�������
    property PluginName: string read FPluginName write FPluginName;
    //ģ������Dll�ľ��
    property ModuleHandle: THandle read FModuleHandle write FModuleHandle;
    procedure init(AClientFrame: TClientFrame);
    property ClientFrame: TClientFrame read FClientFrame;
    property MainFormHandle: THandle read FMainFormHandle write FMainFormHandle;
  end;

  TRegisterClientPlugin = function: TClientPlugin; stdcall;

  //1����������;
  TClientFrame = class(TComponent)
  private
    PluginList: TStrings;
    FLocalDb: TUniConnection;

    function getPath: string;
    function getPluginPath: string;
    function getPluginNameByMainFormHandle(const AHandle: THandle): string;
  public
        FCreatedForm:TForm;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property PluginPath: string read getPluginPath;
    property Path: string read getPath;
    property LocalDB: TUniConnection read FLocalDb write FLocalDB;

    procedure loadPlugin(PluginName: string);
    procedure UnLoadPlugin(PluginName: string); overload;
    procedure UnLoadPlugin(PluginMainFormHandle: THandle); overload;

  end;

implementation

{
********************************* TClientFrame *********************************
}

constructor TClientFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  PluginList := TStringList.Create;
end;

destructor TClientFrame.Destroy;
var
  i: Integer;
begin
  for i := pluginList.Count - 1 downto 0 do
  begin
    TClientPlugin(pluginList.Objects[i]).Free;
  end;
  FreeAndNil(PluginList);
  inherited Destroy;
end;


//1 ȡ�ò��

procedure TClientFrame.UnLoadPlugin(PluginName: string);
var
  Plg: TClientPlugin;
begin
  plg := TClientPlugin(PluginList.IndexOf(PluginName));
  if not (Plg = nil) then
    FreeAndNil(plg);
end;

function TClientFrame.getPath: string;
begin
  Result := ExtractFilePath(Application.ExeName);
  if Result[Length(Result)] <> '\' then
    Result := Result + '\';
end;

function TClientFrame.getPluginPath: string;
begin
  Result := getPath + 'Plugin\';
end;

procedure TClientFrame.LoadPlugin(PluginName: string);
var
  plg: TClientPlugin;
  RegPlugin: TRegisterClientPlugin;

  LibHandle: THandle;
begin
  LibHandle := LoadLibrary(PChar(PluginPath + PluginName));
  if LibHandle = 0 then exit;

  @RegPlugin := GetProcAddress(LibHandle, Reg_Plugin);

//  @SForm := GetProcAddress(LibHandle, 'ShowForm');
//  if not Assigned(SForm) then
//    exit;
//  SForm;
//  @CForm := GetProcAddress(LibHandle, 'CloseForm');
  //CForm;
  if not Assigned(RegPlugin) then begin
    FreeLibrary(LibHandle);
    Exit;
  end;

  plg := RegPlugin;
  plg.ModuleHandle := LibHandle;
  plg.PluginName := PluginName;
  plg.init(self);

  PluginList.AddObject(IntToStr(plg.ModuleHandle), Plg);
end;

//constructor TClientPlugin.Create(AOwner: TComponent);
//begin
//  //inherited Create(AOwner);
//  GlobalNameSpace.BeginWrite;
//  try
//    CreateNew(AOwner);
//    InitInheritedComponent(Self, TClientPlugin);
//    if (ClassType <> TClientPlugin) and not (csDesigning in ComponentState) then
//      DoCreate;
////      if OldCreateOrder and Assigned(OnCreate) then
////        OnCreate(Self);
//  finally
//    GlobalNameSpace.EndWrite;
//  end;  
//end;

procedure TClientFrame.UnLoadPlugin(PluginMainFormHandle: THandle);
var
  Plg: TClientPlugin;
  _PluginName: string;
begin
  _PluginName := getPluginNameByMainFormHandle(PluginMainFormHandle);
  if not (Length(_PluginName) = 0) then begin
    plg := TClientPlugin(PluginList.IndexOf(_PluginName));
    if not (Plg = nil) then  begin
//      PostMessage(PluginMainFormHandle,WM_MSGCLOSE,0,0);
      //PostMessage(PluginMainFormHandle,WM_COMMAND,0,0); 
      FreeAndNil(plg); 
    end;
  end;
end;


//1 ȡ�ò��
{
******************************** TClientPlugin *********************************
}


destructor TClientPlugin.Destroy;
begin
  FreeLibrary(FModuleHandle);
  inherited;
end;


procedure TClientPlugin.init(AClientFrame: TClientFrame);
begin
  FClientFrame := AClientFrame;
end;

function TClientFrame.getPluginNameByMainFormHandle(const AHandle: THandle):
  string;
var
  i: Integer;
  plg: TClientPlugin;
begin
  Result := '';
  for i := pluginList.Count - 1 downto 0 do begin
    plg := TClientPlugin(pluginList.Objects[i]);
    if plg.MainFormHandle = AHandle then begin
      Result := plg.FPluginName;
      exit;
    end;
  end;
end;


end.

