unit configForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ModalForm, ImgList, StdCtrls, Buttons, ExtCtrls, ComCtrls, Spin, uConst, uConfig;

type
  TfrmConfig = class(TfrmModal)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbbType: TComboBox;
    edtAddress: TEdit;
    edtUserName: TEdit;
    Label6: TLabel;
    edtPassWord: TEdit;
    edtPort: TSpinEdit;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation


{$R *.dfm}

procedure TfrmConfig.btnOKClick(Sender: TObject);
begin
  inherited;
//  if showInformationA('»∑∂®±£¥Ê≈‰÷√?') = mrOk then begin
//    FConfig.ProviderName := cbbType.Text;
//    FConfig.LocalIP := edtAddress.Text;
//    FConfig.Port := edtPort.Value;
//    FConfig.UserName := edtUserName.Text;
//    FConfig.PassWord := edtPort.Text;
//    FConfig.WriteLocalConfig;
//    ModalResult := 1;
//  end else ModalResult := 0;
end;

end.

