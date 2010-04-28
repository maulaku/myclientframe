program erpServer;

{#ROGEN:erpLibrary.RODL} // RemObjects SDK: Careful, do not remove!

uses
  uROComInit,
  uROComboService,
  Forms,
  fServerForm in 'fServerForm.pas' {ServerForm},
  erpService_Impl in 'erpService_Impl.pas' {erpService: TDARemoteService},
  fServerDataModule in 'fServerDataModule.pas' {ServerDataModule: TDataModule},
  erpLibrary_Intf in 'erpLibrary_Intf.pas',
  erpLibrary_Invk in 'erpLibrary_Invk.pas';

{$R *.res}
{$R RODLFile.res}

begin
  if ROStartService('erpServer', 'erpServer') then begin
    ROService.CreateForm(TServerDataModule, ServerDataModule);
    ROService.Run;
    Exit;
  end;

  Application.Initialize;
  Application.CreateForm(TServerDataModule, ServerDataModule);
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
end.
