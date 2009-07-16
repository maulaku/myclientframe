unit uPlugin;

interface
uses uClientPlugin,SysUtils,Forms;

type
  TPlugin = class(TClientPlugin)
  end;

var
  Plugin: TPlugin;

function RegisterPlugin: TPlugin; stdcall;

implementation

function RegisterPlugin: TPlugin;
begin
  Plugin := TPlugin.Create(nil);
  Result := Plugin;
end;

end.

