unit uPlugin;

interface

uses
  SysUtils, Classes,uClientPlugin;

type
  TPlugin = class(TClientPlugin)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Plugin: TPlugin;

function RegisterClientPlugin : TPlugin; stdcall;

implementation

{$R *.dfm}

uses testForm;

function RegisterClientPlugin : TPlugin;
begin
  Plugin := TPlugin.Create(nil);
  if Plugin.PluginName<>'' then Plugin.Name := Plugin.PluginName;
  Plugin.MainForm := TFrmTest;
  Result := Plugin;
end;
end.
