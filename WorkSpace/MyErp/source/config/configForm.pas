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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FConfig: TConfig;
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
  if showInformationA('»∑∂®±£¥Ê≈‰÷√?') = mrOk then begin
    FConfig.ProviderName := cbbType.Text;
    FConfig.LocalIP := edtAddress.Text;
    FConfig.Port := edtPort.Value;
    FConfig.UserName := edtUserName.Text;
    FConfig.PassWord := edtPort.Text;
    FConfig.WriteLocalConfig;
    ModalResult := 1;
  end else ModalResult := 0;
end;

procedure TfrmConfig.FormCreate(Sender: TObject);
begin
  inherited;
  FConfig := TConfig.Create;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
  inherited;
  FConfig.ReadLocalConfig;
  cbbType.ItemIndex := cbbType.Items.IndexOf(FConfig.ProviderName);
  edtAddress.Text := FConfig.LocalIP;
  edtPort.Value := FConfig.Port;
  edtUserName.Text := FConfig.UserName;
  edtPassWord.Text := FConfig.PassWord;

end;

end.
