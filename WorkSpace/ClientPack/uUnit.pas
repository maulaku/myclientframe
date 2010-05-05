{*******************************************************}
{                                                       }
{       客户插件                                        }
{                                                       }
{       版权所有 (C) 2009 动力工作室                    }
{                                                       }
{*******************************************************}
unit uUnit;

interface
uses ToolsApi, Windows;

type
  TLHCUnitCreatorWizard = class(TNotifierObject, IOTAWizard,
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

  TLHCUnitCreator = class(TInterfacedObject, IOTACreator, IOTAModuleCreator)
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


{$R UNITCODE.RES}

var
  FUNITTEXT: PChar;

procedure Register;
implementation
uses uConst, uFile, SysUtils, dialogs, uPackProject;

procedure Register;
begin
  RegisterPackageWizard(TLHCUnitCreatorWizard.Create);
end;

{
**************************** TLHCUnitCreatorWizard *****************************
}

procedure TLHCUnitCreatorWizard.Execute;
var
  ResInstance: THandle;
begin
  //加载资源
  ResInstance := FindResourceHInstance(HInstance);
  FUNITTEXT := StrNew(PChar(LockResource(LoadResource(ResInstance,
    FindResource(ResInstance, 'UNITCODE', RT_RCDATA)))));
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TLHCUnitCreator.Create);
end;

function TLHCUnitCreatorWizard.GetAuthor: string;
begin
  Result := sAuthor;
end;

function TLHCUnitCreatorWizard.GetComment: string;
begin
  Result := 'Create a Unit File';
end;

function TLHCUnitCreatorWizard.GetGlyph: Cardinal;
begin
  Result := 0;
end;

function TLHCUnitCreatorWizard.GetIDString: string;
begin
  Result := 'Unit.Demo';
end;

function TLHCUnitCreatorWizard.GetName: string;
begin
  Result := 'Unit File';
end;

function TLHCUnitCreatorWizard.GetPage: string;
begin
  result := spage;
  // TODO -cMM : Interface wizard: Implement interface method
end;

function TLHCUnitCreatorWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

{
******************************* TLHCUnitCreator ********************************
}

procedure TLHCUnitCreator.FormCreated(const FormEditor: IOTAFormEditor);
begin
end;

function TLHCUnitCreator.GetAncestorName: string;
begin
  Result := '';
end;

function TLHCUnitCreator.GetCreatorType: string;
begin
  Result := sUnit;
end;

function TLHCUnitCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function TLHCUnitCreator.GetFileSystem: string;
begin
  Result := '';
end;

function TLHCUnitCreator.GetFormName: string;
begin
  Result := '';
end;

function TLHCUnitCreator.GetImplFileName: string;
begin
  Result := 'unName.pas';
end;

function TLHCUnitCreator.GetIntfFileName: string;
begin
end;

function TLHCUnitCreator.GetMainForm: Boolean;
begin
  Result := False;
end;

function TLHCUnitCreator.GetOwner: IOTAModule;
var
  Project: TPackProject;
begin
  Project := TPackProject.Create;
  Result := Project.getCurrentModule;
  Project.Free;
end;

function TLHCUnitCreator.GetShowForm: Boolean;
begin
  Result := False;
end;

function TLHCUnitCreator.GetShowSource: Boolean;
begin
  result := True;
end;

function TLHCUnitCreator.GetUnnamed: Boolean;
begin
  Result := true;
end;

function TLHCUnitCreator.NewFormFile(const FormIdent, AncestorIdent: string):
  IOTAFile;
begin

end;

function TLHCUnitCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
{-------------------------------------------------------------------------------
  过程名:    TLHCUnitCreator.NewImplSource
  作者:      luohuachun
  日期:      2009.04.20
  参数:      const ModuleIdent, FormIdent, AncestorIdent: string
  返回值:    IOTAFile
  详细说明:  新建单元;如果返回为nil; 则创建一个默认的单元;
-------------------------------------------------------------------------------}
begin
//  ShowMessage(StrPas(FUNITTEXT));
  Result := FUnitFile.Create(Format(STRPAS(FUNITTEXT), [ModuleIdent, FormIdent, AncestorIdent]));
end;

function TLHCUnitCreator.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
end;


end.

