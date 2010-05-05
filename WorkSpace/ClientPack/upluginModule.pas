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
  //加载窗体与单元资源
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
  过程名:    TLHCClientPluginModuleCreator.FormCreated
  作者:      luohuachun
  日期:      2009.04.18
  参数:      const FormEditor: IOTAFormEditor
  返回值:    无
  详细说明:  FormCreated是有窗体创建时所调用的事件方法
-------------------------------------------------------------------------------}
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

function TLHCClientPluginModuleCreator.GetAncestorName: string;

{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.GetAncestorName
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  返回模块所继承的祖先名
-------------------------------------------------------------------------------}

begin
  Result :='LHCClientPlugin';
end;

function TLHCClientPluginModuleCreator.GetCreatorType: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.GetCreatorType
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  指定创建的类型,包含窗体，单元，文本;[sForm,sUNIT,sText];
-------------------------------------------------------------------------------}

begin
  Result := sForm;
end;


function TLHCClientPluginModuleCreator.GetExisting: Boolean;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.GetExisting
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    Boolean
  详细说明:  GetExisting返回False，表示正在创建新的单元；如果引用已有的单元，那么该方法将返回True
-------------------------------------------------------------------------------}
begin
  Result := False;
end;


function TLHCClientPluginModuleCreator.GetFileSystem: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.GetFileSystem
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  
-------------------------------------------------------------------------------}
begin
  Result := '';
end;


function TLHCClientPluginModuleCreator.GetFormName: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.GetFormName
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  表示中显示的类名.
-------------------------------------------------------------------------------}
begin
  Result := 'LHCPlugin';
end;



function TLHCClientPluginModuleCreator.GetImplFileName: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.GetImplFileName
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  这里一定要写带后缀的文件名.差点没有把我磨死;
-------------------------------------------------------------------------------}
begin
  Result :='uPlugin.pas';
end;


function TLHCClientPluginModuleCreator.GetIntfFileName: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.GetIntfFileName
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  返回C++ Builder实现方法体的名称;
-------------------------------------------------------------------------------}
begin
  Result := '';
end;


function TLHCClientPluginModuleCreator.GetMainForm: Boolean;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.GetMainForm
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    Boolean
  详细说明:  由于本模块并非主窗体，所以GetMainForm返回False
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


function TLHCClientPluginModuleCreator.GetOwner: IOTAModule;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.GetOwner
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    IOTAModule
  详细说明:  返回对拥有模块的引用。例如要将该模块添加到一个已有的工程，我们需要查询BorlandIDEServices以获得已有的工程或包
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
  过程名:    TLHCClientPluginModuleCreator.GetShowForm
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    Boolean
  详细说明:  表示是否显示窗体设计器，默认返回为False;
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


function TLHCClientPluginModuleCreator.GetShowSource: Boolean;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.GetShowSource
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    Boolean
  详细说明:  默认返回为False,表示是否显示源代码;
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


function TLHCClientPluginModuleCreator.GetUnnamed: Boolean;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.GetUnnamed
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    Boolean
  详细说明:  如果我们返回未命名的单元，该方法将返回True。
            如果GetUnnamed返回True，Delphi将在第一次保存单元时提示用户输入文件名.
            其实意思就是在第一次保存单元的时候，是否提示你输入文件名;
-------------------------------------------------------------------------------}
begin
  Result := false;
end;


function TLHCClientPluginModuleCreator.NewFormFile(const FormIdent, AncestorIdent: string):
    IOTAFile;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.NewFormFile
  作者:      luohuachun
  日期:      2009.04.18
  参数:      const FormIdent, AncestorIdent: string
  返回值:    IOTAFile
  详细说明:   定窗体的二进制文件.也就是.dfm文件的内容;返回IOTAFile对象，
             表示窗体文件的实例；如果生成的专家不需要窗体，则返回Nil;
-------------------------------------------------------------------------------}
begin
  Result := TFormFile.Create(Format(StrPas(FClientModuleDfmText),[FormIdent,AncestorIdent]));
end;


function TLHCClientPluginModuleCreator.NewImplSource(const ModuleIdent, FormIdent,
    AncestorIdent: string): IOTAFile;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.NewImplSource
  作者:      luohuachun
  日期:      2009.04.18
  参数:      const ModuleIdent, FormIdent, AncestorIdent: string
  返回值:    IOTAFile
  详细说明:  这是个关键性的方法：该方法返回IOTAFile的子类，包含了生成的专家的源代码
-------------------------------------------------------------------------------}
begin
  Result := FUnitFile.Create(Format(StrPas(FClientModuleSourceText),[ModuleIdent,FormIdent,AncestorIdent]));
end;


function TLHCClientPluginModuleCreator.NewIntfSource(const ModuleIdent, FormIdent,
    AncestorIdent: string): IOTAFile;
{-------------------------------------------------------------------------------
  过程名:    TLHCClientPluginModuleCreator.NewIntfSource
  作者:      luohuachun
  日期:      2009.04.18
  参数:      const ModuleIdent, FormIdent, AncestorIdent: string
  返回值:    IOTAFile
  详细说明:  CPP头文件名，这里返回空字符串，要记得Delphi与C++ Builder共享VCL代码
-------------------------------------------------------------------------------}    
begin
end;


end.
