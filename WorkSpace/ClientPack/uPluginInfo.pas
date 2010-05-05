{********************************************************

������Ϣ����ϵͳ                                        
��Ȩ���� (C) 2010 ������Ϣ�������޹�˾                  
�������: ���������Ϣ

*********************************************************}


unit uPluginInfo;

interface
uses SysUtils, Classes, Controls, pluginPropertyForm, Variants,DesignEditors
    ,DesignIntf;

type
  TPluginInfo = class(TPersistent)
  private
    FAuthor: string;
    FGuid: string;
    FID: Integer;
    FPluginCnName: string;
    FPluginName: string;
    FUpdateTime: TDateTime;
    FVersion: string;
    function GetCreateTime: string;
  public
  published
    property Author: string read FAuthor write FAuthor;
    property CreateTime: string read GetCreateTime;
    property Guid: string read FGuid write FGuid;
    property ID: Integer read FID write FID;
    property PluginCnName: string read FPluginCnName write FPluginCnName;
    property PluginName: string read FPluginName write FPluginName;
    property UpdateTime: TDateTime read FUpdateTime write FUpdateTime;
    property Version: string read FVersion write FVersion;
  end;

  TPluginInfoProperty = class(TClassProperty)
  private

  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
//    procedure GetProperties(Proc: TGetPropProc); override;
//    function GetValue: string; override;
  end;

implementation

uses
  DateUtils, Dialogs, uClientPlugin;

{
***************************** TPluginInfoProperty ******************************
}

procedure TPluginInfoProperty.Edit;
var
  Plugin: TLHCClientPlugin;
begin
  inherited;
  frmPluginProperty := TfrmPluginProperty.Create(nil);
  try
{ TODO :
getComponent(0):ָ���Ǹ��������ڵĿؼ���
����TPluginInfoProperty�ǿؼ�(LHCPlugin)���ԣ�PluginInfo�������ı༭����
��ôgetComponnet(0)ȡ���Ķ������LHCPlugin,
getName������ȡ���ؼ�������Plugininfo }
    Plugin := TLHCClientPlugin(GetComponent(0));

    //Showmessage(Plugin.PluginInfo.Author);
    with frmPluginProperty do begin
      edtCnName.Text := plugin.PluginInfo.PluginCnName;
      edtName.Text := plugin.PluginInfo.PluginName;
      edtAuthor.Text := plugin.PluginInfo.Author;
      edtVersion.Text := Plugin.PluginInfo.Version;
//      edtRemark
      if ShowModal = MrOk then begin
        Plugin.PluginInfo.PluginCnName := edtCnName.Text;
        Plugin.PluginInfo.Version := edtVersion.Text;
        Plugin.PluginInfo.PluginName := edtName.Text;
        Plugin.PluginInfo.Author := edtAuthor.text;
        plugin.PluginInfo.UpdateTime := Today;
        Modified;
      end;
    end;
  finally
    frmPluginProperty.Free;
  end;
end;

function TPluginInfoProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog, paSubProperties, paSortList, paMultiSelect];
end;

function TPluginInfo.GetCreateTime: string;
begin
  Result := FormatDateTime('yyyy-mm-dd',Now);
end;


end.

