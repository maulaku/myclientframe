unit testForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildForm, ActnList, dxBar, ImgList, DB, ADODB, StdCtrls;

type
  TfrmTest = class(TfrmChild)
    Button1: TButton;
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
