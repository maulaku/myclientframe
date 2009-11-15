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
  MainForm in 'MainForm.pas' {frmMain},
  LoginForm in 'source\Login\LoginForm.pas' {frmLogin},
  configForm in 'source\config\configForm.pas' {frmConfig},
  uGlobal in 'source\Common\uGlobal.pas',
  uClientPlugin in '..\ClientPack\uClientPlugin.pas' {LHCClientPlugin: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  PluginMgr := TLHCClientFrame.Create(nil);
  if PluginMgr.isLinkDB then begin
    frmLogin := TfrmLogin.Create(nil);
    if frmLogin.ShowModal = mrok then begin
      FreeAndNil(frmLogin);
      Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
    end else begin
      FreeAndNil(frmLogin);
      FreeAndNil(PluginMgr);
      Application.Terminate;
    end;
  end else begin
    FreeAndNil(PluginMgr);
    Application.Terminate;
  end;


end.

