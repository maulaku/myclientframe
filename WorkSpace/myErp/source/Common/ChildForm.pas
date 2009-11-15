unit ChildForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ImgList, ActnList, dxBar, StdCtrls;
  
 
type
  TfrmChild = class(TfrmBase)
    bmChild: TdxBarManager;
    AlClient: TActionList;
    act_Refresh: TAction;
    act_New: TAction;
    act_Update: TAction;
    act_Delete: TAction;
    act_Find: TAction;
    act_Print: TAction;
    act_Export: TAction;
    bbRefresh: TdxBarButton;
    bbNew: TdxBarButton;
    bbDelete: TdxBarButton;
    bbUpdate: TdxBarButton;
    bbFind: TdxBarButton;
    bbPrint: TdxBarButton;
    bbExport: TdxBarButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChild: TfrmChild;

implementation

{$R *.dfm}

end.
