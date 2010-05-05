{*******************************************************}
{                                                       }
{       客户插件                                        }
{                                                       }
{       版权所有 (C) 2009 动力工作室                    }
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
  过程名:    TLHCFormCreator.FormCreated
  作者:      luohuachun
  日期:      2009.04.18
  参数:      const FormEditor: IOTAFormEditor
  返回值:    无
  详细说明:  FormCreated是有窗体创建时所调用的事件方法
-------------------------------------------------------------------------------}
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

function TLHCFormCreator.GetAncestorName: string;

{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.GetAncestorName
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  返回模块所继承的祖先名
-------------------------------------------------------------------------------}

begin
  Result := 'Form';
end;

function TLHCFormCreator.GetCreatorType: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.GetCreatorType
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  指定创建的类型,包含窗体，单元，文本;[sForm,sUNIT,sText];
-------------------------------------------------------------------------------}

begin
  Result := sForm;
end;


function TLHCFormCreator.GetExisting: Boolean;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.GetExisting
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    Boolean
  详细说明:  GetExisting返回False，表示正在创建新的单元；如果引用已有的单元，那么该方法将返回True
-------------------------------------------------------------------------------}
begin
  Result := False;
end;


function TLHCFormCreator.GetFileSystem: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.GetFileSystem
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:
-------------------------------------------------------------------------------}
begin
  Result := '';
end;


function TLHCFormCreator.GetFormName: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.GetFormName
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  表示源代码的类名.
-------------------------------------------------------------------------------}
begin
  Result := 'FrmClient';
end;



function TLHCFormCreator.GetImplFileName: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.GetImplFileName
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  这里一定要写带后缀的文件名.差点没有把我磨死;
-------------------------------------------------------------------------------}
begin
  Result := 'uClientForm.pas';
end;


function TLHCFormCreator.GetIntfFileName: string;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.GetIntfFileName
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    string
  详细说明:  返回C++ Builder实现方法体的名称;
-------------------------------------------------------------------------------}
begin
  Result := '';
end;


function TLHCFormCreator.GetMainForm: Boolean;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.GetMainForm
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    Boolean
  详细说明:  由于本模块并非主窗体，所以GetMainForm返回False
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


function TLHCFormCreator.GetOwner: IOTAModule;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.GetOwner
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
  过程名:    TLHCFormCreator.GetShowForm
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    Boolean
  详细说明:  表示是否显示窗体设计器，默认返回为False;
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


function TLHCFormCreator.GetShowSource: Boolean;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.GetShowSource
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    Boolean
  详细说明:  默认返回为False,表示是否显示源代码;
-------------------------------------------------------------------------------}
begin
  Result := True;
end;


function TLHCFormCreator.GetUnnamed: Boolean;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.GetUnnamed
  作者:      luohuachun
  日期:      2009.04.18
  参数:      无
  返回值:    Boolean
  详细说明:  如果我们返回未命名的单元，该方法将返回True。
            如果GetUnnamed返回True，Delphi将在第一次保存单元时提示用户输入文件名.
            其实意思就是在第一次保存单元的时候，是否提示你输入文件名;
-------------------------------------------------------------------------------}
begin
  Result := False;
end;


function TLHCFormCreator.NewFormFile(const FormIdent, AncestorIdent: string):
  IOTAFile;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.NewFormFile
  作者:      luohuachun
  日期:      2009.04.18
  参数:      const FormIdent, AncestorIdent: string
  返回值:    IOTAFile
  详细说明:   定窗体的二进制文件.也就是.dfm文件的内容;返回IOTAFile对象，
             表示窗体文件的实例；如果生成的专家不需要窗体，则返回Nil;
-------------------------------------------------------------------------------}
var
  FFormText: pChar;
  ResInstance: THandle;
begin
  //加载窗体与单元资源
  ResInstance := FindResourceHInstance(HInstance);
  FFormText := StrNew(PChar(LockResource(LoadResource(ResInstance,
    FindResource(ResInstance, 'FORMDFMCODE', RT_RCDATA)))));
{$R FORMDFMCode.RES}
  Result := TFormFile.Create(Format(StrPas(FFormText), [FormIdent, AncestorIdent]));
end;


function TLHCFormCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.NewImplSource
  作者:      luohuachun
  日期:      2009.04.18
  参数:      const ModuleIdent, FormIdent, AncestorIdent: string
  返回值:    IOTAFile
  详细说明:  这是个关键性的方法：该方法返回IOTAFile的子类，包含了生成的专家的源代码
-------------------------------------------------------------------------------}
var
  FUnitText: pChar;
  ResInstance: THandle;
begin
{$R FormCode.RES}
  //加载窗体与单元资源
  ResInstance := FindResourceHInstance(HInstance);
  FUnitText := StrNew(PChar(LockResource(LoadResource(ResInstance,
    FindResource(ResInstance, 'FORMCODE', RT_RCDATA)))));
  Result := FUnitFile.Create(Format(StrPas(FUnitText), [ModuleIdent, FormIdent, AncestorIdent]));
end;


function TLHCFormCreator.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
{-------------------------------------------------------------------------------
  过程名:    TLHCFormCreator.NewIntfSource
  作者:      luohuachun
  日期:      2009.04.18
  参数:      const ModuleIdent, FormIdent, AncestorIdent: string
  返回值:    IOTAFile
  详细说明:  CPP头文件名，这里返回空字符串，要记得Delphi与C++ Builder共享VCL代码
   -------------------------------------------------------------------------------}
begin
end;


end.

