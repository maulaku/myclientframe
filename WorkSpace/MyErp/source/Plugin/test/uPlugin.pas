unit uPlugin;

interface
uses SysUtils,Forms,uClientPlugin;

type
  TPlugin = class(TClientPlugin)
  end;

var
  Plugin: TPlugin;

function RegisterPlugin: TPlugin; stdcall;

implementation
uses testForm;

function RegisterPlugin: TPlugin;
begin
  Plugin := TPlugin.Create;
  frmTest := TfrmTest.Create(Application);
  Plugin.MainFormHandle := frmtest.handle;
  frmTest.Show;
  Result := Plugin;
end;

end.

