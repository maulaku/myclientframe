unit uClientPlugin;

interface

uses
  Classes, SysUtils, Forms, Windows, uStringConst,ActnList, tabs, DateUtils,
   uPluginInfo,ComCtrls, RzTabs;

type
  TLHCClientFrame = class;

  //插件信息
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
      { TODO -o罗华春 -c标识事件 : 关闭子窗体 }
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
    过程名:    TLHCClientFrame.FindPlugin
    作者:      luohuachun
    日期:      2009.07.16
    参数:      AName: string
    返回值:    TLHCClientPlugin
    详细说明:  查找插件
  -------------------------------------------------------------------------------}

begin
  Result := TLHCClientPlugin(pluginList.IndexOf(AName));
end;

function TLHCClientFrame.FindPlugin(AHandle: THandle): TLHCClientPlugin;
var
  i: Integer;
  plg: TLHCClientPlugin;

  {-------------------------------------------------------------------------------
    过程名:    TLHCClientFrame.FindPlugin
    作者:      luohuachun
    日期:      2009.07.16
    参数:      AHandle: THandle
    返回值:    TLHCClientPlugin
    详细说明:  查找插件
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
    过程名:    TLHCClientFrame.FormatDllPath
    作者:      luohuachun
    日期:      2009.07.16
    参数:      ADllName: string
    返回值:    string
    详细说明:  格式化当前插件路径

  -------------------------------------------------------------------------------}

begin
  Result := PluginPath + ADllName;
end;

function TLHCClientFrame.getAppPath: string;
var
  path: string;

  {-------------------------------------------------------------------------------
    过程名:    TLHCClientFrame.getAppPath
    作者:      luohuachun
    日期:      2009.07.16
    参数:      无
    返回值:    string
    详细说明:  取得应用程序路径

  -------------------------------------------------------------------------------}

begin
  path := ExtractFilePath(Application.ExeName);
  if path[Length(Path)] <> '\' then
    path := Path + '\';

  Result := path;
end;


function TLHCClientFrame.GetPluginPath: string;

  {-------------------------------------------------------------------------------
    过程名:    TLHCClientFrame.GetPluginPath
    作者:      luohuachun
    日期:      2009.07.16
    参数:      无
    返回值:    String
    详细说明:  取得插件路径

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
    过程名:    TLHCClientFrame.Load
    作者:      luohuachun
    日期:      2009.07.16
    参数:      AName: string
    返回值:    无
    详细说明:  加载插件

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
    过程名:    TLHCClientFrame.Load
    作者:      luohuachun
    日期:      2009.07.16
    参数:      AName: string
    返回值:    无
    详细说明:  加载插件

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
    //将窗体附着到容器中.
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
    过程名:    TLHCClientFrame.UnLoad
    作者:      luohuachun
    日期:      2009.07.16
    参数:      AName: string
    返回值:    无
    详细说明:  卸载插件

  -------------------------------------------------------------------------------}

begin
  TLHCClientPlugin(FindPlugin(AName)).Free;
end;

procedure TLHCClientFrame.UnLoad(AHandle: THandle);
var
  plg: TLHCClientPlugin;

    {-------------------------------------------------------------------------------
      过程名:    TLHCClientFrame.UnLoad
      作者:      luohuachun
      日期:      2009.07.16
      参数:      AHandle: THandle
      返回值:    无
      详细说明:  卸载插件

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

