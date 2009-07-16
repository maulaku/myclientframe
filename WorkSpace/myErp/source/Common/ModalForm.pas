unit ModalForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ImgList, StdCtrls, Buttons, ExtCtrls;

type
  TfrmModal = class(TfrmBase)
    pnlBottom: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModal: TfrmModal;

implementation

{$R *.dfm}

procedure TfrmModal.FormKeyDown(Sender: TObject; var Key: Word; Shift:
  TShiftState);
begin
  inherited;
      //加车切换到下一个控件。
  if (Key = VK_DOWN) or (Key = 13) then
    SelectNext(ActiveControl, True, True);
end;

end.
