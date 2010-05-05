{*******************************************************}
{                                                       }
{       �ͻ����                                        }
{                                                       }
{       ��Ȩ���� (C) 2009 ����������                    }
{                                                       }
{*******************************************************}
unit uForm;


interface
uses ToolsAPI, Windows;

type
  TLHCFormCreatorWizard = class(TNotifierObject, IOTAWizard,
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

  TLHCFormCreator = class(TInterfacedObject, IOTACreator, IOTAModuleCreator)
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
uses uFile, uConst, SysUtils, Dialogs;

procedure Register;
begin
//  RegisterPackageWizard(TLHCFormCreatorWizard.Create);
end;


{
**************************** TLHCFormCreatorWizard *****************************
}

procedure TLHCFormCreatorWizard.Execute;
begin
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TLHCFormCreator.Create);
end;

function TLHCFormCreatorWizard.GetAuthor: string;
begin
  Result := sAuthor;
end;

function TLHCFormCreatorWizard.GetComment: string;
begin
  Result := 'Create a Form';
end;

function TLHCFormCreatorWizard.GetGlyph: Cardinal;
begin
  Result := 0;
end;

function TLHCFormCreatorWizard.GetIDString: string;
begin
  Result := 'Form.Demo';
end;

function TLHCFormCreatorWizard.GetName: string;
begin
  Result := 'Form';
end;

function TLHCFormCreatorWizard.GetPage: string;
begin
  Result := sPage;
end;

function TLHCFormCreatorWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

{
******************************* TLHCFormCreator ********************************
}


procedure TLHCFormCreator.FormCreated(const FormEditor: IOTAFormEditor);
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.FormCreated
  ����:      luohuachun
  ����:      2009.04.18
  ����:      const FormEditor: IOTAFormEditor
  ����ֵ:    ��
  ��ϸ˵��:  FormCreated���д��崴��ʱ�����õ��¼�����
-------------------------------------------------------------------------------}
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

function TLHCFormCreator.GetAncestorName: string;

{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.GetAncestorName
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ����ģ�����̳е�������
-------------------------------------------------------------------------------}

begin
  Result := 'Form';
end;

function TLHCFormCreator.GetCreatorType: string;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.GetCreatorType
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ָ������������,�������壬��Ԫ���ı�;[sForm,sUNIT,sText];
-------------------------------------------------------------------------------}

begin
  Result := sForm;
end;


function TLHCFormCreator.GetExisting: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.GetExisting
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:  GetExisting����False����ʾ���ڴ����µĵ�Ԫ������������еĵ�Ԫ����ô�÷���������True
-------------------------------------------------------------------------------}
begin
  Result := False;
end;


function TLHCFormCreator.GetFileSystem: string;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.GetFileSystem
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:
-------------------------------------------------------------------------------}
begin
  Result := '';
end;


function TLHCFormCreator.GetFormName: string;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.GetFormName
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ��ʾԴ���������.
-------------------------------------------------------------------------------}
begin
  Result := 'FrmClient';
end;



function TLHCFormCreator.GetImplFileName: string;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.GetImplFileName
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ����һ��Ҫд����׺���ļ���.���û�а���ĥ��;
-------------------------------------------------------------------------------}
begin
  Result := 'uClientForm.pas';
end;


function TLHCFormCreator.GetIntfFileName: string;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.GetIntfFileName
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ����C++ Builderʵ�ַ����������;
-------------------------------------------------------------------------------}
begin
  Result := '';
end;


function TLHCFormCreator.GetMainForm: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.GetMainForm
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:  ���ڱ�ģ�鲢�������壬����GetMainForm����False
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


function TLHCFormCreator.GetOwner: IOTAModule;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.GetOwner
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    IOTAModule
  ��ϸ˵��:  ���ض�ӵ��ģ������á�����Ҫ����ģ����ӵ�һ�����еĹ��̣�������Ҫ��ѯBorlandIDEServices�Ի�����еĹ��̻��
-------------------------------------------------------------------------------}
var
  Svc: IOTAModuleServices;
  AModule, NewModule: IOTAModule;
begin
  Result := nil;
  Svc := (BorlandideServices as IOTAModuleServices);
  AModule := Svc.CurrentModule;

  if AModule <> nil then
  begin
    if AModule.QueryInterface(IOTAProject, NewModule) = S_OK then
      Result := NewModule
    else if AModule.OwnerModuleCount > 0 then
    begin
      NewModule := AModule.OwnerModules[0];
      if NewModule <> nil then
        if NewModule.QueryInterface(IOTAProject, Result) <> S_OK then
          Result := nil;
    end;
  end;
end;


function TLHCFormCreator.GetShowForm: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.GetShowForm
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:  ��ʾ�Ƿ���ʾ�����������Ĭ�Ϸ���ΪFalse;
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


function TLHCFormCreator.GetShowSource: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.GetShowSource
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:  Ĭ�Ϸ���ΪFalse,��ʾ�Ƿ���ʾԴ����;
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


function TLHCFormCreator.GetUnnamed: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.GetUnnamed
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:  ������Ƿ���δ�����ĵ�Ԫ���÷���������True��
            ���GetUnnamed����True��Delphi���ڵ�һ�α��浥Ԫʱ��ʾ�û������ļ���.
            ��ʵ��˼�����ڵ�һ�α��浥Ԫ��ʱ���Ƿ���ʾ�������ļ���;
-------------------------------------------------------------------------------}
begin
  Result := False;
end;


function TLHCFormCreator.NewFormFile(const FormIdent, AncestorIdent: string):
  IOTAFile;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.NewFormFile
  ����:      luohuachun
  ����:      2009.04.18
  ����:      const FormIdent, AncestorIdent: string
  ����ֵ:    IOTAFile
  ��ϸ˵��:   ������Ķ������ļ�.Ҳ����.dfm�ļ�������;����IOTAFile����
             ��ʾ�����ļ���ʵ����������ɵ�ר�Ҳ���Ҫ���壬�򷵻�Nil;
-------------------------------------------------------------------------------}
var
  FFormText: pChar;
  ResInstance: THandle;
begin
  //���ش����뵥Ԫ��Դ
  ResInstance := FindResourceHInstance(HInstance);
  FFormText := StrNew(PChar(LockResource(LoadResource(ResInstance,
    FindResource(ResInstance, 'FORMDFMCODE', RT_RCDATA)))));
{$R FORMDFMCode.RES}
  Result := TFormFile.Create(Format(StrPas(FFormText), [FormIdent, AncestorIdent]));
end;


function TLHCFormCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.NewImplSource
  ����:      luohuachun
  ����:      2009.04.18
  ����:      const ModuleIdent, FormIdent, AncestorIdent: string
  ����ֵ:    IOTAFile
  ��ϸ˵��:  ���Ǹ��ؼ��Եķ������÷�������IOTAFile�����࣬���������ɵ�ר�ҵ�Դ����
-------------------------------------------------------------------------------}
var
  FUnitText: pChar;
  ResInstance: THandle;
begin
{$R FormCode.RES}
  //���ش����뵥Ԫ��Դ
  ResInstance := FindResourceHInstance(HInstance);
  FUnitText := StrNew(PChar(LockResource(LoadResource(ResInstance,
    FindResource(ResInstance, 'FORMCODE', RT_RCDATA)))));
  Result := FUnitFile.Create(Format(StrPas(FUnitText), [ModuleIdent, FormIdent, AncestorIdent]));
end;


function TLHCFormCreator.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
{-------------------------------------------------------------------------------
  ������:    TLHCFormCreator.NewIntfSource
  ����:      luohuachun
  ����:      2009.04.18
  ����:      const ModuleIdent, FormIdent, AncestorIdent: string
  ����ֵ:    IOTAFile
  ��ϸ˵��:  CPPͷ�ļ��������ﷵ�ؿ��ַ�����Ҫ�ǵ�Delphi��C++ Builder����VCL����
   -------------------------------------------------------------------------------}
begin
end;


end.

