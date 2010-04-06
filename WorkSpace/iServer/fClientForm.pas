unit fClientForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  uROClient, uROClientIntf, uRORemoteService, uROBinMessage;

type
  TClientForm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;

implementation

uses
  fClientDataModule;  
  
{$R *.dfm}

end.
