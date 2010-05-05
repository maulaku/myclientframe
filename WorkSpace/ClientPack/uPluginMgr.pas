{********************************************************

������Ϣ����ϵͳ
��Ȩ���� (C) 2010 ������Ϣ�������޹�˾
�������:  ���������������أ�����

*********************************************************}


unit uPluginMgr;

interface

uses classes, SysUtils,uROClasses;

type
  TPluginInformation = class;

  TPluginMgr = class(TObject)
  private
    function isExists(Aplugin: TPluginInformation): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Download;
    procedure PublishModule(APlugin: TPluginInformation);
    function Read(AName: string): TPluginInformation;
  end;

  TPluginInformation = class(TObject)
  private
    FAuthor: string;
    FCaption: string;
    FContext: TMemoryStream;
    FCreateTime: TDateTime;
    FFileName: string;
    Fflag: Integer;
    Fid: Integer;
    FModuleGuid: string;
    FName: string;
    FReMark: string;
    FUpdateTime: TDateTime;
    FVersion: string;
  public
    constructor Create;
    destructor Destroy; override;
    property Author: string read FAuthor write FAuthor;
    property Caption: string read FCaption write FCaption;
    property Context: TMemoryStream read FContext write FContext;
    property CreateTime: TDateTime read FCreateTime write FCreateTime;
    property FileName: string read FFileName write FFileName;
    property flag: Integer read Fflag write Fflag;
    property id: Integer read Fid write Fid;
    property ModuleGuid: string read FModuleGuid write FModuleGuid;
    property Name: string read FName write FName;
    property ReMark: string read FReMark write FReMark;
    property UpdateTime: TDateTime read FUpdateTime write FUpdateTime;
    property Version: string read FVersion write FVersion;
  end;

implementation

uses
  uClientModule, uEnvironment, DB, DBClient, DateUtils, Dialogs, uDAInterfaces;


constructor TPluginMgr.Create;
begin
  inherited;
  dmClient := TdmClient.Create(nil);
end;

destructor TPluginMgr.Destroy;
begin
  FreeAndNil(dmClient);
  inherited;
end;

procedure TPluginMgr.Download;
{-------------------------------------------------------------------------------
  ������:    TPluginMgr.Download
  ����:      �޻���
  ����:      2010.04.24
  ����:      ��
  ����ֵ:    ��
  ��ϸ˵��:  �����ݿ����������в��
-------------------------------------------------------------------------------}
begin

end;

function TPluginMgr.isExists(Aplugin: TPluginInformation): Boolean;
{-------------------------------------------------------------------------------
  ������:    TPluginMgr.isExists
  ����:      �޻���
  ����:      2010.04.24
  ����:      Aplugin:TPluginInformation
  ����ֵ:    ��
  ��ϸ˵��:  ����Ƿ����
-------------------------------------------------------------------------------}
begin
  Result := dmClient.cdsModules.Locate('Name', Aplugin.Name, []);
end;

procedure TPluginMgr.PublishModule(APlugin: TPluginInformation);
{-------------------------------------------------------------------------------
  ������:    TfrmPluginProperty.PublishModule
  ����:      �޻���
  ����:      2010.04.23
  ����:      APlugin:TPluginInformation
  ����ֵ:    ��
  ��ϸ˵��:  �������
-------------------------------------------------------------------------------}
begin
  showMessage('a');
  with dmClient.cdsModules do begin
    if not Active then
      open;
    if not Locate('Name', APlugin.Name, []) then begin
      showMessage('0o');
      Append;
      FieldByName('ModalGuid').AsString := Env.NewGuid;
      showMessage('000');
      FieldByName('Name').AsString := APlugin.Name;
      FieldByName('Caption').AsString := APlugin.Caption;
      FieldByName('Flag').AsInteger := 1;
      FieldByName('FileName').AsString := APlugin.FileName;
      TDaField(FieldByName('Functioning')).LoadFromStream(APlugin.Context);
      FieldByName('CreateTime').AsDateTime := today;
      FieldByName('UpdateTime').AsDateTime := today;
      Post;
      ApplyUpdates();
    end else begin
      edit;
//      FieldByName('ModalGuid').AsString := Env.NewGuid; //ģ��Guid������ı�
//      FieldByName('Name').AsString := APlugin.Name;  // ģ�����Ʋ�����ı�
      FieldByName('Caption').AsString := APlugin.Caption;
      FieldByName('Flag').AsInteger := 1;
      FieldByName('FileName').AsString := APlugin.FileName;
      TDaField(FieldByName('Functioning')).LoadFromStream(APlugin.Context);
      FieldByName('UpdateTime').AsDateTime := today;
      Post;
      showMessage('4');
      ApplyUpdates();
      showMessage('5');
    end;
  end;
end;

function TPluginMgr.Read(AName: string): TPluginInformation;
{-------------------------------------------------------------------------------
  ������:    TPluginMgr.Read
  ����:      �޻���
  ����:      2010.04.24
  ����:      AName:String
  ����ֵ:    TPluginInformation
  ��ϸ˵��:  ��ClientDataSet�ж�ȡ�����Ϣ
-------------------------------------------------------------------------------}
begin
  Result := nil;
  with dmClient.cdsModules do begin
    Filtered := False;
    try
      Filter := 'Name =' + AName;
      Filtered := True;
      if not isEmpty then
      begin
        Result := TPluginInformation.Create;
        with Result do begin
          id := FieldByName('id').AsInteger;
          Caption := FieldByName('Caption').AsString;
          Name := FieldByName('Name').AsString;
          ModuleGuid := FieldByName('ModuleGruid').AsString;
          FileName := FieldByName('FileName').AsString;
          FieldByName('Function').SaveToStream(Context);
          CreateTime := FieldByName('CreateTime').AsDateTime;
          UpdateTime := FieldByName('UpdateTime').AsDateTime;
        end;
      end;
    finally
      Filtered := True;
    end;
  end;
end;


constructor TPluginInformation.Create;
begin
  inherited;
  FContext := TMemoryStream.Create;
end;

destructor TPluginInformation.Destroy;
begin
  FreeAndNil(FContext);
  inherited;
end;

end.

