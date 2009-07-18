program DHibernate;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain},
  uInfo in 'uInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

