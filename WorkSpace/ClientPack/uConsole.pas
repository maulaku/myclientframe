{*******************************************************}
{                                                       }
{       客户插件                                        }
{                                                       }
{       版权所有 (C) 2009 动力工作室                    }
{                                                       }
{*******************************************************}
unit uConsole;

interface
uses ToolsApi;

type
  TLHCConsoleCreatorWizard = class(TNotifierObject, IOTAWizard,
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

  TLHCConsoleCreator = class(TInterfacedObject, IOTACreator, IOTAProjectCreator,
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
  MODULETEXT: PChar;
{$R ConsoleCode.RES}

procedure Register;
implementation
uses uConst, uFile, SysUtils, Windows;

procedure Register;
begin
//  RegisterPackageWizard(TLHCConsoleCreatorWizard.Create);
end;
{
*************************** TLHCConsoleCreatorWizard ***************************
}

procedure TLHCConsoleCreatorWizard.Execute;
var
  ResInstance: THandle;
begin
  //加载控制台资源
  ResInstance := FindResourceHInstance(HInstance);
  ModuleText := StrNew(PChar(LockResource(LoadResource(ResInstance,
    FindResource(ResInstance, 'CONSOLECODE', RT_RCDATA)))));
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TLHCConsoleCreator.Create);
end;

function TLHCConsoleCreatorWizard.GetAuthor: string;
begin
  Result := sAuthor;
end;

function TLHCConsoleCreatorWizard.GetComment: string;
begin
  Result := 'Create a Console';
end;

function TLHCConsoleCreatorWizard.GetGlyph: Cardinal;
begin
  Result := 0;
end;

function TLHCConsoleCreatorWizard.GetIDString: string;
begin
  Result := 'Console.Demo';
end;

function TLHCConsoleCreatorWizard.GetName: string;
begin
  Result := 'Console Application';
end;

function TLHCConsoleCreatorWizard.GetPage: string;
begin
  result := spage;
end;

function TLHCConsoleCreatorWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

{
****************************** TLHCConsoleCreator ******************************
}

function TLHCConsoleCreator.GetCreatorType: string;
begin
  Result := sConsole;
end;

function TLHCConsoleCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function TLHCConsoleCreator.GetFileName: string;
begin
  Result := 'Unname.dpr';
end;

function TLHCConsoleCreator.GetFileSystem: string;
begin

end;

function TLHCConsoleCreator.GetOptionFileName: string;
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

function TLHCConsoleCreator.GetOwner: IOTAModule;
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

function TLHCConsoleCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TLHCConsoleCreator.GetUnnamed: Boolean;
begin
  Result := True;
end;

procedure TLHCConsoleCreator.NewDefaultModule;
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

procedure TLHCConsoleCreator.NewDefaultProjectModule(const Project:
  IOTAProject);
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

function TLHCConsoleCreator.NewOptionSource(const ProjectName: string):
  IOTAFile;
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

procedure TLHCConsoleCreator.NewProjectResource(const Project: IOTAProject);
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

function TLHCConsoleCreator.NewProjectSource(const ProjectName: string):
  IOTAFile;
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;



end.

