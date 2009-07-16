unit ChildForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ImgList, ActnList, dxBar, StdCtrls;
  
const
  WM_MSGCLOSE = WM_User + 100;  //������Ϣ����;
  
type
  TfrmChild = class(TfrmBase)
    bmChild: TdxBarManager;
    AlClient: TActionList;
    act_Refresh: TAction;
    act_New: TAction;
    act_Update: TAction;
    act_Delete: TAction;
    act_Find: TAction;
    act_Print: TAction;
    act_Export: TAction;
    bbRefresh: TdxBarButton;
    bbNew: TdxBarButton;
    bbDelete: TdxBarButton;
    bbUpdate: TdxBarButton;
    bbFind: TdxBarButton;
    bbPrint: TdxBarButton;
    bbExport: TdxBarButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChild: TfrmChild;

implementation

{$R *.dfm}

procedure TfrmChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  PostMessage(Application.MainForm.Handle,WM_MSGCLOSE,Handle,0);
end;

end.
