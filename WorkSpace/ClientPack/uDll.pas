{*******************************************************}
{                                                       }
{       客户插件                                        }
{                                                       }
{       版权所有 (C) 2009 动力工作室                    }
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
    //注册一个动态链接库工程
//  RegisterPackageWizard(TLHCDLLCreatorWizard.Create);
end;


{
***************************** TLHCDLLCreatorWizard *****************************
}

procedure TLHCDLLCreatorWizard.Execute;
var
  ResInstance: THandle;
begin
  //加载资源
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
  过程名:    TLHCDLLCreator.GetCreatorType
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  返回工程的类型
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
  过程名:    TLHCDLLCreator.GetFileName
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  指定工程的名称
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
    过程名:    TLHCDLLCreator.GetUnnamed
    作者:      luohuachun
    日期:      2009.04.18
    参数:      无
    返回值:    Boolean
    详细说明:  第一次保存文件的时候，是否提示重新输入文件名称；否则就按当前显示的名称保存;
  -------------------------------------------------------------------------------}

begin
  Result := True;
end;

procedure TLHCDLLCreator.NewDefaultModule;
begin
    { 网上抄来的一段代码.
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
  过程名:    TLHCDLLCreator.NewProjectSource
  作者:      luohuachun
  日期:      2009.04.18
  参数:      const ProjectName: string
  返回值:    IOTAFile
  详细说明:  指定工程文件.这里ProjectName的名称是由GetFileName过程提供;如果GetFileName为空，则返回为默认的'Project1'
-------------------------------------------------------------------------------}
begin
  //ShowMessage(ProjectName);
  Result := StringToIOTAFile(Format(StrPas(DllText), [ProjectName]));
end;
end.

