unit testForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildForm, ActnList, dxBar, ImgList, DB, ADODB;

type
  TfrmTest = class(TfrmChild)
    qry1: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTest: TfrmTest;

implementation

{$R *.dfm}

end.
