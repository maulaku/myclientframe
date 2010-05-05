unit uRegister;

interface
uses ToolsAPI, uApplication, upluginModule, uPluginProject, uPackAge, uDll,
  uConsole, Forms, uForm, dmForm, DesignIntf, Designer, uClientPlugin, uClientPluginEditor,
  uPluginInfo;

procedure Register;
implementation

procedure Register;
begin
  //ע�ᴰ����
  RegisterPackageWizard(TLHCFormCreatorWizard.Create);
  //ע�Ṥ����
  RegisterPackageWizard(TLHCApplicationCreatorWizard.Create);
  //ע����������
  RegisterPackageWizard(TLHCPluginCreatorWizard.Create);
//  ע����ģ����
  RegisterPackageWizard(TLHCClientPluginModuleCreatorWizard.Create);
//  ע��Ӧ�ó�����
//
//  ע�����
  RegisterPackageWizard(TLHCPackageCreatorWizard.Create);
//  ע�ᵥԪ��
//  ע�ᶯ̬���ӿ���
  RegisterPackageWizard(TLHCDLLCreatorWizard.Create);
//  ע��ؼ�̨��
  RegisterPackageWizard(TLHCConsoleCreatorWizard.Create);
  //ע���Զ���ģ��
  RegisterCustomModule(TLHCClientPlugin, TDataModuleCustomModule);

  RegisterComponentEditor(TLHCClientPlugin, TLHCClientPluginEditor);

//  RegisterComponentEditor(TForm,TMyEditor);
  RegisterPropertyEditor(TypeInfo(TPluginInfo), nil, 'PluginInfo', TPluginInfoProperty);

end;

end.

