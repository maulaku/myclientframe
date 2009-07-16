program DbConfig;

uses
  Forms,
  MainForm in 'MainForm.pas' {frmConfig},
  XMLINI in '..\DataSharePack\XMLINI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmConfig, frmConfig);
  Application.Run;
end.
