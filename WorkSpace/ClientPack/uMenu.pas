{*******************************************************}
{                                                       }
{       客户插件                                        }
{                                                       }
{       版权所有 (C) 2009 动力工作室                    }
{                                                       }
{*******************************************************}
unit uMenu;

interface
uses ToolsAPI, Menus, ShellAPI, Windows;

type
  TAddMenuEvent = procedure(Sender: TObject) of object;
  TLHCMenuWizard = class(TNotifierObject, IOTAWizard)
  private
    FMainMenu: TMainMenu;
    FOnClick: TAddMenuEvent;

    FSubCompart: TMenuItem;
    FSubCompileByDebug: TMenuItem;
    FSubCompileByRelease: TMenuItem;
    FSubConfig: TMenuItem;
    FSubDLL: TMenuItem;
    FSubForm: TMenuItem;
    FSubMenuItem: TMenuItem;
    FSubRun: TMenuItem;
    FSubUnit: TMenuItem;
    FSubText: TMenuItem;

    FSubApplication: TMenuItem;
    FSubConsole: TMenuItem;
    FSubPackage: TMenuItem;

    //插件工程
    FSubPluginProject: TMenuItem;

    procedure OnCreateDllProjectClick(Sender: TObject);
    procedure OnCreateApplicationClick(Sender: TObject);
    procedure OnCreatePackageClick(Sender: TObject);
    procedure OnCreateConsoleClick(Sender: TObject);

    procedure OnCreateFormClick(Sender: TObject);
    procedure OnCreateUnitClick(Sender: TObject);
    procedure OnCreateTextClick(Sender: TObject);

    procedure OnCompileDebugClick(Sender: TObject);
    procedure OnCompileReleaseClick(Sender: TObject);
    procedure OnRunClick(Sender: TObject);

    procedure ONPluginProject(Sender: TObject);

    procedure OnPerFerenceClick(Sender: TObject);
  public
    destructor Destroy; override;
    procedure AddMenu;
    procedure Execute;
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
  published
    property OnClick: TAddMenuEvent read FOnClick write FOnClick;
  end;

var LHCMenu: TLHCMenuWizard;

procedure Register;

implementation
uses uConst, uDll, uForm, perferencesForm, SysUtils, Controls, uText, uConsole, uApplication, uUnit,
  uPackAge, Dialogs, uPluginProject, uPackProject, PluginPropertyForm;

{
******************************** TLHCMenuWizard ********************************
}

destructor TLHCMenuWizard.Destroy;
begin
  if Assigned(FSubMenuItem) then
    FSubMenuItem.Free;
end;

procedure TLHCMenuWizard.AddMenu;

  {-------------------------------------------------------------------------------
    过程名:    TLHCMenuWizard.AddMenu
    作者:      developer
    日期:      2009.04.04
    参数:      无
    返回值:    无
    详细说明:  向IDE添加菜单
  -------------------------------------------------------------------------------}

begin
  FMainMenu := (BorlandIDEServices as INTAServices).MainMenu;


  FSubMenuItem := TMenuItem.Create(FMainMenu);
  FSubMenuItem.Name := 'smCaption';
  FSubMenuItem.Caption := sMenuCaption;

  //配置
  FSubConfig := TMenuItem.Create(FSubMenuItem);
  FSubConfig.Name := 'smConfig';
  FSubConfig.Caption := '首选项';
  FSubConfig.OnClick := OnPerFerenceClick;
  FSubMenuItem.Add(FSubConfig);

    //新建分隔符
  FSubCompart := TMenuItem.Create(FSubMenuItem);
  FSubCompart.Name := 'smSubCompart';
  FSubCompart.Caption := '-';
  FSubMenuItem.Add(FSubCompart);

  //新建窗体
  FSubForm := TMenuItem.Create(FSubMenuItem);
  FSubForm.Name := 'smForm';
  FSubForm.Caption := '新建窗体';
  //将菜单关联到一个事件;
  FSubForm.OnClick := OnCreateFormClick;
  FSubMenuItem.Add(FSubForm);

  //新建单元
  FSubUnit := TMenuItem.Create(FSubMenuItem);
  FSubUnit.Name := 'smUnit';
  FSubUnit.Caption := '新建单元';
  FSubUnit.OnClick := OnCreateUnitClick;
  FSubMenuItem.Add(FSubUnit);

    //新建应用程序
  FSubApplication := TMenuItem.Create(FSubMenuItem);
  FSubApplication.Name := 'smApplication';
  FSubApplication.Caption := '应用程序向导';
  FSubApplication.OnClick := OnCreateApplicationClick;
  FSubMenuItem.Add(FSubApplication);

    //新建控制台
  FSubConsole := TMenuItem.Create(FSubMenuItem);
  FSubConsole.Name := 'smConsole';
  FSubConsole.Caption := '控制台应用程序';
  FSubConsole.OnClick := OnCreateConsoleClick;
  FSubMenuItem.Add(FSubConsole);

    //新建包
  FSubPackage := TMenuItem.Create(FSubMenuItem);
  FSubPackage.Name := 'smPackage';
  FSubPackage.Caption := '新建包';
  FSubPackage.OnClick := OnCreatePackageClick;
  FSubMenuItem.Add(FSubPackage);

      //新建包
  FSubText := TMenuItem.Create(FSubMenuItem);
  FSubText.Name := 'smText';
  FSubText.Caption := '新建文本文件';
  FSubText.OnClick := OnCreateTextClick;
  FSubMenuItem.Add(FSubText);

  //新建Dll工程
  FSubDLL := TMenuItem.Create(FSubMenuItem);
  FSubDLL.Name := 'smCreateLibrary';
  FSubDLL.Caption := '新建Dll工程';
  FSubDLL.OnClick := OnCreateDllProjectClick;
  FSubMenuItem.Add(FSubDLL);

      //新建分隔符
  FSubCompart := TMenuItem.Create(FSubMenuItem);
  FSubCompart.Name := 'smSubCompart1';
  FSubCompart.Caption := '-';
  FSubMenuItem.Add(FSubCompart);

  //运行
  FSubRun := TMenuItem.Create(FSubMenuItem);
  FSubRun.Name := 'smRun';
  FSubRun.Caption := '运行';
  FSubRun.OnClick := OnRunClick;
  FSubMenuItem.Add(FSubRun);

      //新建分隔符
  FSubCompart := TMenuItem.Create(FSubMenuItem);
  FSubCompart.Name := 'smSubCompart2';
  FSubCompart.Caption := '-';
  FSubMenuItem.Add(FSubCompart);

  //编译--调式
  FSubCompileByDebug := TMenuItem.Create(FSubMenuItem);
  FSubCompileByDebug.Name := 'smCompileByDebug';
  FSubCompileByDebug.Caption := '编译-调试方式';
  FSubCompileByDebug.OnClick := onCompileDebugClick;
  FSubMenuItem.Add(FSubCompileByDebug);

  //编译--发布模式
  FSubCompileByRelease := TMenuItem.Create(FSubMenuItem);
  FSubCompileByRelease.Name := 'smCompileByRelease';
  FSubCompileByRelease.Caption := '编译-发布方式';
  FSubCompileByRelease.OnClick := onCompileReleaseClick;
  FSubMenuItem.Add(FSubCompileByRelease);

  FSubPluginProject := TMenuItem.Create(FSubMenuItem);
  FSubPluginProject.Name := 'smSubPluginProject';
  FSubPluginProject.Caption := '插件工程';
  FSubPluginProject.OnClick := ONPluginProject;
  FSubMenuItem.Add(FSubPluginProject);

  FMainMenu.Items.Insert(8, FSubMenuItem); //可以控制菜单要添加的位置。
end;

procedure TLHCMenuWizard.Execute;
begin
end;

function TLHCMenuWizard.GetIDString: string;
begin
  Result := 'Menu.Demo';
end;

function TLHCMenuWizard.GetName: string;
begin
  Result := 'Menu Wizard';
end;

function TLHCMenuWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TLHCMenuWizard.OnCreateDllProjectClick(Sender: TObject);
var
  LHCDllCreatorWizard: TLHCDLLCreatorWizard;
begin
  LHCDLLCreatorWizard := TLHCDLLCreatorWizard.Create;
  LHCDLLCreatorWizard.Execute;
  LHCDLLCreatorWizard.Free;
end;

procedure TLHCMenuWizard.OnCreateFormClick(Sender: TObject);

  {-------------------------------------------------------------------------------
    过程名:    TLHCMenuWizard.TestClick
    作者:      罗华春
    日期:      2009.04.18
    参数:      Sender: TObject
    返回值:    无
    详细说明:  触发的某个事件.在这里是菜单的'测试'按钮将触发这个事件;
    更新时间:  2009.04.18
    更新说明:
  -------------------------------------------------------------------------------}
var
  FormWizard: TLHCFormCreatorWizard;
begin
  FormWizard := TLHCFormCreatorWizard.Create;
  FormWizard.Execute;
  FormWizard.Free;
end;

procedure Register;
begin
  LHCMenu.AddMenu;
end;

procedure TLHCMenuWizard.OnPerFerenceClick(Sender: TObject);
var
  frmPerferences: TfrmPerferences;
begin
  frmPerferences := TfrmPerferences.Create(nil);
  try
    with frmPerferences do
    begin
      if ShowModal = MrOk then
      begin

      end;
    end;
  finally
    FreeAndNil(frmPerferences);
  end;

end;

procedure TLHCMenuWizard.OnCreateApplicationClick(Sender: TObject);
var
  LHCApplicationCreatorWizard: TLHCApplicationCreatorWizard;
begin
  LHCApplicationCreatorWizard := TLHCApplicationCreatorWizard.Create;
  LHCApplicationCreatorWizard.Execute;
  LHCApplicationCreatorWizard.Free;
end;

procedure TLHCMenuWizard.OnCreateConsoleClick(Sender: TObject);
var
  LHCConsoleCreatorWizard: TLHCConsoleCreatorWizard;
begin
  LHCConsoleCreatorWizard := TLHCConsoleCreatorWizard.Create;
  LHCConsoleCreatorWizard.Execute;
  LHCConsoleCreatorWizard.Free;
end;

procedure TLHCMenuWizard.OnCreatePackageClick(Sender: TObject);
var
  LHCPackageCreatorWizard: TLHCPackageCreatorWizard;
begin
  LHCPackageCreatorWizard := TLHCPackageCreatorWizard.Create;
  LHCPackageCreatorWizard.Execute;
  LHCPackageCreatorWizard.Free;
end;

procedure TLHCMenuWizard.OnCreateTextClick(Sender: TObject);
var
  LHCTextCreatorWizard: TLHCTextCreatorWizard;
begin
  LHCTextCreatorWizard := TLHCTextCreatorWizard.Create;
  LHCTextCreatorWizard.Execute;
  LHCTextCreatorWizard.Free;
end;

procedure TLHCMenuWizard.OnCreateUnitClick(Sender: TObject);
var
  LHCUnitCreatorWizard: TLHCUnitCreatorWizard;
begin
  LHCUnitCreatorWizard := TLHCUnitCreatorWizard.Create;
  LHCUnitCreatorWizard.Execute;
  LHCUnitCreatorWizard.Free;
end;

procedure TLHCMenuWizard.OnCompileDebugClick(Sender: TObject);
var
  MyProject: TPackProject;
begin
  MyProject := TPackProject.Create;
  MyProject.Compile(cmDebug);
  MyProject.Free;
end;

procedure TLHCMenuWizard.OnRunClick(Sender: TObject);
var
  MyProject: TPackProject;
begin
  MyProject := TPackProject.Create;
  MyProject.Run;
  MyProject.Free;
end;

procedure TLHCMenuWizard.ONPluginProject(Sender: TObject);
{-------------------------------------------------------------------------------
  过程名:    TLHCMenuWizard.ONPluginProject
  作者:      luohuachun
  日期:      2009.05.04 22:11:26
  参数:      Sender: TObject
  返回值:    无
  详细说明:  新建插件工程
-------------------------------------------------------------------------------}
var
  LHCPluginCreatorWizard: TLHCPluginCreatorWizard;
  FProjectName: string;
  frmPluginProperty: TfrmPluginProperty;
begin
  FProjectName := '';

  frmPluginProperty := TfrmPluginProperty.Create(nil);
  try
    with frmPluginProperty do begin
      if ShowModal = MrOk then begin
        FProjectName := edtName.Text;
      end
    end;
  finally
    FreeAndNil(frmPluginProperty);
  end;

  if Length(Trim(FProjectName)) = 0 then exit;

  LHCPluginCreatorWizard := TLHCPluginCreatorWizard.Create;
  LHCPluginCreatorWizard.FProjectName := FProjectName;
  LHCPluginCreatorWizard.Execute;
  LHCPluginCreatorWizard.Free;

end;

procedure TLHCMenuWizard.OnCompileReleaseClick(Sender: TObject);
var
  MyProject: TPackProject;
begin
  MyProject := TPackProject.Create;
  MyProject.Compile(cmRelease);
  MyProject.Free;
end;

initialization
  LHCMenu := TLHCMenuWizard.Create;
finalization
  LHCMenu.Free;
end.

