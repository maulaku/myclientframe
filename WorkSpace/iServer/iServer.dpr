program iServer;

{#ROGEN:iLibrary.RODL} // RemObjects SDK: Careful, do not remove!

uses
  uROComInit,
  uROComboService,
  Forms,
  fServerForm in 'fServerForm.pas' {ServerForm},
  iService_Impl in 'iService_Impl.pas' {iService: TDARemoteService},
  fServerDataModule in 'fServerDataModule.pas' {ServerDataModule: TDataModule},
  iLibrary_Intf in 'iLibrary_Intf.pas',
  iLibrary_Invk in 'iLibrary_Invk.pas';

{$R *.res}
{$R RODLFile.res}

begin
  if ROStartService('iServer', 'iServer') then begin
    ROService.CreateForm(TServerDataModule, ServerDataModule);
    ROService.Run;
    Exit;
  end;

  Application.Initialize;
  Application.CreateForm(TServerDataModule, ServerDataModule);
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
