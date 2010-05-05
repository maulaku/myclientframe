{*******************************************************}
{                                                       }
{       �ͻ����                                        }
{                                                       }
{       ��Ȩ���� (C) 2009 ����������                    }
{                                                       }
{*******************************************************}


unit uApplication;

interface
uses ToolsApi, Graphics, Windows;

type
  TLHCApplicationCreatorWizard = class(TNotifierObject, IOTAWizard,
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

  TLHCApplicationCreator = class(TInterfacedObject, IOTACreator,
      IOTAProjectCreator, IOTAProjectCreator50)
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
  ModuleText: pChar;

implementation
uses uConst, uFile, SysUtils, uPackProject;
{$R applicationCode.RES}


{
************************* TLHCApplicationCreatorWizard *************************
}


procedure TLHCApplicationCreatorWizard.Execute;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreatorWizard.Execute
  ����:      luohuachun
  ����:      2009.04.27 21:52:17
  ����:      ��
  ����ֵ:    ��
  ��ϸ˵��:
-------------------------------------------------------------------------------}
var
  ResInstance: THandle;
  ResName: pChar;
begin
  //����Ӧ�ó���Դ����Դ
  ResInstance := FindResourceHInstance(HInstance);
  ResName := 'APPLICATIONCODE';
  ModuleText := StrNew(PChar(LockResource(LoadResource(ResInstance,
    FindResource(ResInstance, ResName, RT_RCDATA)))));

  (BorlandIDEServices as IOTAModuleServices).CreateModule(TLHCApplicationCreator.Create);
end;


function TLHCApplicationCreatorWizard.GetAuthor: string;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreatorWizard.GetAuthor
  ����:      luohuachun
  ����:      2009.04.27 21:52:20
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  Result := sAuthor;
end;


function TLHCApplicationCreatorWizard.GetComment: string;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreatorWizard.GetComment
  ����:      luohuachun
  ����:      2009.04.27 21:52:22
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  Result := 'Create a Application';
end;


function TLHCApplicationCreatorWizard.GetGlyph: Cardinal;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreatorWizard.GetGlyph
  ����:      luohuachun
  ����:      2009.04.27 21:52:23
  ����:      ��
  ����ֵ:    Cardinal
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  Result := LoadIcon(HInstance, 'XPAPP');
end;


function TLHCApplicationCreatorWizard.GetIDString: string;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreatorWizard.GetIDString
  ����:      luohuachun
  ����:      2009.04.27 21:52:25
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  Result := 'Application.Demo';
end;


function TLHCApplicationCreatorWizard.GetName: string;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreatorWizard.GetName
  ����:      luohuachun
  ����:      2009.04.27 21:52:26
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  Result := 'Application Wizard';
end;


function TLHCApplicationCreatorWizard.GetPage: string;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreatorWizard.GetPage
  ����:      luohuachun
  ����:      2009.04.27 21:52:28
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  result := spage;
end;


function TLHCApplicationCreatorWizard.GetState: TWizardState;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreatorWizard.GetState
  ����:      luohuachun
  ����:      2009.04.27 21:52:29
  ����:      ��
  ����ֵ:    TWizardState
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  Result := [wsEnabled];
end;

{
**************************** TLHCApplicationCreator ****************************
}

function TLHCApplicationCreator.GetCreatorType: string;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.GetCreatorType
  ����:      luohuachun
  ����:      2009.04.27 21:51:32
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:
-------------------------------------------------------------------------------}

begin
  Result := sApplication;
end;

function TLHCApplicationCreator.GetExisting: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.GetExisting
  ����:      luohuachun
  ����:      2009.04.27 21:51:38
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:
-------------------------------------------------------------------------------}

begin
  Result := False;
end;

function TLHCApplicationCreator.GetFileName: string;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.GetFileName
  ����:      luohuachun
  ����:      2009.04.27 21:51:40
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:
-------------------------------------------------------------------------------}

begin
  Result := 'Unname.dpr';
end;

function TLHCApplicationCreator.GetFileSystem: string;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.GetFileSystem
  ����:      luohuachun
  ����:      2009.04.27 21:51:43
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  Result := '';
end;

function TLHCApplicationCreator.GetOptionFileName: string;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.GetOptionFileName
  ����:      luohuachun
  ����:      2009.04.27 21:51:41
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:
-------------------------------------------------------------------------------}

begin
  Result := '';
end;


function TLHCApplicationCreator.GetOwner: IOTAModule;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.GetOwner
  ����:      luohuachun
  ����:      2009.04.27 21:51:46
  ����:      ��
  ����ֵ:    IOTAModule
  ��ϸ˵��:
-------------------------------------------------------------------------------}
var
  Project: TPackProject;
begin
  Project := TPackProject.Create;
  Result := Project.CurrentProject;
  Project.Free;
end;


function TLHCApplicationCreator.GetShowSource: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.GetShowSource
  ����:      luohuachun
  ����:      2009.04.27 21:51:47
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  Result := true;
end;


function TLHCApplicationCreator.GetUnnamed: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.GetUnnamed
  ����:      luohuachun
  ����:      2009.04.27 21:51:50
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


procedure TLHCApplicationCreator.NewDefaultModule;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.NewDefaultModule
  ����:      luohuachun
  ����:      2009.04.27 21:51:51
  ����:      ��
  ����ֵ:    ��
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin

end;


procedure TLHCApplicationCreator.NewDefaultProjectModule(const Project:
  IOTAProject);
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.NewDefaultProjectModule
  ����:      luohuachun
  ����:      2009.04.27 21:51:52
  ����:      const Project: IOTAProject
  ����ֵ:    ��
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin

end;


function TLHCApplicationCreator.NewOptionSource(const ProjectName: string):
  IOTAFile;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.NewOptionSource
  ����:      luohuachun
  ����:      2009.04.27 21:51:54
  ����:      const ProjectName: string
  ����ֵ:    IOTAFile
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin

end;


procedure TLHCApplicationCreator.NewProjectResource(const Project: IOTAProject);
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.NewProjectResource
  ����:      luohuachun
  ����:      2009.04.27 21:51:55
  ����:      const Project: IOTAProject
  ����ֵ:    ��
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;


function TLHCApplicationCreator.NewProjectSource(const ProjectName: string):
  IOTAFile;
{-------------------------------------------------------------------------------
  ������:    TLHCApplicationCreator.NewProjectSource
  ����:      luohuachun
  ����:      2009.04.27 21:51:57
  ����:      const ProjectName: string
  ����ֵ:    IOTAFile
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  Result := FUnitFile.Create(Format(ModuleText, [ProjectName]));
end;


end.

