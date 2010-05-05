{*******************************************************}
{                                                       }
{       客户插件                                        }
{                                                       }
{       版权所有 (C) 2009 动力工作室                    }
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
  过程名:    TLHCApplicationCreatorWizard.Execute
  作者:      luohuachun
  日期:      2009.04.27 21:52:17
  参数:      无
  返回值:    无
  详细说明:
-------------------------------------------------------------------------------}
var
  ResInstance: THandle;
  ResName: pChar;
begin
  //加载应用程序源码资源
  ResInstance := FindResourceHInstance(HInstance);
  ResName := 'APPLICATIONCODE';
  ModuleText := StrNew(PChar(LockResource(LoadResource(ResInstance,
    FindResource(ResInstance, ResName, RT_RCDATA)))));

  (BorlandIDEServices as IOTAModuleServices).CreateModule(TLHCApplicationCreator.Create);
end;


function TLHCApplicationCreatorWizard.GetAuthor: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreatorWizard.GetAuthor
  作者:      luohuachun
  日期:      2009.04.27 21:52:20
  参数:      无
  返回值:    string
  详细说明:
-------------------------------------------------------------------------------}
begin
  Result := sAuthor;
end;


function TLHCApplicationCreatorWizard.GetComment: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreatorWizard.GetComment
  作者:      luohuachun
  日期:      2009.04.27 21:52:22
  参数:      无
  返回值:    string
  详细说明:
-------------------------------------------------------------------------------}
begin
  Result := 'Create a Application';
end;


function TLHCApplicationCreatorWizard.GetGlyph: Cardinal;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreatorWizard.GetGlyph
  作者:      luohuachun
  日期:      2009.04.27 21:52:23
  参数:      无
  返回值:    Cardinal
  详细说明:
-------------------------------------------------------------------------------}
begin
  Result := LoadIcon(HInstance, 'XPAPP');
end;


function TLHCApplicationCreatorWizard.GetIDString: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreatorWizard.GetIDString
  作者:      luohuachun
  日期:      2009.04.27 21:52:25
  参数:      无
  返回值:    string
  详细说明:
-------------------------------------------------------------------------------}
begin
  Result := 'Application.Demo';
end;


function TLHCApplicationCreatorWizard.GetName: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreatorWizard.GetName
  作者:      luohuachun
  日期:      2009.04.27 21:52:26
  参数:      无
  返回值:    string
  详细说明:
-------------------------------------------------------------------------------}
begin
  Result := 'Application Wizard';
end;


function TLHCApplicationCreatorWizard.GetPage: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreatorWizard.GetPage
  作者:      luohuachun
  日期:      2009.04.27 21:52:28
  参数:      无
  返回值:    string
  详细说明:
-------------------------------------------------------------------------------}
begin
  result := spage;
end;


function TLHCApplicationCreatorWizard.GetState: TWizardState;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreatorWizard.GetState
  作者:      luohuachun
  日期:      2009.04.27 21:52:29
  参数:      无
  返回值:    TWizardState
  详细说明:
-------------------------------------------------------------------------------}
begin
  Result := [wsEnabled];
end;

{
**************************** TLHCApplicationCreator ****************************
}

function TLHCApplicationCreator.GetCreatorType: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreator.GetCreatorType
  作者:      luohuachun
  日期:      2009.04.27 21:51:32
  参数:      无
  返回值:    string
  详细说明:
-------------------------------------------------------------------------------}

begin
  Result := sApplication;
end;

function TLHCApplicationCreator.GetExisting: Boolean;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreator.GetExisting
  作者:      luohuachun
  日期:      2009.04.27 21:51:38
  参数:      无
  返回值:    Boolean
  详细说明:
-------------------------------------------------------------------------------}

begin
  Result := False;
end;

function TLHCApplicationCreator.GetFileName: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreator.GetFileName
  作者:      luohuachun
  日期:      2009.04.27 21:51:40
  参数:      无
  返回值:    string
  详细说明:
-------------------------------------------------------------------------------}

begin
  Result := 'Unname.dpr';
end;

function TLHCApplicationCreator.GetFileSystem: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreator.GetFileSystem
  作者:      luohuachun
  日期:      2009.04.27 21:51:43
  参数:      无
  返回值:    string
  详细说明:
-------------------------------------------------------------------------------}
begin
  Result := '';
end;

function TLHCApplicationCreator.GetOptionFileName: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreator.GetOptionFileName
  作者:      luohuachun
  日期:      2009.04.27 21:51:41
  参数:      无
  返回值:    string
  详细说明:
-------------------------------------------------------------------------------}

begin
  Result := '';
end;


function TLHCApplicationCreator.GetOwner: IOTAModule;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreator.GetOwner
  作者:      luohuachun
  日期:      2009.04.27 21:51:46
  参数:      无
  返回值:    IOTAModule
  详细说明:
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
  过程名:    TLHCApplicationCreator.GetShowSource
  作者:      luohuachun
  日期:      2009.04.27 21:51:47
  参数:      无
  返回值:    Boolean
  详细说明:
-------------------------------------------------------------------------------}
begin
  Result := true;
end;


function TLHCApplicationCreator.GetUnnamed: Boolean;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreator.GetUnnamed
  作者:      luohuachun
  日期:      2009.04.27 21:51:50
  参数:      无
  返回值:    Boolean
  详细说明:
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


procedure TLHCApplicationCreator.NewDefaultModule;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreator.NewDefaultModule
  作者:      luohuachun
  日期:      2009.04.27 21:51:51
  参数:      无
  返回值:    无
  详细说明:
-------------------------------------------------------------------------------}
begin

end;


procedure TLHCApplicationCreator.NewDefaultProjectModule(const Project:
  IOTAProject);
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreator.NewDefaultProjectModule
  作者:      luohuachun
  日期:      2009.04.27 21:51:52
  参数:      const Project: IOTAProject
  返回值:    无
  详细说明:
-------------------------------------------------------------------------------}
begin

end;


function TLHCApplicationCreator.NewOptionSource(const ProjectName: string):
  IOTAFile;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreator.NewOptionSource
  作者:      luohuachun
  日期:      2009.04.27 21:51:54
  参数:      const ProjectName: string
  返回值:    IOTAFile
  详细说明:
-------------------------------------------------------------------------------}
begin

end;


procedure TLHCApplicationCreator.NewProjectResource(const Project: IOTAProject);
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreator.NewProjectResource
  作者:      luohuachun
  日期:      2009.04.27 21:51:55
  参数:      const Project: IOTAProject
  返回值:    无
  详细说明:
-------------------------------------------------------------------------------}
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;


function TLHCApplicationCreator.NewProjectSource(const ProjectName: string):
  IOTAFile;
{-------------------------------------------------------------------------------
  过程名:    TLHCApplicationCreator.NewProjectSource
  作者:      luohuachun
  日期:      2009.04.27 21:51:57
  参数:      const ProjectName: string
  返回值:    IOTAFile
  详细说明:
-------------------------------------------------------------------------------}
begin
  Result := FUnitFile.Create(Format(ModuleText, [ProjectName]));
end;


end.

