program myErp;

uses
  Forms,
  Controls,
  SysUtils,
  BaseForm in 'source\Common\BaseForm.pas' {frmBase},
  ModalForm in 'source\Common\ModalForm.pas' {frmModal},
  uCurrentPersonInfo in 'FrameWork\uCurrentPersonInfo.pas',
  uCompany in 'FrameWork\uCompany.pas',
  uDBMgr in 'FrameWork\uDBMgr.pas',
  uBase in 'source\Common\uBase.pas',
  uConst in 'FrameWork\uConst.pas',
  uConfig in 'source\Common\uConfig.pas',
  MainForm in 'MainForm.pas' {frmMain},
  LoginForm in 'source\Login\LoginForm.pas' {frmLogin};

{$R *.res}
var
  frmLogin: TfrmLogin;
begin
  Application.Initialize;
  frmLogin := TfrmLogin.Create(nil);
  if frmLogin.ShowModal = mrok then begin
    FreeAndNil(frmLogin);
    Application.CreateForm(TfrmMain, frmMain);
    Application.CreateForm(TfrmLogin, frmLogin);
    Application.Run;
  end else begin
    FreeAndNil(frmLogin);
    Application.Terminate;
  end;
end.

