unit uClientPlugin;

interface

uses
  Classes, SysUtils, Forms, Windows, uStringConst,ActnList, tabs, DateUtils,
   uPluginInfo,ComCtrls, RzTabs;

type
  TLHCClientFrame = class;

  //�����Ϣ
  TLHCClientPlugin = class(TDataModule)
  private
    FClientFrame: TLHCClientFrame;
    FCreatedForm: TForm;
    FMainForm: TFormClass;
    FModuleHandle: THandle;
    FName: string;
    FPluginInfo: TPluginInfo;
  protected
    procedure Init(const AClientFrame: TLHCClientFrame; aName: string);
    procedure Notification(AComponent: TComponent; Operation: TOperation);
      override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CloseForm(Sender: TObject; var Action: TCloseAction);
    property ClientFrame: TLHCClientFrame read FClientFrame;
    property CreateForm: TForm read FCreatedForm write FCreatedForm;
    property MainForm: TFormClass read FMainForm write FMainForm;
    property ModuleHandle: THandle read FModuleHandle write FModuleHandle;
    property Name: string read FName write FName;
  published
    property PluginInfo: TPluginInfo read FPluginInfo write FPluginInfo;
  end;

  TLHCClientFrame = class(TComponent)
  private
    FLibHandles: TStrings;
    PluginList: TStrings;
    function FormatDllPath(ADllName: string): string;
    function GetPluginPath: string;
    procedure Init;
    property PluginPath: string read GetPluginPath;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function FindPlugin(AName: string): TLHCClientPlugin; overload;
    function FindPlugin(AHandle: THandle): TLHCClientPlugin; overload;
    function getAppPath: string;
    function isLinkDb: Boolean;
    procedure Load(AName: string); overload;
    procedure Load(AName: string; Pages: TRzPageControl); overload;
    procedure UnLoad(AName: string); overload;
    procedure UnLoad(AHandle: THandle); overload;
  end;

  TRegisterClientPlugin = function: TLHCClientPlugin; stdcall;

implementation
{$R *.dfm}

uses
  Dialogs, uMyProject, uMyDialogs, PluginPropertyForm;


{
******************************* TLHCClientPlugin *******************************
}

constructor TLHCClientPlugin.Create(AOwner: TComponent);
begin

  //  inherited Create(AOwner);

  with DesignOffset do begin
    X := 500;
    Y := 500;
  end;
  with DesignSize do begin
    X := 200;
    y := 200;
  end;

  GlobalNameSpace.BeginWrite;
  try
    CreateNew(AOwner);
    FCreatedForm := nil;
    FPluginInfo := TPluginInfo.Create;
    InitInheritedComponent(Self, TLHCClientPlugin);
    if (ClassType <> TLHCClientPlugin) and not (csDesigning in ComponentState) then
      if OldCreateOrder and Assigned(OnCreate) then
        OnCreate(Self);
  finally
    GlobalNameSpace.EndWrite;
  end;
end;

destructor TLHCClientPlugin.Destroy;
begin
  FreeAndNil(FPluginInfo);
      { TODO -o�޻��� -c��ʶ�¼� : �ر��Ӵ��� }
  if Assigned(FCreatedForm) then
    FreeAndNil(FCreatedForm);
  inherited Destroy;
end;

procedure TLHCClientPlugin.CloseForm(Sender: TObject; var Action: TCloseAction);
begin
  FCreatedForm := nil;
  Action := caFree;
end;

procedure TLHCClientPlugin.Init(const AClientFrame: TLHCClientFrame; aName:
  string);
begin
  FClientFrame := AClientFrame;
  FName := AName;
end;

procedure TLHCClientPlugin.Notification(AComponent: TComponent; Operation:
  TOperation);
begin
  inherited Notification(AComponent, Operation);
end; 

{
******************************* TLHCClientFrame ********************************
}

constructor TLHCClientFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  PluginList := TStringList.Create;
  init;
  FLibHandles := TStringList.Create;
end;

destructor TLHCClientFrame.Destroy;
begin
  FreeAndNil(FLibHandles);
  FreeAndNil(PluginList);
  inherited Destroy;
end;

function TLHCClientFrame.FindPlugin(AName: string): TLHCClientPlugin;

  {-------------------------------------------------------------------------------
    ������:    TLHCClientFrame.FindPlugin
    ����:      luohuachun
    ����:      2009.07.16
    ����:      AName: string
    ����ֵ:    TLHCClientPlugin
    ��ϸ˵��:  ���Ҳ��
  -------------------------------------------------------------------------------}

begin
  Result := TLHCClientPlugin(pluginList.IndexOf(AName));
end;

function TLHCClientFrame.FindPlugin(AHandle: THandle): TLHCClientPlugin;
var
  i: Integer;
  plg: TLHCClientPlugin;

  {-------------------------------------------------------------------------------
    ������:    TLHCClientFrame.FindPlugin
    ����:      luohuachun
    ����:      2009.07.16
    ����:      AHandle: THandle
    ����ֵ:    TLHCClientPlugin
    ��ϸ˵��:  ���Ҳ��
  -------------------------------------------------------------------------------}

begin
  Result := nil;
  for i := 0 to pluginList.Count - 1 do begin
    plg := TLHCClientPlugin(PluginList.Objects[i]);
    if plg.CreateForm.Handle = AHandle then begin
      Result := plg;
      exit;
    end;
  end;
end;

function TLHCClientFrame.FormatDllPath(ADllName: string): string;

  {-------------------------------------------------------------------------------
    ������:    TLHCClientFrame.FormatDllPath
    ����:      luohuachun
    ����:      2009.07.16
    ����:      ADllName: string
    ����ֵ:    string
    ��ϸ˵��:  ��ʽ����ǰ���·��

  -------------------------------------------------------------------------------}

begin
  Result := PluginPath + ADllName;
end;

function TLHCClientFrame.getAppPath: string;
var
  path: string;

  {-------------------------------------------------------------------------------
    ������:    TLHCClientFrame.getAppPath
    ����:      luohuachun
    ����:      2009.07.16
    ����:      ��
    ����ֵ:    string
    ��ϸ˵��:  ȡ��Ӧ�ó���·��

  -------------------------------------------------------------------------------}

begin
  path := ExtractFilePath(Application.ExeName);
  if path[Length(Path)] <> '\' then
    path := Path + '\';

  Result := path;
end;


function TLHCClientFrame.GetPluginPath: string;

  {-------------------------------------------------------------------------------
    ������:    TLHCClientFrame.GetPluginPath
    ����:      luohuachun
    ����:      2009.07.16
    ����:      ��
    ����ֵ:    String
    ��ϸ˵��:  ȡ�ò��·��

  -------------------------------------------------------------------------------}

begin
  Result := getAppPath + 'plugin\';
end;

procedure TLHCClientFrame.Init;
begin
end;

function TLHCClientFrame.isLinkDb: Boolean;
begin
  Result := True;
end;

procedure TLHCClientFrame.Load(AName: string);
var
  libHandle: THandle;
  RegisterProc: TRegisterClientPlugin;
  Plugin: TLHCClientPlugin;
  pluginFilePath: string;

  {-------------------------------------------------------------------------------
    ������:    TLHCClientFrame.Load
    ����:      luohuachun
    ����:      2009.07.16
    ����:      AName: string
    ����ֵ:    ��
    ��ϸ˵��:  ���ز��

  -------------------------------------------------------------------------------}

begin
  if PluginList.IndexOf(AName) <> -1 then begin
    exit;
  end;

  pluginFilePath := FormatDllPath(AName);

  libHandle := LoadLibrary(PChar(pluginFilePath));

  if libHandle = 0 then exit;

  RegisterProc := GetProcAddress(LibHandle, PChar(REG_PLUGIN));
  if not Assigned(RegisterProc) then
  begin
    FreeLibrary(LibHandle);
    Exit;
  end;

  Plugin := RegisterProc;
  with Plugin do begin
    FModuleHandle := libHandle;
    init(self, AName);

    CreateForm := plugin.MainForm.Create(Application);
    CreateForm.WindowState := wsMaximized;
    CreateForm.OnClose := CloseForm;
  end;
  PluginList.AddObject(plugin.Name, plugin);
  FLibHandles.Add(Format('%s=%s', [IntToStr(Plugin.FCreatedForm.Handle), IntToStr(Plugin.FModuleHandle)]));
end;

procedure TLHCClientFrame.Load(AName: string; Pages: TRzPageControl);
var
  libHandle: THandle;
  RegisterProc: TRegisterClientPlugin;
  Plugin: TLHCClientPlugin;
  pluginFilePath: string;

  {-------------------------------------------------------------------------------
    ������:    TLHCClientFrame.Load
    ����:      luohuachun
    ����:      2009.07.16
    ����:      AName: string
    ����ֵ:    ��
    ��ϸ˵��:  ���ز��

  -------------------------------------------------------------------------------}

begin
  if PluginList.IndexOf(AName) <> -1 then begin
    exit;
  end;

  pluginFilePath := FormatDllPath(AName);

  libHandle := LoadLibrary(PChar(pluginFilePath));

  if libHandle = 0 then exit;

  RegisterProc := GetProcAddress(LibHandle, PChar(REG_PLUGIN));
  if not Assigned(RegisterProc) then
  begin
    FreeLibrary(LibHandle);
    Exit;
  end;

  Plugin := RegisterProc;
  with Plugin do begin
    FModuleHandle := libHandle;
    init(self, AName);

    CreateForm := plugin.MainForm.Create(Application);
    //�����帽�ŵ�������.
    CreateForm.ManualDock(Pages);
    CreateForm.Visible := True;
    Pages.ActivePageIndex := pages.PageCount - 1;
    CreateForm.WindowState := wsMaximized;
    CreateForm.OnClose := CloseForm;
  end;
  PluginList.AddObject(plugin.Name, plugin);
  FLibHandles.Add(Format('%s=%s', [IntToStr(Plugin.FCreatedForm.Handle), IntToStr(Plugin.FModuleHandle)]));
end;

procedure TLHCClientFrame.UnLoad(AName: string);

  {-------------------------------------------------------------------------------
    ������:    TLHCClientFrame.UnLoad
    ����:      luohuachun
    ����:      2009.07.16
    ����:      AName: string
    ����ֵ:    ��
    ��ϸ˵��:  ж�ز��

  -------------------------------------------------------------------------------}

begin
  TLHCClientPlugin(FindPlugin(AName)).Free;
end;

procedure TLHCClientFrame.UnLoad(AHandle: THandle);
var
  plg: TLHCClientPlugin;

    {-------------------------------------------------------------------------------
      ������:    TLHCClientFrame.UnLoad
      ����:      luohuachun
      ����:      2009.07.16
      ����:      AHandle: THandle
      ����ֵ:    ��
      ��ϸ˵��:  ж�ز��

    -------------------------------------------------------------------------------}
var
  libHandle: Integer;

begin
  plg := TLHCClientPlugin(FindPlugin(AHandle));
  if plg <> nil then begin
    PluginList.Delete(PluginList.IndexOf(plg.Name));
    FreeAndNil(plg);
  end;
  LibHandle := StrToInt(FLibHandles.ValueFromIndex[FLibHandles.IndexOfName(IntToStr(AHandle))]);
  FreeLibrary(libHandle);
  FLibHandles.Delete(FLibHandles.IndexOfName(IntToStr(AHandle)));
end;

end.

