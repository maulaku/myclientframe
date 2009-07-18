unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, DBAccess, Uni, UniProvider,
  OracleUniProvider, uInfo, CheckLst, Buttons, FileCtrl, IniFiles;

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
    btnClose: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    edtDirectory: TEdit;
    btnSelectDirectory: TSpeedButton;
    btnSave: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnConnectionClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnGetTableListClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnSelectDirectoryClick(Sender: TObject);
    procedure lbTablesClick(Sender: TObject);
    procedure UCMainAfterConnect(Sender: TObject);
  private
    FConfig: TConfig;
    function dbConnection: Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FConfig);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FConfig := TConfig.Create;

  FConfig.Load;
  cbbDataBase.Text := FConfig.Server;
  edtUserName.Text := FConfig.UserName;
  edtPassWord.Text := FConfig.PassWord;
  edtDirectory.Text := FConfig.SavePath;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnConnectionClick(Sender: TObject);
begin
  dbConnection;
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
var
  i: Integer;
  Mgr: TMyClassMgr;
  _Table: TTable;
  list: TStrings;
begin
  list := tStringlist.Create;
  try
    for i := 0 to lbTables.Count - 1 do begin
      if lbTables.State[i] = cbChecked then begin
        list.Add(lbTables.Items.Strings[i]);
      end;
    end;

    _Table := TTable(lbTables.Items.Objects[0]);
    Mgr := TMyClassMgr.Create;
    Mgr.SavePath := edtDirectory.Text;
    try
      Mgr.Convert(List);
    finally
      FreeAndNil(Mgr);
    end;
  finally
    FreeAndNil(List);
  end;

end;

procedure TfrmMain.btnGetTableListClick(Sender: TObject);
var
  Mgr: IMgr;
begin
  if not dbConnection then exit;

  Mgr := TTableMgr.Create;
  try
    lbTables.Items := Mgr.getObjectList;
  finally
    Mgr := nil;
  end;
end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
begin
  FConfig.Server := cbbDataBase.Text;
  FConfig.UserName := edtUserName.Text;
  FConfig.PassWord := edtPassWord.Text;
  FConfig.SavePath := edtDirectory.Text;
  FConfig.save;
end;

procedure TfrmMain.btnSelectDirectoryClick(Sender: TObject);
var
  Root: string;
begin
  Root := edtDirectory.Text;

  if SelectDirectory('请选择一个目录', '', Root) then begin
    if Root[Length(Root)] <> '\' then
      Root := Root + '\';
    edtDirectory.text := Root;
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
  Mgr: TColumnMgr;
begin
  if lbTables.ItemIndex = -1 then exit;

  o := TTable(lbTables.Items.Objects[lbTables.ItemIndex]);
  Mgr := TColumnMgr.Create;
  lbColumn.Items := Mgr.getObjectList(o.AName);

end;

procedure TfrmMain.UCMainAfterConnect(Sender: TObject);
begin
  sbMain.Panels[1].Text := '连接成功!';
end;

end.

