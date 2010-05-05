unit uRegister;

interface
uses ToolsAPI, uApplication, upluginModule, uPluginProject, uPackAge, uDll,
  uConsole, Forms, uForm, dmForm, DesignIntf, Designer, uClientPlugin, uClientPluginEditor,
  uPluginInfo;

procedure Register;
implementation

procedure Register;
begin
  //注册窗体向导
  RegisterPackageWizard(TLHCFormCreatorWizard.Create);
  //注册工程向导
  RegisterPackageWizard(TLHCApplicationCreatorWizard.Create);
  //注册插件工程向导
  RegisterPackageWizard(TLHCPluginCreatorWizard.Create);
//  注册插件模块向导
  RegisterPackageWizard(TLHCClientPluginModuleCreatorWizard.Create);
//  注册应用程序向导
//
//  注册包向导
  RegisterPackageWizard(TLHCPackageCreatorWizard.Create);
//  注册单元向导
//  注册动态链接库向导
  RegisterPackageWizard(TLHCDLLCreatorWizard.Create);
//  注册控件台向导
  RegisterPackageWizard(TLHCConsoleCreatorWizard.Create);
  //注册自定义模块
  RegisterCustomModule(TLHCClientPlugin, TDataModuleCustomModule);

  RegisterComponentEditor(TLHCClientPlugin, TLHCClientPluginEditor);

//  RegisterComponentEditor(TForm,TMyEditor);
  RegisterPropertyEditor(TypeInfo(TPluginInfo), nil, 'PluginInfo', TPluginInfoProperty);

end;

end.

