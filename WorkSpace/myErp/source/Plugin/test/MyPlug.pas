unit MyPlug;

interface
uses SysUtils,forms,uClientPlugin;

Function SHOWDLLFORM:THandle;stdcall;
procedure CLOSEDLLFORM;stdcall;

implementation
uses testForm;

//����MDI����
Function SHOWDLLFORM:THandle;
begin
  frmTest := TfrmTest.Create(application);
  frmTest.Show;
  Result := frmTest.Handle;
end;

//�ر�����
procedure CLOSEDLLFORM;
begin
    if assigned(frmTest) then
      FreeAndNil(frmTest);
end;

end.
