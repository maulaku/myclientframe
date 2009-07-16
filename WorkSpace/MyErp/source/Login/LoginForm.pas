unit LoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ModalForm, ImgList, StdCtrls, Buttons, ExtCtrls;

type
  TfrmLogin = class(TfrmModal)
    edtUserName: TEdit;
    edtPassWord: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtInformation: TEdit;
    Label4: TLabel;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnOKClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrok;
end;

end.
