{*******************************************************}
{                                                       }
{       客户插件                                        }
{                                                       }
{       版权所有 (C) 2009 动力工作室                    }
{                                                       }
{*******************************************************}
unit uPackAge;

interface
uses ToolsApi;

type
  TLHCPackageCreatorWizard = class(TNotifierObject, IOTAWizard,
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

  TLHCPackageCreator = class(TInterfacedObject, IOTACreator, IOTAProjectCreator,
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

procedure Register;
implementation
uses uConst, uFile, SysUtils, uPackProject;

procedure Register;
begin
//  RegisterPackageWizard(TLHCPackageCreatorWizard.Create);
end;
{
*************************** TLHCPackageCreatorWizard ***************************
}

procedure TLHCPackageCreatorWizard.Execute;
begin
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TLHCPackageCreator.Create);
end;

function TLHCPackageCreatorWizard.GetAuthor: string;
begin
  Result := sAuthor;
end;

function TLHCPackageCreatorWizard.GetComment: string;
begin
  Result := 'Create a Package File';
end;

function TLHCPackageCreatorWizard.GetGlyph: Cardinal;
begin
  Result := 0;
end;

function TLHCPackageCreatorWizard.GetIDString: string;
begin
  Result := 'Package.Demo';
end;

function TLHCPackageCreatorWizard.GetName: string;
begin
  Result := 'Package';
end;

function TLHCPackageCreatorWizard.GetPage: string;
begin
  result := spage;
end;

function TLHCPackageCreatorWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;


{
****************************** TLHCPackageCreator ******************************
}

function TLHCPackageCreator.GetCreatorType: string;
begin
  Result := sPackage;
end;

function TLHCPackageCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function TLHCPackageCreator.GetFileName: string;
begin
  Result := 'Unname.dpr';
end;

function TLHCPackageCreator.GetFileSystem: string;
begin
end;

function TLHCPackageCreator.GetOptionFileName: string;
begin
end;

function TLHCPackageCreator.GetOwner: IOTAModule;
var
  Project: TPackProject;
begin
  Project := TPackProject.Create;
  Result := Project.CurrentProject;
  Project.Free;
end;

function TLHCPackageCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TLHCPackageCreator.GetUnnamed: Boolean;
begin
  Result := True;
end;

procedure TLHCPackageCreator.NewDefaultModule;
begin

end;

procedure TLHCPackageCreator.NewDefaultProjectModule(const Project:
  IOTAProject);
begin
end;

function TLHCPackageCreator.NewOptionSource(const ProjectName: string):
  IOTAFile;
begin
end;

procedure TLHCPackageCreator.NewProjectResource(const Project: IOTAProject);
begin
end;

function TLHCPackageCreator.NewProjectSource(const ProjectName: string):
  IOTAFile;
const
  sSource =
    'package %s;' + #13#10 +
    #13#10 +
    '{$R *.res}' + #13#10 +
    '{$ALIGN 8}' + #13#10 +
    '{$ASSERTIONS ON}' + #13#10 +
    '{$BOOLEVAL OFF}' + #13#10 +
    '{$DEBUGINFO ON}' + #13#10 +
    '{$EXTENDEDSYNTAX ON}' + #13#10 +
    '{$IMPORTEDDATA ON}' + #13#10 +
    '{$IOCHECKS ON}' + #13#10 +
    '{$LOCALSYMBOLS ON}' + #13#10 +
    '{$LONGSTRINGS ON}' + #13#10 +
    '{$OPENSTRINGS ON}' + #13#10 +
    '{$OPTIMIZATION ON}' + #13#10 +
    '{$OVERFLOWCHECKS OFF}' + #13#10 +
    '{$RANGECHECKS OFF}' + #13#10 +
    '{$REFERENCEINFO ON}' + #13#10 +
    '{$SAFEDIVIDE OFF}' + #13#10 +
    '{$STACKFRAMES OFF}' + #13#10 +
    '{$TYPEDADDRESS OFF}' + #13#10 +
    '{$VARSTRINGCHECKS ON}' + #13#10 +
    '{$WRITEABLECONST OFF}' + #13#10 +
    '{$MINENUMSIZE 1}' + #13#10 +
    '{$IMAGEBASE $400000}' + #13#10 +
    '{$IMPLICITBUILD OFF}' + #13#10 +
    #13#10 +
    'requires' + #13#10 +
    '  rtl;' + #13#10 +
    #13#10 +
    'end.';

begin
  Result := StringToIOTAFile(Format(sSource, [ProjectName]));
end;



end.

