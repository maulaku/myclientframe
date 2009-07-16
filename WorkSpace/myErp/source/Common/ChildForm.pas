unit ChildForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ImgList, ActnList, dxBar;
  
const
  WM_MSGCLOSE = WM_User + 100;  //定义消息常量;
  
type
  TfrmChild = class(TfrmBase)
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
