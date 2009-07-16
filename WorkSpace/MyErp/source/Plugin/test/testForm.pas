unit testForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildForm, ActnList, dxBar, ImgList, DB, ADODB, StdCtrls, Grids,
  DBGrids, DBAccess, Uni, MemDS,dsShare;

type
  TfrmTest = class(TfrmChild)
    UniQuery1: TUniQuery;
    UniDataSource1: TUniDataSource;
    dbgrd1: TDBGrid;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTest: TfrmTest;

implementation

uses
  uPlugin;

{$R *.dfm}

procedure TfrmTest.Button1Click(Sender: TObject);
begin
//  UniQuery1.Connection := Plugin.Frame.LocalDB;
//  UniQuery1.SQL.Text := 'select * from TSYS_EMPLOYEE';
//  UniQuery1.Open;
end;

end.
