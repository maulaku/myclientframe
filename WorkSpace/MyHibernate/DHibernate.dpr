program DHibernate;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain},
  uInfo in 'uInfo.pas',
  uconst in 'uconst.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

