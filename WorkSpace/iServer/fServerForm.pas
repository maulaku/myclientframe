{********************************************************

动力信息管理系统                                        
版权所有 (C) 2010 动力信息技术有限公司                  
软件功能:  服务实现单元

*********************************************************}


unit fServerForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  uDAPoweredByDataAbstractButton, uROPoweredByRemObjectsButton;

type
  TServerForm = class(TForm)
    DAPoweredByDataAbstractButton1: TDAPoweredByDataAbstractButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerForm: TServerForm;

implementation

{$R *.dfm}

end.
