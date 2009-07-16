unit MyPlug;

interface
uses SysUtils,forms,uClientPlugin;

Function SHOWDLLFORM:THandle;stdcall;
procedure CLOSEDLLFORM;stdcall;

implementation
uses testForm;

//创建MDI窗体
Function SHOWDLLFORM:THandle;
begin
  frmTest := TfrmTest.Create(application);
  frmTest.Show;
  Result := frmTest.Handle;
end;

//关闭自已
procedure CLOSEDLLFORM;
begin
    if assigned(frmTest) then
      FreeAndNil(frmTest);
end;

end.
