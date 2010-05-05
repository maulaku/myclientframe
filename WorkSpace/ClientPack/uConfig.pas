{********************************************************

�����

��Ȩ���� (C) 2009 ��˾��

��������:
ģ����:     ��ȡ���ݿ������ļ�
����:�޻���
����ʱ��:
����ʱ��:
������ʷ:



*********************************************************}


unit uConfig;


interface
uses XMLINI, SysUtils, Windows, Dialogs, Forms;

type
  TDbLinkInformation = class;

  //1���ݹ������ýӿڡ�
  iConfig = interface(IInterface)
    ['{712DDBBA-CBFE-470C-9E3B-295484B3BA3E}']
    function getConnectionString: string; stdcall;
    function ReadConfig: TDbLinkInformation; stdcall;
    procedure WriteConfig(ADbLinkInformation: TDbLinkInformation); stdcall;
  end;

  TAbstractConfig = class(TInterfacedObject)
  protected
    Ini: TXMLIni;
  public
    constructor create;
    destructor Destroy; override;
  end;

  //ORACLE���ù������;
  TORACLEConfig = class(TAbstractConfig, iConfig)
  public
    function getConnectionString: string; stdcall;
    function ReadConfig: TDbLinkInformation; stdcall;
    procedure WriteConfig(ADbLinkInformation: TDbLinkInformation); stdcall;
  end;

  //SQLSERVER���ù������
  TSQLServerConfig = class(TAbstractConfig, iConfig)
  public
    function getConnectionString: string; stdcall;
    function ReadConfig: TDbLinkInformation; stdcall;
    procedure WriteConfig(ADbLinkInformation: TDbLinkInformation); stdcall;
  end;

  //����������Ϣ����
  TDbLinkInformation = class(TObject)
  private
    FPassWord: string;
    FPort: Integer;
    FProviderName: string;
    FServerName: string;
    FUserName: string;
    FDataBasename: string;
  public
    property PassWord: string read FPassWord write FPassWord;
    property Port: Integer read FPort write FPort;
    property ProviderName: string read FProviderName write FProviderName;
    property ServerName: string read FServerName write FServerName;
    property UserName: string read FUserName write FUserName;
    property DataBaseName: string read FDataBasename write FDataBaseName;
  end;

implementation



{
******************************** TORACLEConfig *********************************
}


function TORACLEConfig.getConnectionString: string;
{-------------------------------------------------------------------------------
  ������:    TORACLEConfig.getConnectionString
  ����:      luohuachun
  ����:      2009.07.05
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ����������Ϣ

-------------------------------------------------------------------------------}
var
  _DbLinkInformation: TDBLinkInformation;
begin
  _DbLinkInformation := ReadConfig;
  try
    Result := Format('Provider=%s;Data Source=%s;User Id=%s;Password=%s',
      [
      _DbLinkInformation.ProviderName,
        _DbLinkInformation.ServerName,
        _DbLinkInformation.UserName,
        _DbLinkInformation.PassWord
        ]);
  finally
    FreeAndNil(_DbLinkInformation);
  end;
end;



function TORACLEConfig.ReadConfig: TDbLinkInformation;

  {-------------------------------------------------------------------------------
    ������:    TORACLEConfig.ReadConfig
    ����:      luohuachun
    ����:      2009.07.01
    ����:      ��
    ����ֵ:    TDbLinkInformation
    ��ϸ˵��:  ��ȡ���ݿ�������Ϣ
  -------------------------------------------------------------------------------}

begin
  Result := TDBLinkInformation.Create;
  with Result do begin
    ProviderName := Ini.ReadString('Local', 'ProviderName', '');
    ServerName := Ini.ReadString('Local', 'ServerName', '');
    UserName := Ini.ReadString('Local', 'UserName', '');
    PassWord := Ini.ReadString('Local', 'PassWord', '');
    Port := Ini.ReadInteger('Local', 'Port', 0);
  end;
end;

procedure TORACLEConfig.WriteConfig(ADbLinkInformation: TDbLinkInformation);

  {-------------------------------------------------------------------------------
    ������:    TORACLEConfig.WriteConfig
    ����:      luohuachun
    ����:      2009.07.01
    ����:      ADbLinkInformation: TDbLinkInformation
    ����ֵ:    ��
    ��ϸ˵��:  д�����ݿ�������Ϣ
  -------------------------------------------------------------------------------}

begin
  with ADbLinkInformation do begin
    Ini.WriteString('Local', 'ProviderName', ProviderName);
    Ini.WriteString('Local', 'ServerName', ServerName);
    Ini.WriteString('Local', 'UserName', UserName);
    Ini.WriteString('Local', 'PassWord', PassWord);
    Ini.WriteInteger('Local', 'Port', Port);
  end;
end;

{
******************************* TSQLServerConfig *******************************
}


function TSQLServerConfig.getConnectionString: string;
{-------------------------------------------------------------------------------
  ������:    TSQLServerConfig.getConnectionString
  ����:      luohuachun
  ����:      2009.07.05
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ȡ�������ַ���

-------------------------------------------------------------------------------}
var
  _DbLinkInformation: TDBLinkInformation;
begin
  _DbLinkInformation := ReadConfig;
  try
    Result := Format('Provider=%s;Password=%s;Persist Security Info=True;User ID=%s;Initial Catalog=%s;Data Source=%s',
      [
      _DbLinkInformation.ProviderName,
        _DbLinkInformation.PassWord,
        _DbLinkInformation.UserName,
        _DbLinkInformation.DataBaseName,
        _DbLinkInformation.ServerName
        ]);
  finally
    FreeAndNil(_DbLinkInformation);
  end;
end;

function TSQLServerConfig.ReadConfig: TDbLinkInformation;

  {-------------------------------------------------------------------------------
    ������:    TORACLEConfig.ReadConfig
    ����:      luohuachun
    ����:      2009.07.01
    ����:      ��
    ����ֵ:    TDbLinkInformation
    ��ϸ˵��:  ��ȡ���ݿ�������Ϣ
  -------------------------------------------------------------------------------}

begin
  Result := TDBLinkInformation.Create;
  with Result do begin
    ProviderName := Ini.ReadString('Local', 'ProviderName', '');
    ServerName := Ini.ReadString('Local', 'ServerName', '');
    UserName := Ini.ReadString('Local', 'UserName', '');
    PassWord := Ini.ReadString('Local', 'PassWord', '');
    Port := Ini.ReadInteger('Local', 'Port', 0);
  end;
end;

procedure TSQLServerConfig.WriteConfig(ADbLinkInformation: TDbLinkInformation);

  {-------------------------------------------------------------------------------
    ������:    TSQLServerConfig.WriteConfig
    ����:      luohuachun
    ����:      2009.07.01
    ����:      ADbLinkInformation: TDbLinkInformation
    ����ֵ:    ��
    ��ϸ˵��:  д�����ݿ�������Ϣ
  -------------------------------------------------------------------------------}

begin
  with ADbLinkInformation do begin
    Ini.WriteString('Local', 'ProviderName', ProviderName);
    Ini.WriteString('Local', 'ServerName', ServerName);
    Ini.WriteString('Local', 'UserName', UserName);
    Ini.WriteString('Local', 'PassWord', PassWord);
    Ini.WriteInteger('Local', 'Port', Port);
  end;
end;

{ TAbstractConfig }

{
******************************* TAbstractConfig ********************************
}

constructor TAbstractConfig.create;
{-------------------------------------------------------------------------------
  ������:    TAbstractConfig.create
  ����:      luohuachun
  ����:      2009.07.05
  ����:      ��
  ����ֵ:    ��
  ��ϸ˵��:  ����������Ϣ
-------------------------------------------------------------------------------}
var
  Path: string;
  function getPath: string;
  var
    aPath: string;
  begin
    aPath := ExtractFilePath(Application.ExeName);
    if aPath[Length(aPath)] <> '\' then
      aPath := aPath + '\';

    Result := aPath;
  end;
begin
  Path := getPath + 'Config.xml';
  ini := TXmlini.Create(Path);
end;

destructor TAbstractConfig.Destroy;
begin
  FreeAndNil(Ini);
  inherited;
end;

end.

