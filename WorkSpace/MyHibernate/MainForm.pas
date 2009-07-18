unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, DBAccess, Uni, UniProvider,
  OracleUniProvider,uInfo, CheckLst;

type
  TfrmMain = class(TForm)
    pcMain: TPageControl;
    tsDataBase: TTabSheet;
    tsTableAndColumn: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbbDataBase: TComboBox;
    edtUserName: TEdit;
    edtPassWord: TEdit;
    sbMain: TStatusBar;
    UCMain: TUniConnection;
    btnConnection: TButton;
    OracleUniProvider1: TOracleUniProvider;
    lbColumn: TListBox;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    btnGetTableList: TButton;
    lbTables: TCheckListBox;
    btnExport: TButton;
    Button1: TButton;
    procedure btnConnectionClick(Sender: TObject);
    procedure btnGetTableListClick(Sender: TObject);
    procedure lbTablesClick(Sender: TObject);
    procedure UCMainAfterConnect(Sender: TObject);
  private
    function dbConnection:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnConnectionClick(Sender: TObject);
begin
  dbConnection;
end;

procedure TfrmMain.btnGetTableListClick(Sender: TObject);
var
  Mgr:IMgr;
begin
  if not dbConnection then exit;
  
  Mgr := TTableMgr.Create;
  try
    lbTables.Items := Mgr.getObjectList;
  Finally
      Mgr := nil;
  end;
end;

function TfrmMain.dbConnection: Boolean;
begin
  if UCMain.Connected then
  begin
    Result := True;
    exit;
  end;

  UCMain.ProviderName := 'ORACLE';
  UCMain.Server := cbbDataBase.Text;
  UCMain.Username := edtUserName.Text;
  UCMain.Password := edtPassWord.Text;
  UCMain.LoginPrompt := false;
  try
    UCMain.Connected := True;
    sbMain.Panels[1].Text := '连接成功!';
    Result := True;
  except
    REsult := False;
    pcMain.ActivePageIndex := 0;
    sbMain.Panels[1].Text := '连接失败!请检查数据库连接配置.';
  end;
end;

procedure TfrmMain.lbTablesClick(Sender: TObject);
var
  o: TTable;
  Mgr:TColumnMgr;
begin
  if   lbTables.ItemIndex = -1 then exit;

  o := TTable(lbTables.Items.Objects[lbTables.ItemIndex]);
  Mgr := TColumnMgr.Create;
  lbColumn.Items := Mgr.getObjectList(o.AName);
    
end;

procedure TfrmMain.UCMainAfterConnect(Sender: TObject);
begin
  sbMain.Panels[1].Text := '连接成功!';
end;

end.

