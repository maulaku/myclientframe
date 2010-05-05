unit uMyDialogs;

interface
uses Forms,Windows,Dialogs;  

type
  TMessageBox = class(TObject)
  public
    class function ConfireWarning(aMessage: String): Integer;
    class procedure ShowError(const aMessage: string);
    class procedure ShowWarning(aMessage: string);
  end;

implementation


class function TMessageBox.ConfireWarning(aMessage: String): Integer;
begin
  Result := MessageDlg(aMessage,mtWarning,[mbYes,mbNo],0)
end;

class procedure TMessageBox.ShowError(const aMessage: string);
begin
  MessageDlg(aMessage,mtError,[mbOK],0);
end;

class procedure TMessageBox.ShowWarning(aMessage: string);
begin
  MessageDlg(aMessage,mtWarning,[mbOK],0);
end;

end.
