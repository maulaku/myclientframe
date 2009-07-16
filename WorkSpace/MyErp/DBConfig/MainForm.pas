unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,uConfig, Spin, DB, DBAccess, Uni, Grids,
  DBGrids, MemDS;

type
  TfrmConfig = class(TForm)
    grp1: TGroupBox;
    pnlBottom: TPanel;
    btnOK: TButton;
    cbbType: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtUserName: TEdit;
    edtPassWord: TEdit;
    edtServerName: TEdit;
    lbl5: TLabel;
    sePort: TSpinEdit;
    Button1: TButton;
    dbgrd1: TDBGrid;
    UniQuery1: TUniQuery;
    UniDataSource1: TUniDataSource;
    procedure btnCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FConfig:iConfig;
    FDbLinkInformation:TDbLinkInformation;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation
uses dsShare;

{$R *.dfm}

procedure TfrmConfig.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmConfig.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FDBLinkInformation);
  FConfig := nil;
end;

procedure TfrmConfig.btnOKClick(Sender: TObject);
begin
  With FDbLinkInformation do begin
    ProviderName := cbbType.Items.Strings[cbbType.itemindex];
    ServerName := edtServerName.Text;
    UserName := edtUserName.Text;
    PassWord := edtPassWord.Text;
    Port := sePort.Value;
  end;

  FConfig.WriteConfig(FDbLinkInformation);
  Close;
end;

procedure TfrmConfig.Button1Click(Sender: TObject);
var
  Share:TShare;
begin
//  从包中可以拿出数据连接组件。
//  share := TShare.Create;
//  Share.Init;
//  UniQuery1.Connection := Share.LocalDB;
//  UniQuery1.SQL.Text := 'select * from company';
//  UniQuery1.Open;
  {
  UniConnection1.ProviderName := 'ORACLE';
  UniConnection1.Server := '192.168.1.252';
  UniConnection1.Username := 'developer';
  UniConnection1.Password := 'developer';
  try
  UniConnection1.Connected := True;

  UniQuery1.SQL.Text := 'select * from company';
  UniQuery1.Open;
  except
      ShowMessage('error');
  end;
   }

end;

procedure TfrmConfig.FormCreate(Sender: TObject);
begin
  FConfig := TOracleConfig.Create;
  FDbLinkInformation := FConfig.ReadConfig;
  cbbType.ItemIndex := cbbType.Items.IndexOf(FDbLinkInformation.ProviderName);
  edtUserName.Text := FDbLinkInformation.UserName;
  edtPassWord.Text := FDbLinkInformation.PassWord;
  edtServerName.Text := FDbLinkInformation.ServerName;
  sePort.Value := FDbLinkInformation.Port;  
end;

end.
