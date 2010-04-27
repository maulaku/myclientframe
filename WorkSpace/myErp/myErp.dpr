program myErp;

uses
  Forms,
  Controls,
  SysUtils,
  BaseForm in 'source\Common\BaseForm.pas' {frmBase},
  ModalForm in 'source\Common\ModalForm.pas' {frmModal},
  uBase in 'source\Common\uBase.pas',
  uConst in 'FrameWork\uConst.pas',
  MainForm in 'MainForm.pas' {frmMain},
  LoginForm in 'source\Login\LoginForm.pas' {frmLogin},
  configForm in 'source\config\configForm.pas' {frmConfig},
  uGlobal in 'source\Common\uGlobal.pas';

{$R *.res}

begin
  Application.Initialize;
  frmLogin := TfrmLogin.Create(nil);
  if frmLogin.ShowModal = mrok then begin
    FreeAndNil(frmLogin);
    Application.CreateForm(TfrmMain, frmMain);
    Application.Run;
  end else begin
    FreeAndNil(frmLogin);
    Application.Terminate;
  end;


end.

