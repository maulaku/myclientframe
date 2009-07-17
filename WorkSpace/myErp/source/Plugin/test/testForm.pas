unit testForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildForm, ActnList, dxBar, ImgList, DB, ADODB, DBAccess, Uni,
  MemDS, Grids, DBGrids, StdCtrls;

type
  TfrmTest = class(TfrmChild)
    DBGrid1: TDBGrid;
    UniQuery1: TUniQuery;
    UniDataSource1: TUniDataSource;
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
  inherited;
  UniQuery1.Connection := Plugin.ClientFrame.LocalDB;
  UniQuery1.Close;
  UniQuery1.SQL.Text := 'select * from company';
  UniQuery1.Open;
end;

end.
