library test;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  testform1 in 'testform1.pas' {frmTest1},
  BaseForm in '..\..\Common\BaseForm.pas' {frmBase},
  ChildForm in '..\..\Common\ChildForm.pas' {frmChild},
  testForm in 'testForm.pas' {frmTest};

{$R *.res}


//创建MDI窗体
function ShowForm():THandle;
begin
  frmTest := TfrmTest.Create(nil);
  frmTest.Show;
  Result := frmTest.Handle;
end;

//关闭自已
procedure CloseForm;stdcall;
begin
    if assigned(frmTest) then
      FreeAndNil(frmTest);
end;

exports
  ShowForm,
  CloseForm;
  
begin
end.
