unit upluginModule;

interface
uses ToolsAPI,Windows;

type
  TLHCClientPluginModuleCreatorWizard = class(TNotifierObject, IOTAWizard,
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

  TLHCClientPluginModuleCreator = class(TInterfacedObject, IOTACreator,
      IOTAModuleCreator)
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

  
{$R PLUGINMODULEDFMCODE.RES}
{$R PLUGINMODULESOURCECODE.RES}
  
VAR
  FClientModuleDfmText,FClientModuleSourceText:PChar;

implementation
uses uFile,uConst,SysUtils,Dialogs, uPluginProject;
 
{
**************************** TLHCClientPluginModuleCreatorWizard *****************************
}
procedure TLHCClientPluginModuleCreatorWizard.Execute;
var
  ResInstance:THandle;
begin
  //���ش����뵥Ԫ��Դ
  ResInstance:= FindResourceHInstance(HInstance);
  FClientModuleDfmText:= StrNew(PChar(LockResource(LoadResource(ResInstance,
    FindResource(ResInstance, 'PLUGINMODULEDFMCODE', RT_RCDATA)))));
  FClientModuleSourceText:= StrNew(PChar(LockResource(LoadResource(ResInstance,
    FindResource(ResInstance, 'PLUGINMODULESOURCECODE', RT_RCDATA)))));

  (BorlandIDEServices as IOTAModuleServices).CreateModule(TLHCClientPluginModuleCreator.Create);
end;

function TLHCClientPluginModuleCreatorWizard.GetAuthor: string;
begin
  Result := sAuthor;
end;

function TLHCClientPluginModuleCreatorWizard.GetComment: string;
begin
  Result := 'Create a Client Plugin Module';
end;

function TLHCClientPluginModuleCreatorWizard.GetGlyph: Cardinal;
begin
  Result := 0;
end;

function TLHCClientPluginModuleCreatorWizard.GetIDString: string;
begin
  Result := 'ClientPluginModule.Demo';
end;

function TLHCClientPluginModuleCreatorWizard.GetName: string;
begin
  Result := 'ClientPluginModule';
end;

function TLHCClientPluginModuleCreatorWizard.GetPage: string;
begin
  Result := sPage;
end;

function TLHCClientPluginModuleCreatorWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

{
******************************* TLHCClientPluginModuleCreator ********************************
}


procedure TLHCClientPluginModuleCreator.FormCreated(const FormEditor: IOTAFormEditor);
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.FormCreated
  ����:      luohuachun
  ����:      2009.04.18
  ����:      const FormEditor: IOTAFormEditor
  ����ֵ:    ��
  ��ϸ˵��:  FormCreated���д��崴��ʱ�����õ��¼�����
-------------------------------------------------------------------------------}
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

function TLHCClientPluginModuleCreator.GetAncestorName: string;

{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.GetAncestorName
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ����ģ�����̳е�������
-------------------------------------------------------------------------------}

begin
  Result :='LHCClientPlugin';
end;

function TLHCClientPluginModuleCreator.GetCreatorType: string;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.GetCreatorType
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ָ������������,�������壬��Ԫ���ı�;[sForm,sUNIT,sText];
-------------------------------------------------------------------------------}

begin
  Result := sForm;
end;


function TLHCClientPluginModuleCreator.GetExisting: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.GetExisting
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:  GetExisting����False����ʾ���ڴ����µĵ�Ԫ������������еĵ�Ԫ����ô�÷���������True
-------------------------------------------------------------------------------}
begin
  Result := False;
end;


function TLHCClientPluginModuleCreator.GetFileSystem: string;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.GetFileSystem
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  
-------------------------------------------------------------------------------}
begin
  Result := '';
end;


function TLHCClientPluginModuleCreator.GetFormName: string;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.GetFormName
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ��ʾ����ʾ������.
-------------------------------------------------------------------------------}
begin
  Result := 'LHCPlugin';
end;



function TLHCClientPluginModuleCreator.GetImplFileName: string;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.GetImplFileName
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ����һ��Ҫд����׺���ļ���.���û�а���ĥ��;
-------------------------------------------------------------------------------}
begin
  Result :='uPlugin.pas';
end;


function TLHCClientPluginModuleCreator.GetIntfFileName: string;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.GetIntfFileName
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ����C++ Builderʵ�ַ����������;
-------------------------------------------------------------------------------}
begin
  Result := '';
end;


function TLHCClientPluginModuleCreator.GetMainForm: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.GetMainForm
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:  ���ڱ�ģ�鲢�������壬����GetMainForm����False
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


function TLHCClientPluginModuleCreator.GetOwner: IOTAModule;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.GetOwner
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
    if AModule.QueryInterface(IOTAProject,NewModule) = S_OK then
      Result := NewModule
    else  if AModule.OwnerModuleCount >0 then
    begin
        NewModule :=  AModule.OwnerModules[0];
        if NewModule <> nil then
          if NewModule.QueryInterface(IOTAProject,Result) <> S_OK then
          Result := nil;
    end;
  end;
end;


function TLHCClientPluginModuleCreator.GetShowForm: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.GetShowForm
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:  ��ʾ�Ƿ���ʾ�����������Ĭ�Ϸ���ΪFalse;
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


function TLHCClientPluginModuleCreator.GetShowSource: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.GetShowSource
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:  Ĭ�Ϸ���ΪFalse,��ʾ�Ƿ���ʾԴ����;
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


function TLHCClientPluginModuleCreator.GetUnnamed: Boolean;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.GetUnnamed
  ����:      luohuachun
  ����:      2009.04.18
  ����:      ��
  ����ֵ:    Boolean
  ��ϸ˵��:  ������Ƿ���δ�����ĵ�Ԫ���÷���������True��
            ���GetUnnamed����True��Delphi���ڵ�һ�α��浥Ԫʱ��ʾ�û������ļ���.
            ��ʵ��˼�����ڵ�һ�α��浥Ԫ��ʱ���Ƿ���ʾ�������ļ���;
-------------------------------------------------------------------------------}
begin
  Result := false;
end;


function TLHCClientPluginModuleCreator.NewFormFile(const FormIdent, AncestorIdent: string):
    IOTAFile;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.NewFormFile
  ����:      luohuachun
  ����:      2009.04.18
  ����:      const FormIdent, AncestorIdent: string
  ����ֵ:    IOTAFile
  ��ϸ˵��:   ������Ķ������ļ�.Ҳ����.dfm�ļ�������;����IOTAFile����
             ��ʾ�����ļ���ʵ����������ɵ�ר�Ҳ���Ҫ���壬�򷵻�Nil;
-------------------------------------------------------------------------------}
begin
  Result := TFormFile.Create(Format(StrPas(FClientModuleDfmText),[FormIdent,AncestorIdent]));
end;


function TLHCClientPluginModuleCreator.NewImplSource(const ModuleIdent, FormIdent,
    AncestorIdent: string): IOTAFile;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.NewImplSource
  ����:      luohuachun
  ����:      2009.04.18
  ����:      const ModuleIdent, FormIdent, AncestorIdent: string
  ����ֵ:    IOTAFile
  ��ϸ˵��:  ���Ǹ��ؼ��Եķ������÷�������IOTAFile�����࣬���������ɵ�ר�ҵ�Դ����
-------------------------------------------------------------------------------}
begin
  Result := FUnitFile.Create(Format(StrPas(FClientModuleSourceText),[ModuleIdent,FormIdent,AncestorIdent]));
end;


function TLHCClientPluginModuleCreator.NewIntfSource(const ModuleIdent, FormIdent,
    AncestorIdent: string): IOTAFile;
{-------------------------------------------------------------------------------
  ������:    TLHCClientPluginModuleCreator.NewIntfSource
  ����:      luohuachun
  ����:      2009.04.18
  ����:      const ModuleIdent, FormIdent, AncestorIdent: string
  ����ֵ:    IOTAFile
  ��ϸ˵��:  CPPͷ�ļ��������ﷵ�ؿ��ַ�����Ҫ�ǵ�Delphi��C++ Builder����VCL����
-------------------------------------------------------------------------------}    
begin
end;


end.
