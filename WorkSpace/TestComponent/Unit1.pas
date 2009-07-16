unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uComponent, StdCtrls;

type
  TForm1 = class(TForm)
    Person1: TPerson;
    Button1: TButton;
    Department1: TDepartment;
    procedure Button1Click(Sender: TObject);
    procedure Person1Birthday(Sender: TObject; iAge: Integer; sName: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Person1.ask;
end;

procedure TForm1.Person1Birthday(Sender: TObject; iAge: Integer; sName: string);
begin
  ShowMessage(sname);
end;

end.
