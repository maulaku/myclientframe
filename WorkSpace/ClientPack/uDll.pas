{*******************************************************}
{                                                       }
{       �ͻ����                                        }
{                                                       }
{       ��Ȩ���� (C) 2009 ����������                    }
{                                                       }
{*******************************************************}
unit uDll;

interface
uses
  ToolsAPI, Windows;

type
  TLHCDLLCreatorWizard = class(TNotifierObject, IOTAWizard,
      IOTARepositoryWizard, IOTAProjectWizard)
  public
    procedure Execute;
    function GetAuthor: string;
    function GetComment: string;
    function GetGlyph: Cardinal;
    function GetIDString: string;
    function GetName: string;
    function GetPage: string;
    function GetState: TWizardState;
  end;

  TLHCDLLCreator = class(TInterfacedObject, IOTACreator, IOTAProjectCreator,
      IOTAProjectCreator50)
  public
    function GetCreatorType: string;
    function GetExisting: Boolean;
    function GetFileName: string;
    function GetFileSystem: string;
    function GetOptionFileName: string;
    function GetOwner: IOTAModule;
    function GetShowSource: Boolean;
    function GetUnnamed: Boolean;
    procedure NewDefaultModule;
    procedure NewDefaultProjectModule(const Project: IOTAProject);
    function NewOptionSource(const ProjectName: string): IOTAFile;
    procedure NewProjectResource(const Project: IOTAProject);
    function NewProjectSource(const ProjectName: string): IOTAFile;
    property CreatorType: string read GetCreatorType;
    property Existing: Boolean read GetExisting;
    property FileName: string read GetFileName;
    property FileSystem: string read GetFileSystem;
    property OptionFileName: string read GetOptionFileName;
    property Owner: IOTAModule read GetOwner;
    property ShowSource: Boolean read GetShowSource;
    property Unnamed: Boolean read GetUnnamed;
  end;

var
  DllText: PChar;
{$R DllCode.RES}

procedure Register;

implementation
uses uFile, uConst, Dialogs, SysUtils, uPackProject;

procedure Register;
begin
    //ע��һ����̬���ӿ⹤��
//  RegisterPackageWizard(TLHCDLLCreatorWizard.Create);
end;


{
***************************** TLHCDLLCreatorWizard *****************************
}

procedure TLHCDLLCreatorWizard.Execute;
var
  ResInstance: THandle;
begin
  //������Դ
  ResInstance := FindResourceHInstance(HInstance);
  DllText := StrNew(PChar(LockResource(LoadResource(ResInstance,
    FindResource(ResInstance, 'DLLCODE', RT_RCDATA)))));
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TLHCDLLCreator.Create);
end;

function TLHCDLLCreatorWizard.GetAuthor: string;
begin
  result := sAuthor;
end;

function TLHCDLLCreatorWizard.GetComment: string;
begin
  Result := 'Create a Dll Project';
end;

function TLHCDLLCreatorWizard.GetGlyph: Cardinal;
begin
  Result := LoadIcon(HInstance, 'Gear');
end;

function TLHCDLLCreatorWizard.GetIDString: string;
begin
  Result := 'Dll.Demo';
end;

function TLHCDLLCreatorWizard.GetName: string;
begin
  Result := 'Dll Wizard';
end;

function TLHCDLLCreatorWizard.GetPage: string;
begin
  Result := sPage;
end;

function TLHCDLLCreatorWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

{
******************************** TLHCDLLCreator ********************************
}


function TLHCDLLCreator.GetCreatorType: string;
{-------------------------------------------------------------------------------
  ������:    TLHCDLLCreator.GetCreatorType
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ���ع��̵�����
-------------------------------------------------------------------------------}
begin
  Result := sLibrary;
end;

function TLHCDLLCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function TLHCDLLCreator.GetFileName: string;
{-------------------------------------------------------------------------------
  ������:    TLHCDLLCreator.GetFileName
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ָ�����̵�����
-------------------------------------------------------------------------------}
begin
  Result := 'UnName.dpr';
end;

function TLHCDLLCreator.GetFileSystem: string;
begin
  Result := '';
end;

function TLHCDLLCreator.GetOptionFileName: string;
begin
  Result := '';
end;

function TLHCDLLCreator.GetOwner: IOTAModule;
var
  Project: TPackProject;
begin
  Project := TPackProject.Create;
  Result := Project.CurrentProject;
  Project.Free;
end;

function TLHCDLLCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TLHCDLLCreator.GetUnnamed: Boolean;

  {-------------------------------------------------------------------------------
    ������:    TLHCDLLCreator.GetUnnamed
    ����:      luohuachun
    ����:      2009.04.18
    ����:      ��
    ����ֵ:    Boolean
    ��ϸ˵��:  ��һ�α����ļ���ʱ���Ƿ���ʾ���������ļ����ƣ�����Ͱ���ǰ��ʾ�����Ʊ���;
  -------------------------------------------------------------------------------}

begin
  Result := True;
end;

procedure TLHCDLLCreator.NewDefaultModule;
begin
    { ���ϳ�����һ�δ���.
    var
     ModuleCreator: TuilPluginModuleCreator;
  begin
     ModuleCreator := TuilPluginModuleCreator.Create();
     ToolServices.ModuleCreate( ModuleCreator, [ cmAddToProject, cmMainForm, cmMarkModified, cmShowForm, cmUnNamed ] );
     ModuleCreator.Free();
  end;
    }

    // TODO -cMM : Interface wizard: Implement interface method
end;

procedure TLHCDLLCreator.NewDefaultProjectModule(const Project: IOTAProject);
begin

//  ShowMessage(Project.FileName);
//  ShowMessage(Project.FileSystem);
  // TODO -cMM : Interface wizard: Implement interface method
end;

function TLHCDLLCreator.NewOptionSource(const ProjectName: string): IOTAFile;
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

procedure TLHCDLLCreator.NewProjectResource(const Project: IOTAProject);
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

function TLHCDLLCreator.NewProjectSource(const ProjectName: string): IOTAFile;
 {-------------------------------------------------------------------------------
  ������:    TLHCDLLCreator.NewProjectSource
  ����:      luohuachun
  ����:      2009.04.18
  ����:      const ProjectName: string
  ����ֵ:    IOTAFile
  ��ϸ˵��:  ָ�������ļ�.����ProjectName����������GetFileName�����ṩ;���GetFileNameΪ�գ��򷵻�ΪĬ�ϵ�'Project1'
-------------------------------------------------------------------------------}
begin
  //ShowMessage(ProjectName);
  Result := StringToIOTAFile(Format(StrPas(DllText), [ProjectName]));
end;
end.

