unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ImgList, dxBar, ComCtrls, ActnList, uClientPlugin;

const
  WM_MSGCLOSE = WM_User + 100; //定义消息常量; 子窗体关闭.

type
  TfrmMain = class(TfrmBase)
    mbMain: TdxBarManager;
    statMain: TStatusBar;
    alMain: TActionList;
    act_Close: TAction;
    act_CloseAll: TAction;
    Act_Exit: TAction;
    act_reLogin: TAction;
    act_Lock: TAction;
    act_About: TAction;
    act_Access: TAction;
    bsiSystem: TdxBarSubItem;
    bbCloseAll: TdxBarButton;
    bbExit: TdxBarButton;
    bbReLogin: TdxBarButton;
    bbLock: TdxBarButton;
    bbClose: TdxBarButton;
    act_Config: TAction;
    bbConfig: TdxBarButton;
    Act_Test: TAction;
    bbTest: TdxBarButton;
    act_Test1: TAction;
    dxBarButton1: TdxBarButton;
    procedure act_CloseExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure act_ConfigExecute(Sender: TObject);
    procedure Act_ExitExecute(Sender: TObject);
    procedure act_Test1Execute(Sender: TObject);
    procedure Act_TestExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FPluginMgr: TClientFrame;
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses uConst, configForm;

{$R *.dfm}

procedure TfrmMain.act_CloseExecute(Sender: TObject);
begin
  inherited;
  FPluginMgr.UnLoad(self.ActiveMDIChild.Handle);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FPluginMgr);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
  FPluginMgr := TClientFrame.Create(nil);
end;

procedure TfrmMain.act_ConfigExecute(Sender: TObject);
var
  frmConfig: TFrmconfig;
begin
  inherited;
  frmConfig := TfrmConfig.Create(nil);
  try
    frmConfig.ShowModal;
  finally
    FreeAndnil(frmConfig);
  end;
end;

procedure TfrmMain.Act_ExitExecute(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmMain.act_Test1Execute(Sender: TObject);
begin
  inherited;
  FPluginMgr.Load('test1.dll');
end;

procedure TfrmMain.Act_TestExecute(Sender: TObject);
begin
  inherited;
  FPluginMgr.Load('test.dll');
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if showWarningA('确定退出系统?') = mrOk then begin
    CanClose := True;
  end else CanClose := False;
end;

end.

