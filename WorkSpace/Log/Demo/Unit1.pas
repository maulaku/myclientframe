unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,SimpleLogger, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FOnEvent: TLogEvent;
    { Private declarations }
  protected
    procedure WriteLog(aType: Integer; S: string);
  public
    { Public declarations }
  published
    property OnEvent: TLogEvent read FOnEvent write FOnEvent;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  OnEvent := log.HandleLog;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  WriteLog(1,'你好,这是日志');
end;

procedure TForm1.WriteLog(aType: Integer; S: string);
begin
  if Assigned(FOnEvent) then FOnEvent(Self, aType, S);
end;

end.
