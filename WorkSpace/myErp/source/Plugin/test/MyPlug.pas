unit MyPlug;

interface
uses SysUtils,forms,uClientPlugin;

procedure SHOWDLLFORM;stdcall;
procedure CLOSEDLLFORM;stdcall;

implementation
uses testForm;

//����MDI����
procedure SHOWDLLFORM;
begin
  frmTest := TfrmTest.Create(application);
  frmTest.Show;
end;

//�ر�����
procedure CLOSEDLLFORM;
begin
    if assigned(frmTest) then
      FreeAndNil(frmTest);
end;

end.
