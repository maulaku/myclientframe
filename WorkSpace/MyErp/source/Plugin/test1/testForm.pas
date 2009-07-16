unit testForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildForm, ActnList, dxBar, ImgList, DB, ADODB, dsshare, Grids,
  DBGrids, DBAccess, Uni, MemDS, StdCtrls, OracleUniProvider,uPlugin,
  UniProvider;

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

{$R *.dfm}

procedure TfrmTest.Button1Click(Sender: TObject);
begin
//  if plugin.Frame.LocalDB.Connected then
//  UniQuery1.Connection := plugin.Frame.LocalDB;
//  UniQuery1.SQL.Text := 'select * from company';
//  UniQuery1.Open;
end;

end.

