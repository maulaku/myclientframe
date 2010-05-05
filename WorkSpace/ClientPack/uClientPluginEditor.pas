unit uClientPluginEditor;

interface
uses DesignEditors, DesignIntf, DesignWindows, SysUtils, Dialogs;

type
  TPublicshWindow = class(TDesignWindow)
  end;

  TLHCClientPluginEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

implementation
uses PluginPropertyForm, uClientPlugin, Controls, DateUtils;
{
**************************** TLHCClientPluginEditor ****************************
}

procedure TLHCClientPluginEditor.ExecuteVerb(Index: Integer);
var
  PropertyForm: TfrmPluginProperty;
  plugin: TLHCClientPlugin;
begin
  case index of
    0: begin
        plugin := TLHCClientPlugin(GetComponent);
        PropertyForm := TfrmPluginProperty.Create(nil);
        try
          with PropertyForm do begin
            edtCnName.Text := plugin.PluginInfo.PluginCnName;
            edtName.Text := plugin.PluginInfo.PluginName;
            edtAuthor.Text := plugin.PluginInfo.Author;
            edtVersion.Text := Plugin.PluginInfo.Version;
            if ShowModal = MrOk then begin
              Plugin.PluginInfo.PluginCnName := edtCnName.Text;
              Plugin.PluginInfo.Version := edtVersion.Text;
              Plugin.PluginInfo.PluginName := edtName.Text;
              Plugin.PluginInfo.Author := edtAuthor.text;
              plugin.PluginInfo.UpdateTime := Today;
            end;
          end;
        finally
          FreeAndNil(PropertyForm);
        end;
      end;
    1: begin
        ShowMessage('通过...');
      end;
  end;
end;

function TLHCClientPluginEditor.GetVerb(Index: Integer): string;
begin
  case index of
    0: Result := '发布插件...';
    1: Result := '测试';
  end;
end;

function TLHCClientPluginEditor.GetVerbCount: Integer;
begin
  Result := 2;
end;
end.

