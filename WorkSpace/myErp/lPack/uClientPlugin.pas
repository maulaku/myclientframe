unit uClientPlugin;

interface

uses
  Classes,SysUtils,Forms,Windows,uConst;

type
  TSHOWDLLFORM = procedure;stdcall;
  TCLOSEDLLFORM = procedure;stdcall;

  TClientFrame = class;

  TClientPlugin = class(TObject)
  private
    FCloseDllForm: TCloseDllForm;
    FModuleHandle: THandle;
    FName: String;
    FormHandle: THandle;
    FShowDllForm: TShowDllForm;
  public
    constructor Create;
    destructor Destroy; override;
    property ModuleHandle: THandle read FModuleHandle write FModuleHandle;
    property Name: String read FName write FName;
    property CloseDllForm: TCloseDllForm read FCloseDllForm;
    property ShowDllForm: TShowDllForm read FShowDllForm;
  end;


  TClientFrame = class(TComponent)
  private
    PluginList: TStrings;
    function FormatDllPath(ADllName: string): string;
    function GetPluginPath: String;

    property PluginPath: String read GetPluginPath;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function FindPlugin(AHandle: THandle): TClientPlugin; overload;
    function FindPlugin(AName: string): TClientPlugin; overload;
    function getAppPath: string;
    procedure Load(AName: string);
    procedure UnLoad(AName: string); overload;
    procedure UnLoad(AHandle: THandle); overload;
  end;

implementation

constructor TClientFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  PluginList := TStringList.Create;
end;

destructor TClientFrame.Destroy;
begin
  FreeAndNil(PluginList);
  inherited Destroy;
end;

function TClientFrame.FindPlugin(AHandle: THandle): TClientPlugin;
var
  i: Integer;
  plg: TClientPlugin;
begin  
  Result := nil;
  for i := 0 to pluginList.Count-1 do begin
    plg := TClientPlugin(PluginList.Objects[i]);
    if plg.FormHandle = AHandle then begin
      Result := plg;
      exit;
    end;
  end;
end;

function TClientFrame.FindPlugin(AName: string): TClientPlugin;
begin
  Result := TClientPlugin(pluginList.IndexOf(AName));
end;

function TClientFrame.FormatDllPath(ADllName: string): string;
begin
  Result := PluginPath + ADllName ;
end;

function TClientFrame.getAppPath: string;
var
  path: string;
begin
  path := ExtractFilePath(Application.ExeName);
  if path[Length(Path)] <> '\' then
    path := Path + '\';

  Result := path ;
end;

function TClientFrame.GetPluginPath: String;
begin
  Result := getAppPath + 'plugin\' ;
end;

procedure TClientFrame.Load(AName: string);
var
  libHandle:THandle;
  _ShowDllForm:TSHOWDLLFORM;
  _CloseDllForm:TCLOSEDLLFORM;

  plugin: TClientPlugin;
begin
  libHandle := LoadLibrary(PChar(FormatDllPath(AName)));

  if libHandle = 0 then exit;

  @_CloseDllForm:= GetProcAddress(libHandle,PChar(Close_DllForm));
  if @_CloseDllForm = nil then begin
    FreeLibrary(libHandle);
    exit;
  end;

  @_ShowDllForm := GetProcAddress(libHandle,PChar(Show_DllForm));
  if @_ShowDllForm=nil then begin
    FreeLibrary(libHandle);
    exit;
  end;
  
  Plugin := TClientPlugin.Create;
  if plugin = nil then
    exit;
  plugin.Name := AName;
  plugin.FModuleHandle := libHandle;
  plugin.FShowDllForm := _ShowDllForm;
  plugin.FCloseDllForm := _CloseDllForm;

  plugin.ShowDllForm;
  PluginList.AddObject(plugin.Name,plugin);
end;

procedure TClientFrame.UnLoad(AName: string);
begin
  TClientPlugin(FindPlugin(AName)).Free;
end;

procedure TClientFrame.UnLoad(AHandle: THandle);
begin
  TClientPlugin(FindPlugin(AHandle)).Free;
end;

constructor TClientPlugin.Create;
begin
  inherited;
end;

destructor TClientPlugin.Destroy;
begin
  CloseDllForm;
  FreeLibrary(FModuleHandle);
  inherited;  
end;

end.
