{*******************************************************}
{                                                       }
{       客户插件                                        }
{                                                       }
{       版权所有 (C) 2009 动力工作室                    }
{                                                       }
{*******************************************************}
unit utestMenu;

interface
uses ToolsAPI, Menus, ShellAPI, Windows, uGlobal;

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
    FSubPluginProject:TMenuItem;

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
  uPackAge, Dialogs,uPluginProject,ProjectSetupForm,uPackProject;

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

  FMainMenu.Items.Add(FSubMenuItem);
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

initialization
  LHCMenu := TLHCMenuWizard.Create;
finalization
  LHCMenu.Free;
end.

