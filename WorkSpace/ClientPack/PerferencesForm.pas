unit PerferencesForm;

interface

uses
  Windows
  , Messages
  , SysUtils
  , Variants
  , Classes
  , Graphics
  , Controls
  , Forms
  , Dialogs
  , ComCtrls
  , StdCtrls
  , Buttons
  , CheckLst
  , ExtCtrls
  , IniFiles
  , {$WARN UNIT_PLATFORM OFF}filectrl{$WARN UNIT_PLATFORM ON}
  , DesignWindows
  , uMyProject;

type
  //首选项
  TfrmPerferences = class(TDesignWindow)
    Bevel1: TBevel;
    btnCancel: TButton;
    BtnOK: TButton;
    edtAuthor: TEdit;
    edtDeveloperName: TEdit;
    edtPort: TEdit;
    edtProjectName: TEdit;
    EdtRoot: TEdit;
    edtSoftWareName: TEdit;
    edtVersion: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblBin: TLabel;
    lblDcu: TLabel;
    lblImages: TLabel;
    lblReport: TLabel;
    lblSource: TLabel;
    pcPerferances: TPageControl;
    spSpecificallyRoot: TSpeedButton;
    tsAbout: TTabSheet;
    tsProject: TTabSheet;
    tsServer: TTabSheet;
    tsVariables: TTabSheet;
    cbbAddress: TComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spSpecificallyRootClick(Sender: TObject);
  private
    FProjectInfo: TProjectInfo;
    procedure AssignInfo;
    procedure ShowInfo;
//    procedure WriteProject;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

const SELDIRHELP = 1000;

var
  frmPerferences: TfrmPerferences;

implementation
uses uconst;

{$R *.dfm}

{
******************************* TfrmPerferences ********************************
}

constructor TfrmPerferences.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FProjectInfo := TProjectInfo.Create;
end;

destructor TfrmPerferences.Destroy;
begin
  FreeAndNil(FProjectInfo);
  inherited Destroy;
end;

procedure TfrmPerferences.AssignInfo;
begin
  with FProjectInfo do begin
    Version := Trim(edtVersion.Text);
    Author := Trim(edtAuthor.Text);
    exeName := Trim(edtProjectName.Text);
    cnName := Trim(edtSoftWareName.Text);
    DeveloperName := Trim(edtDeveloperName.Text);

    with DirectoryInfo do begin
      if Length(Trim(EdtRoot.Text)) <> 0 then EdtRoot.Text := FormatPath(EdtRoot.Text);
      Root := Trim(EdtRoot.Text);
    end;

    with DataBaseInfo do begin
      Address := Trim(cbbAddress.text);
      if Addresss.IndexOf(Address) = -1 then
        Addresss.Add(Address);
      Port := StrToInt(edtPort.text);
    end;

  end;
end;

procedure TfrmPerferences.btnCancelClick(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

procedure TfrmPerferences.BtnOKClick(Sender: TObject);
begin
  if MessageDlg('确定要保存更改?', mtWarning, [mbYes, MBNO], 0) = mrYES then
  begin
    //将信息赋给对象
    AssignInfo;

    FProjectInfo.DirectoryInfo.CreateDirectory;
    FProjectInfo.DirectoryInfo.Write;
    FProjectInfo.DataBaseInfo.Write;
    FProjectInfo.Write;

    ModalResult := mrOk;
  end else begin
    ModalResult := mrNone;
  end;
end;

procedure TfrmPerferences.FormShow(Sender: TObject);
begin
  FProjectInfo.Read;
  ShowInfo;
end;

{-------------------------------------------------------------------------------
  过程名:    TfrmPerferences.ShowInfo
  作者:      developer
  日期:      2009.08.07
  参数:      无
  返回值:    无
  说明:      显示目录
-------------------------------------------------------------------------------}

procedure TfrmPerferences.ShowInfo;
var
  sRoot: string;
begin
  //目录信息
  sRoot := FProjectInfo.DirectoryInfo.Root;
  edtRoot.Text := sRoot;
  lblBin.Caption := FProjectInfo.DirectoryInfo.Bin;
  lblDcu.Caption := FProjectInfo.DirectoryInfo.dcu;
  lblSource.Caption := FProjectInfo.DirectoryInfo.Source;
  lblReport.Caption := FProjectInfo.DirectoryInfo.Report;
  lblImages.Caption := FProjectInfo.DirectoryInfo.Images;

  //工程信息
  edtProjectName.Text := FProjectInfo.exeName;
  edtSoftWareName.Text := FProjectInfo.cnName;
  edtDeveloperName.Text := FProjectInfo.DeveloperName;
  edtAuthor.Text := FProjectInfo.Author;
  edtVersion.Text := FProjectInfo.Version;

  //数据库信息
  cbbAddress.Items := FProjectInfo.DataBaseInfo.addresss;
  cbbAddress.ItemIndex := cbbAddress.Items.IndexOf(FProjectInfo.DataBaseInfo.Address);
  edtPort.Text := IntToStr(FProjectInfo.DataBaseInfo.Port);
end;

procedure TfrmPerferences.spSpecificallyRootClick(Sender: TObject);
var
  Dir: string;
begin
  Dir := FProjectInfo.DirectoryInfo.Root;
  if SelectDirectory('请选择路径', '', Dir) then begin

    if Length(Trim(Dir)) = 0 then exit;

    if Dir[Length(Dir)] <> '\' then Dir := Dir + '\';
  end;

  FProjectInfo.DirectoryInfo.Root := Dir;

  EdtRoot.Text := FProjectInfo.DirectoryInfo.Root;

//  ShowMessage(EdtRoot.Text);
  if Length(Trim(Dir)) > 0 then
  begin
    if Dir[Length(Dir)] <> '\' then
      Dir := Dir + '\';
    ShowInfo;
  end;
end;

end.

