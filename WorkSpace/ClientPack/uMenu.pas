{*******************************************************}
{                                                       }
{       �ͻ����                                        }
{                                                       }
{       ��Ȩ���� (C) 2009 ����������                    }
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

    //�������
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
    ������:    TLHCMenuWizard.AddMenu
    ����:      developer
    ����:      2009.04.04
    ����:      ��
    ����ֵ:    ��
    ��ϸ˵��:  ��IDE��Ӳ˵�
  -------------------------------------------------------------------------------}

begin
  FMainMenu := (BorlandIDEServices as INTAServices).MainMenu;


  FSubMenuItem := TMenuItem.Create(FMainMenu);
  FSubMenuItem.Name := 'smCaption';
  FSubMenuItem.Caption := sMenuCaption;

  //����
  FSubConfig := TMenuItem.Create(FSubMenuItem);
  FSubConfig.Name := 'smConfig';
  FSubConfig.Caption := '��ѡ��';
  FSubConfig.OnClick := OnPerFerenceClick;
  FSubMenuItem.Add(FSubConfig);

    //�½��ָ���
  FSubCompart := TMenuItem.Create(FSubMenuItem);
  FSubCompart.Name := 'smSubCompart';
  FSubCompart.Caption := '-';
  FSubMenuItem.Add(FSubCompart);

  //�½�����
  FSubForm := TMenuItem.Create(FSubMenuItem);
  FSubForm.Name := 'smForm';
  FSubForm.Caption := '�½�����';
  //���˵�������һ���¼�;
  FSubForm.OnClick := OnCreateFormClick;
  FSubMenuItem.Add(FSubForm);

  //�½���Ԫ
  FSubUnit := TMenuItem.Create(FSubMenuItem);
  FSubUnit.Name := 'smUnit';
  FSubUnit.Caption := '�½���Ԫ';
  FSubUnit.OnClick := OnCreateUnitClick;
  FSubMenuItem.Add(FSubUnit);

    //�½�Ӧ�ó���
  FSubApplication := TMenuItem.Create(FSubMenuItem);
  FSubApplication.Name := 'smApplication';
  FSubApplication.Caption := 'Ӧ�ó�����';
  FSubApplication.OnClick := OnCreateApplicationClick;
  FSubMenuItem.Add(FSubApplication);

    //�½�����̨
  FSubConsole := TMenuItem.Create(FSubMenuItem);
  FSubConsole.Name := 'smConsole';
  FSubConsole.Caption := '����̨Ӧ�ó���';
  FSubConsole.OnClick := OnCreateConsoleClick;
  FSubMenuItem.Add(FSubConsole);

    //�½���
  FSubPackage := TMenuItem.Create(FSubMenuItem);
  FSubPackage.Name := 'smPackage';
  FSubPackage.Caption := '�½���';
  FSubPackage.OnClick := OnCreatePackageClick;
  FSubMenuItem.Add(FSubPackage);

      //�½���
  FSubText := TMenuItem.Create(FSubMenuItem);
  FSubText.Name := 'smText';
  FSubText.Caption := '�½��ı��ļ�';
  FSubText.OnClick := OnCreateTextClick;
  FSubMenuItem.Add(FSubText);

  //�½�Dll����
  FSubDLL := TMenuItem.Create(FSubMenuItem);
  FSubDLL.Name := 'smCreateLibrary';
  FSubDLL.Caption := '�½�Dll����';
  FSubDLL.OnClick := OnCreateDllProjectClick;
  FSubMenuItem.Add(FSubDLL);

      //�½��ָ���
  FSubCompart := TMenuItem.Create(FSubMenuItem);
  FSubCompart.Name := 'smSubCompart1';
  FSubCompart.Caption := '-';
  FSubMenuItem.Add(FSubCompart);

  //����
  FSubRun := TMenuItem.Create(FSubMenuItem);
  FSubRun.Name := 'smRun';
  FSubRun.Caption := '����';
  FSubRun.OnClick := OnRunClick;
  FSubMenuItem.Add(FSubRun);

      //�½��ָ���
  FSubCompart := TMenuItem.Create(FSubMenuItem);
  FSubCompart.Name := 'smSubCompart2';
  FSubCompart.Caption := '-';
  FSubMenuItem.Add(FSubCompart);

  //����--��ʽ
  FSubCompileByDebug := TMenuItem.Create(FSubMenuItem);
  FSubCompileByDebug.Name := 'smCompileByDebug';
  FSubCompileByDebug.Caption := '����-���Է�ʽ';
  FSubCompileByDebug.OnClick := onCompileDebugClick;
  FSubMenuItem.Add(FSubCompileByDebug);

  //����--����ģʽ
  FSubCompileByRelease := TMenuItem.Create(FSubMenuItem);
  FSubCompileByRelease.Name := 'smCompileByRelease';
  FSubCompileByRelease.Caption := '����-������ʽ';
  FSubCompileByRelease.OnClick := onCompileReleaseClick;
  FSubMenuItem.Add(FSubCompileByRelease);

  FSubPluginProject := TMenuItem.Create(FSubMenuItem);
  FSubPluginProject.Name := 'smSubPluginProject';
  FSubPluginProject.Caption := '�������';
  FSubPluginProject.OnClick := ONPluginProject;
  FSubMenuItem.Add(FSubPluginProject);

  FMainMenu.Items.Insert(8, FSubMenuItem); //���Կ��Ʋ˵�Ҫ��ӵ�λ�á�
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
    ������:    TLHCMenuWizard.TestClick
    ����:      �޻���
    ����:      2009.04.18
    ����:      Sender: TObject
    ����ֵ:    ��
    ��ϸ˵��:  ������ĳ���¼�.�������ǲ˵���'����'��ť����������¼�;
    ����ʱ��:  2009.04.18
    ����˵��:
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
  ������:    TLHCMenuWizard.ONPluginProject
  ����:      luohuachun
  ����:      2009.05.04 22:11:26
  ����:      Sender: TObject
  ����ֵ:    ��
  ��ϸ˵��:  �½��������
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

