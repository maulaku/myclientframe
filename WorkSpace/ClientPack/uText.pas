{*******************************************************}
{                                                       }
{       客户插件                                        }
{                                                       }
{       版权所有 (C) 2009 动力工作室                    }
{                                                       }
{*******************************************************}
unit uText;

interface
uses ToolsApi, Windows;

type
  TLHCTextCreatorWizard = class(TNotifierObject, IOTAWizard,
      IOTARepositoryWizard, IOTAFormWizard)
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

  TLHCTextCreator = class(TInterfacedObject, IOTACreator, IOTAModuleCreator)
  public
    procedure FormCreated(const FormEditor: IOTAFormEditor);
    function GetAncestorName: string;
    function GetCreatorType: string;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetFormName: string;
    function GetImplFileName: string;
    function GetIntfFileName: string;
    function GetMainForm: Boolean;
    function GetOwner: IOTAModule;
    function GetShowForm: Boolean;
    function GetShowSource: Boolean;
    function GetUnnamed: Boolean;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent:
      string): IOTAFile;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent:
      string): IOTAFile;
    property AncestorName: string read GetAncestorName;
    property CreatorType: string read GetCreatorType;
    property Existing: Boolean read GetExisting;
    property FileSystem: string read GetFileSystem;
    property FormName: string read GetFormName;
    property ImplFileName: string read GetImplFileName;
    property IntfFileName: string read GetIntfFileName;
    property MainForm: Boolean read GetMainForm;
    property Owner: IOTAModule read GetOwner;
    property ShowForm: Boolean read GetShowForm;
    property ShowSource: Boolean read GetShowSource;
    property Unnamed: Boolean read GetUnnamed;
  end;

procedure Register;
implementation
uses uConst, uFile, SysUtils, uPackProject;

procedure Register;
begin
  RegisterPackageWizard(TLHCTextCreatorWizard.Create);
end;

{
**************************** TLHCTextCreatorWizard *****************************
}

procedure TLHCTextCreatorWizard.Execute;
begin
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TLHCTextCreator.Create);
end;

function TLHCTextCreatorWizard.GetAuthor: string;
begin
  Result := sAuthor;
end;

function TLHCTextCreatorWizard.GetComment: string;
begin
  Result := 'Create a Text File';
end;

function TLHCTextCreatorWizard.GetGlyph: Cardinal;
begin
  Result := 0;
end;

function TLHCTextCreatorWizard.GetIDString: string;
begin
  Result := 'Text.Demo';
end;

function TLHCTextCreatorWizard.GetName: string;
begin
  Result := 'Text File';
end;

function TLHCTextCreatorWizard.GetPage: string;
begin
  result := spage;
end;

function TLHCTextCreatorWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

{
******************************* TLHCTextCreator ********************************
}

procedure TLHCTextCreator.FormCreated(const FormEditor: IOTAFormEditor);
begin
end;

function TLHCTextCreator.GetAncestorName: string;
begin
end;

function TLHCTextCreator.GetCreatorType: string;
begin
  Result := sText;
end;

function TLHCTextCreator.GetExisting: Boolean;
begin
  Result := True;
end;

function TLHCTextCreator.GetFileSystem: string;
begin

end;

function TLHCTextCreator.GetFormName: string;
begin
  Result := '';
end;

function TLHCTextCreator.GetImplFileName: string;
begin
  Result := 'Unnamed.txt';
end;

function TLHCTextCreator.GetIntfFileName: string;
begin
end;

function TLHCTextCreator.GetMainForm: Boolean;
begin
  Result := False;
end;

function TLHCTextCreator.GetOwner: IOTAModule;
var
  Project: TPackProject;
begin
  Project := TPackproject.Create;
  Result := Project.CurrentProject;
  Project.Free;
end;

function TLHCTextCreator.GetShowForm: Boolean;
begin
  Result := False;
end;

function TLHCTextCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TLHCTextCreator.GetUnnamed: Boolean;
begin
  Result := false;
end;

function TLHCTextCreator.NewFormFile(const FormIdent, AncestorIdent: string):
  IOTAFile;
begin
end;

function TLHCTextCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

function TLHCTextCreator.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
const
  sSource = 'unname.txt';
begin
  Result := StringToIOTAFile(sSource);
end;


end.

