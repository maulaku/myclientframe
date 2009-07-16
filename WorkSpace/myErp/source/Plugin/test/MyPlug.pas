unit MyPlug;

interface
uses SysUtils,forms,uClientPlugin;

procedure SHOWDLLFORM;stdcall;
procedure CLOSEDLLFORM;stdcall;

implementation
uses testForm;

//创建MDI窗体
procedure SHOWDLLFORM;
begin
  frmTest := TfrmTest.Create(application);
  frmTest.Show;
end;

//关闭自已
procedure CLOSEDLLFORM;
begin
    if assigned(frmTest) then
      FreeAndNil(frmTest);
end;

end.
