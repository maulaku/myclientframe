unit uClientPlugin;

interface

uses
  Classes, SysUtils, Forms, Windows, uStringConst, Uni,oracleUniProvider,
  ActnList;

type
  TClientFrame = class;

  TClientPlugin = class(TDataModule)
  private
    FModuleHandle: THandle;
    FName: string;
    FReturn:Boolean;
    FCreatedForm: TForm;
    FormHandle: THandle;
    FClientFrame: TClientFrame;
    FMainForm: TFormClass;
    FPluginName: string;
  protected
    procedure translateFrame(const AClientFrame: TClientFrame);
  public
    constructor Create(AOwner:TComponent);override;
    destructor Destroy; override;
    procedure CloseForm(Sender: TObject; var Action: TCloseAction);
    property ModuleHandle: THandle read FModuleHandle write FModuleHandle;
    property Name: string read FName write FName;
    property CreateForm:TForm Read FCreatedForm Write FCreatedForm;
    property ClientFrame: TClientFrame read FClientFrame;
    property MainForm: TFormClass read FMainForm write FMainForm;
    property PluginName: string read FPluginName write FPluginName;
  end;

  TRegisterClientPlugin = Function:TClientPlugin;stdcall;

  TClientFrame = class(TComponent)
  private
    FLocalDB: TUniConnection;
    PluginList: TStrings;
    FOracleUniProvider:TOracleUniProvider;
    function FormatDllPath(ADllName: string): string;
    function GetLocalDB: TUniConnection;
    function GetPluginPath: string;
    procedure Init;
    property PluginPath: string read GetPluginPath;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function FindPlugin(AHandle: THandle): TClientPlugin; overload;
    function FindPlugin(AName: string): TClientPlugin; overload;
    function getAppPath: string;
    procedure Load(AName: string);
    procedure UnLoad(AName: string); overload;
    procedure UnLoad(AHandle: THandle); overload;
    property LocalDB: TUniConnection read GetLocalDB;
  end;

var
  ClientPlugin: TClientPlugin;

implementation
{$R *.dfm}

uses
  Dialogs, uConfig;

constructor TClientFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  PluginList := TStringList.Create;
  init;
end;

destructor TClientFrame.Destroy;
begin
  FreeAndNil(FLocalDB);

  FreeAndNil(PluginList);
  inherited Destroy;
end;

function TClientFrame.FindPlugin(AHandle: THandle): TClientPlugin;
{-------------------------------------------------------------------------------
  ������:    TClientFrame.FindPlugin
  ����:      luohuachun
  ����:      2009.07.16
  ����:      AHandle: THandle
  ����ֵ:    TClientPlugin
  ��ϸ˵��:  ���Ҳ��
-------------------------------------------------------------------------------}
var
  i: Integer;
  plg: TClientPlugin;
begin
  Result := nil;
  for i := 0 to pluginList.Count - 1 do begin
    plg := TClientPlugin(PluginList.Objects[i]);
    if plg.FormHandle = AHandle then begin
      Result := plg;
      exit;
    end;
  end;
end;

function TClientFrame.FindPlugin(AName: string): TClientPlugin;
{-------------------------------------------------------------------------------
  ������:    TClientFrame.FindPlugin
  ����:      luohuachun
  ����:      2009.07.16
  ����:      AName: string
  ����ֵ:    TClientPlugin
  ��ϸ˵��:  ���Ҳ��
-------------------------------------------------------------------------------}
begin
  Result := TClientPlugin(pluginList.IndexOf(AName));
end;

function TClientFrame.FormatDllPath(ADllName: string): string;
{-------------------------------------------------------------------------------
  ������:    TClientFrame.FormatDllPath
  ����:      luohuachun
  ����:      2009.07.16
  ����:      ADllName: string
  ����ֵ:    string
  ��ϸ˵��:  ��ʽ����ǰ���·��

-------------------------------------------------------------------------------}
begin
  Result := PluginPath + ADllName;
end;

function TClientFrame.getAppPath: string;
{-------------------------------------------------------------------------------
  ������:    TClientFrame.getAppPath
  ����:      luohuachun
  ����:      2009.07.16
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ȡ��Ӧ�ó���·��

-------------------------------------------------------------------------------}
var
  path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if path[Length(Path)] <> '\' then
    path := Path + '\';

  Result := path;
end;

function TClientFrame.GetLocalDB: TUniConnection;
begin
    Result := FLocalDB;
end;

function TClientFrame.GetPluginPath: string;
{-------------------------------------------------------------------------------
  ������:    TClientFrame.GetPluginPath
  ����:      luohuachun
  ����:      2009.07.16
  ����:      ��
  ����ֵ:    String
  ��ϸ˵��:  ȡ�ò��·��

-------------------------------------------------------------------------------}
begin
  Result := getAppPath + 'plugin\';
end;

procedure TClientFrame.Init;
var
  _DBConfig: iConfig;
  _DbLinkInformation: TDbLinkInformation;
begin
  _DBConfig := TORACLEConfig.Create;
  _DbLinkInformation := _DBConfig.ReadConfig;
  try
    FLocalDB := TUniConnection.Create(Self);
    FLocalDB.Server := _DbLinkInformation.ServerName;
    FLocalDB.Username := _DbLinkInformation.UserName;
    FLocalDB.Password := _DbLinkInformation.PassWord;
    FLocalDB.ProviderName := _DbLinkInformation.ProviderName;
    FLocalDB.Port := _DbLinkInformation.Port;
    FLocalDB.LoginPrompt := False;
    try
      FLocalDB.Connected := True;
    except
      FLocalDB.Connected := False;
      MessageDlg('���ݿ�����ʧ��,�������ò���!', mtError, [mbOK], 0);
    end;
  finally
    FreeAndNil(_DbLinkInformation);
    _DBConfig := nil;
  end;
end;

procedure TClientFrame.Load(AName: string);
{-------------------------------------------------------------------------------
  ������:    TClientFrame.Load
  ����:      luohuachun
  ����:      2009.07.16
  ����:      AName: string
  ����ֵ:    ��
  ��ϸ˵��:  ���ز��

-------------------------------------------------------------------------------}
var
  libHandle: THandle;
   RegisterProc : TRegisterClientPlugin;
   Plugin       : TClientPlugin;
  Form:TForm;
begin
  if PluginList.IndexOf(AName) <> -1 then begin
    exit;
  end;

  libHandle := LoadLibrary(PChar(FormatDllPath(AName)));

  if libHandle = 0 then exit;

  @RegisterProc := GetProcAddress(LibHandle, PChar(REG_PLUGIN));
  if not Assigned(RegisterProc) then
  begin
    FreeLibrary(LibHandle);
    Exit;
  end;

  Plugin := RegisterProc;
  plugin.FModuleHandle := libHandle;
  plugin.translateFrame(self);

  Form := plugin.MainForm.Create(Application);
  plugin.CreateForm := Form;
  Form.OnClose :=Plugin.CloseForm;
  PluginList.AddObject(plugin.Name, plugin);
end;

procedure TClientFrame.UnLoad(AName: string);
{-------------------------------------------------------------------------------
  ������:    TClientFrame.UnLoad
  ����:      luohuachun
  ����:      2009.07.16
  ����:      AName: string
  ����ֵ:    ��
  ��ϸ˵��:  ж�ز��

-------------------------------------------------------------------------------}
begin
  TClientPlugin(FindPlugin(AName)).Free;
end;


procedure TClientFrame.UnLoad(AHandle: THandle);
{-------------------------------------------------------------------------------
  ������:    TClientFrame.UnLoad
  ����:      luohuachun
  ����:      2009.07.16
  ����:      AHandle: THandle
  ����ֵ:    ��
  ��ϸ˵��:  ж�ز��

-------------------------------------------------------------------------------}
var
  plg: TClientPlugin;
begin
  plg := TClientPlugin(FindPlugin(AHandle));
  if plg <> nil then
    FreeAndNil(plg);
end;

constructor TClientPlugin.Create(AOwner:TComponent);
begin
    GlobalNameSpace.BeginWrite;
  try
    CreateNew(AOwner);
    FReturn := True;
    FCreatedForm  := nil;
    InitInheritedComponent(Self, TClientPlugin);
    if (ClassType <> TClientPlugin) and not (csDesigning in ComponentState) then
      if OldCreateOrder and Assigned(OnCreate) then
        OnCreate(Self);
  finally
    GlobalNameSpace.EndWrite;
  end;
end;

destructor TClientPlugin.Destroy;
begin
  { TODO -o�޻��� -c��ʶ�¼� : �ر��Ӵ��� }
  FreeLibrary(FModuleHandle);
  inherited;
end;

procedure TClientPlugin.CloseForm(Sender: TObject; var Action: TCloseAction);
begin
  FCreatedForm:=nil;
  Action := caFree;
end;

procedure TClientPlugin.translateFrame(const AClientFrame: TClientFrame);
begin
  FClientFrame := AClientFrame;
end;

end.

