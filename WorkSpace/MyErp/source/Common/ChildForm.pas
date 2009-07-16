unit ChildForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ImgList, ActnList, dxBar;

const
  WM_MSGCLOSE = WM_User + 100; //定义消息常量;

type
  TfrmChild = class(TfrmBase)
    bmChild: TdxBarManager;
    bbDelete: TdxBarButton;
    bbModify: TdxBarButton;
    bbExport: TdxBarButton;
    bbPrint: TdxBarButton;
    bbFind: TdxBarButton;
    alChild: TActionList;
    act_new: TAction;
    act_Delete: TAction;
    act_Edit: TAction;
    act_Find: TAction;
    act_Export: TAction;
    act_print: TAction;
    bbNew: TdxBarButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChild: TfrmChild;

implementation
uses uPlugin;

{$R *.dfm}

procedure TfrmChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   Action := cafree;
   Self := nil;
   //Plugin.ClientFrame.UnLoadPlugin(Self.Handle);
end;
end.

