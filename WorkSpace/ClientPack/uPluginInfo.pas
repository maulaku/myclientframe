{********************************************************

动力信息管理系统                                        
版权所有 (C) 2010 动力信息技术有限公司                  
软件功能: 插件基本信息

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
getComponent(0):指的是该属性所在的控件；
比如TPluginInfoProperty是控件(LHCPlugin)属性（PluginInfo）所属的编辑器；
哪么getComponnet(0)取出的对象就是LHCPlugin,
getName方法将取出控件的属性Plugininfo }
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

