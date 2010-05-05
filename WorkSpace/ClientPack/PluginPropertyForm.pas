{********************************************************

动力信息管理系统
版权所有 (C) 2010 动力信息技术有限公司
软件功能: 插件发布窗体

*********************************************************}


unit PluginPropertyForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, uPackProject, CheckLst, Spin, DesignWindows
  , uPluginMgr;

type
  TPluginState = (psNone, psNew, psEdit);
  TfrmPluginProperty = class(TDesignWindow)
    pnlButtom: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtName: TEdit;
    Label5: TLabel;
    edtCnName: TEdit;
    edtAuthor: TEdit;
    edtRemark: TRichEdit;
    edtVersion: TEdit;
    clbPurView: TCheckListBox;
    TabSheet4: TTabSheet;
    RichEdit1: TRichEdit;
    btnPublish: TButton;
    Button1: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnPublishClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FModuleName: string;
    FPackProject: TPackProject;
    FPlugin: TPluginInformation;
    FpluginState: TPluginState;
    FPluginMgr: TPluginMgr;
    function GetModuleName: string;
    { Private declarations }
  public
    property ModuleName: string read GetModuleName write FModuleName;
    { Public declarations }
  end;

var
  frmPluginProperty: TfrmPluginProperty;

implementation
uses uEnvironment;

{$R *.dfm}

procedure TfrmPluginProperty.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPluginProperty.btnOKClick(Sender: TObject);
begin
  if Length(Trim(edtName.Text)) <> 0 then
    ModalResult := mrOk
  else ModalResult := mrNone;
end;

procedure TfrmPluginProperty.btnPublishClick(Sender: TObject);
var
  Plugin: TPluginInformation;
  function FilePath: string;
  begin
    Result := FPackProject.ProjectInfo.DirectoryInfo.binPlugin + ModuleName + '.plg';
  end;
begin
  if Length(Trim(edtName.Text)) <> 0 then begin
    Plugin := TPluginInformation.Create;
    try
      with plugin do begin
        Caption := edtCnName.Text;
        Name := edtName.Text;
        Author := edtAuthor.Text;
        Remark := edtRemark.Text;
        Version := edtVersion.Text;
        FileName := ModuleName;
        Context.LoadFromFile(FilePath);
        FPluginMgr.PublishModule(Plugin);
      end;
    finally
      FreeAndNil(Plugin);
    end;
    ModalResult := mrOk;
  end
  else ModalResult := mrNone;
end;

procedure TfrmPluginProperty.Button1Click(Sender: TObject);
var
  PackProject: TPackProject;
begin
  PackProject := TPackProject.Create;
  ShowMessage(ExtractFileName(PackProject.ExeName));
  PackProject.Free;
end;

procedure TfrmPluginProperty.FormCreate(Sender: TObject);
begin
  FpluginState := psNone;
  FPackProject := TPackProject.Create;
  FPluginMgr := TPluginMgr.Create;
end;

procedure TfrmPluginProperty.FormShow(Sender: TObject);
begin
  if UpperCase(ExtractFileName(FPackProject.ExeName)) = 'IPACK.DPK' then begin
    FpluginState := psNew;
    caption := '插件 - 【新建】';
  end else
  begin
    FpluginState := psEdit;
    edtName.ReadOnly := True;
    edtName.Color := clMenu;
    edtName.Text := ModuleName;
    caption := '插件 - 【发布】';
  end;
end;

procedure TfrmPluginProperty.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FpackProject);
  FreeAndNil(FPluginMgr);
end;

function TfrmPluginProperty.GetModuleName: string;
begin
  FModuleName := Copy(ExtractFileName(FPackProject.ExeName), 0, Pos('.', ExtractFileName(FPackProject.ExeName)) - 1);
  Result := FModuleName;
end;

end.

