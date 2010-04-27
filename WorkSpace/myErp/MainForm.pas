unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ImgList, dxBar, ComCtrls, ActnList, uClientPlugin,uMyDialogs,
  Tabs,uGlobal, RzTabs;

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
    Page: TRzPageControl;
    procedure act_CloseAllExecute(Sender: TObject);
    procedure act_CloseExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure act_ConfigExecute(Sender: TObject);
    procedure Act_ExitExecute(Sender: TObject);
    procedure act_Test1Execute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Act_TestExecute(Sender: TObject);
  private
    { Private declarations }
    procedure load(PluginName:string);
    procedure unload(Index: Integer);overload;
    procedure unload;overload;
    procedure unloadAll;
  protected
  public
//    FPluginMgr:TLHCClientFrame;
    constructor Create(Aowner:TComponent);override;
//    constructor Create(Aowner:TComponent;APluginMgr:TLHCClientFrame);reintroduce;overload;
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
//  if self.ActiveMDIChild <> nil then
//  ShowMessage(IntToStr(TForm(Page.Pages[0].Controls[0]).Handle));
//  if Page.ActivePageIndex = 0 then exit;
  if page.PageCount = 0 then exit;
  
  PluginMgr.UnLoad(TForm(Page.Pages[Page.ActivePageIndex].Controls[0]).Handle);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(PluginMgr);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
//  PluginMgr := TLHCClientFrame.Create(nil);
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
  Close;
end;

procedure TfrmMain.act_Test1Execute(Sender: TObject);
begin
  inherited;
  Load('order1.plg');
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if TMessageBox.ConfireWarning('确定退出系统?') = mrYes then begin
    CanClose := True;
  end else CanClose := False;
end; 

constructor TfrmMain.Create(Aowner: TComponent);
begin
  inherited Create(Aowner);
end;

procedure TfrmMain.act_CloseAllExecute(Sender: TObject);
begin
  inherited;
  unloadAll;
end;

procedure TfrmMain.Act_TestExecute(Sender: TObject);
begin
  inherited;
  load('order.plg');
end;

procedure TfrmMain.load(PluginName: string);
begin
  PluginMgr.Load(PluginName,page);
end;

procedure TfrmMain.unload(Index: Integer);
begin
  PluginMgr.UnLoad(TForm(Page.Pages[Index].Controls[0]).Handle);
end;

procedure TfrmMain.unload;
begin
  unload(Page.ActivePageIndex);
end;

procedure TfrmMain.unloadAll;
var
  i: Integer;
begin
  for i := page.pagecount-1 downto 0 do
    unload(i); 
end;

end.

