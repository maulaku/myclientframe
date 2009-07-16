unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, ImgList, dxBar, ComCtrls, ActnList,uClientPlugin;

const
  WM_MSGCLOSE = WM_User + 100; //定义消息常量;

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
    act_Order: TAction;
    bbOrder: TdxBarButton;
    dxBarButton1: TdxBarButton;
    procedure act_CloseExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure act_ConfigExecute(Sender: TObject);
    procedure Act_ExitExecute(Sender: TObject);
    procedure act_OrderExecute(Sender: TObject);
    procedure Act_TestExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dxBarButton1Click(Sender: TObject);
  private
    FClientFrame: TClientFrame;
    { Private declarations }
  protected
    procedure WNDProc(var msg: TMessage); override;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses uConst;

{$R *.dfm}



procedure TfrmMain.act_CloseExecute(Sender: TObject);
{-------------------------------------------------------------------------------
  过程名:    TfrmMain.act_CloseExecute
  作者:      luohuachun
  日期:      2009.07.05
  参数:      Sender: TObject
  返回值:    无
  详细说明:  关闭窗体；

-------------------------------------------------------------------------------}
begin
  inherited;
//  if Self.MDIChildCount > 0 then
//    FClientFrame.FreePlugin(self.ActiveMDIChild.Handle);
end;



procedure TfrmMain.FormDestroy(Sender: TObject);
{-------------------------------------------------------------------------------
  过程名:    TfrmMain.FormDestroy
  作者:      luohuachun
  日期:      2009.07.05
  参数:      Sender: TObject
  返回值:    无
  详细说明:  释放插件管理对象;

-------------------------------------------------------------------------------}
begin
  inherited;
  FreeAndNil(FClientFrame);
end;



procedure TfrmMain.FormCreate(Sender: TObject);
{-------------------------------------------------------------------------------
  过程名:    TfrmMain.FormCreate
  作者:      luohuachun
  日期:      2009.07.05
  参数:      Sender: TObject
  返回值:    无
  详细说明:  创建插件管理对象;

-------------------------------------------------------------------------------}
begin
  inherited;
  FClientFrame := TClientFrame.Create(Application);
end; 

procedure TfrmMain.act_ConfigExecute(Sender: TObject);
{-------------------------------------------------------------------------------
  过程名:    TfrmMain.act_ConfigExecute
  作者:      luohuachun
  日期:      2009.07.05
  参数:      Sender: TObject
  返回值:    无
  详细说明:  打开配置窗体

-------------------------------------------------------------------------------}
//var
//  frmConfig: TFrmconfig;
begin
  inherited;
//  frmConfig := TfrmConfig.Create(nil);
//  try
//    frmConfig.ShowModal;
//  finally
//    FreeAndnil(frmConfig);
//  end;
end;



procedure TfrmMain.Act_ExitExecute(Sender: TObject);
{-------------------------------------------------------------------------------
  过程名:    TfrmMain.Act_ExitExecute
  作者:      luohuachun
  日期:      2009.07.05
  参数:      Sender: TObject
  返回值:    无
  详细说明:  退出应用程序

-------------------------------------------------------------------------------}
begin
  inherited;
  close;
end;

procedure TfrmMain.act_OrderExecute(Sender: TObject);
begin
  inherited;
  FClientFrame.LoadPlugin('order.dll');
end;

procedure TfrmMain.Act_TestExecute(Sender: TObject);
begin
  inherited;
  FClientFrame.LoadPlugin('test.dll');
end;



procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
{-------------------------------------------------------------------------------
  过程名:    TfrmMain.FormCloseQuery
  作者:      luohuachun
  日期:      2009.07.05
  参数:      Sender: TObject; var CanClose: Boolean
  返回值:    无
  详细说明:  退出窗体前询问

-------------------------------------------------------------------------------}
begin
  inherited;
  if showWarningA('确定退出系统?') = mrOk then begin
    CanClose := True;
  end else CanClose := False;
end;


procedure TfrmMain.WNDProc(var msg: TMessage);

{-------------------------------------------------------------------------------
  过程名:    TfrmMain.WNDProc
  作者:      luohuachun
  日期:      2009.07.05
  参数:      var msg: TMessage
  返回值:    无
  详细说明:  截获一个窗体关闭事件。

-------------------------------------------------------------------------------}
begin
  inherited;
  if msg.Msg = WM_MSGCLOSE then begin
    FClientFrame.UnLoadPlugin(msg.WParam);
  end;
end;

procedure TfrmMain.dxBarButton1Click(Sender: TObject);
{-------------------------------------------------------------------------------
  过程名:    TfrmMain.dxBarButton1Click
  作者:      luohuachun
  日期:      2009.07.05
  参数:      Sender: TObject
  返回值:    无
  详细说明:  测试一个插件是否工作正常。

-------------------------------------------------------------------------------}
begin
  inherited;
  FClientFrame.LoadPlugin('test1.dll');
end;

end.

