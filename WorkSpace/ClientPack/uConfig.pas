{********************************************************

软件名

版权所有 (C) 2009 公司名

工程名称:
模块名:     读取数据库配置文件
作者:罗华春
创建时间:
更新时间:
更新历史:



*********************************************************}


unit uConfig;


interface
uses XMLINI, SysUtils, Windows, Dialogs, Forms;

type
  TDbLinkInformation = class;

  //1数据管理配置接口。
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

  //ORACLE配置管理对象;
  TORACLEConfig = class(TAbstractConfig, iConfig)
  public
    function getConnectionString: string; stdcall;
    function ReadConfig: TDbLinkInformation; stdcall;
    procedure WriteConfig(ADbLinkInformation: TDbLinkInformation); stdcall;
  end;

  //SQLSERVER配置管理对象
  TSQLServerConfig = class(TAbstractConfig, iConfig)
  public
    function getConnectionString: string; stdcall;
    function ReadConfig: TDbLinkInformation; stdcall;
    procedure WriteConfig(ADbLinkInformation: TDbLinkInformation); stdcall;
  end;

  //数据连接信息对象
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
  过程名:    TORACLEConfig.getConnectionString
  作者:      luohuachun
  日期:      2009.07.05
  参数:      无
  返回值:    string
  详细说明:  数据连接信息

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
    过程名:    TORACLEConfig.ReadConfig
    作者:      luohuachun
    日期:      2009.07.01
    参数:      无
    返回值:    TDbLinkInformation
    详细说明:  读取数据库连接信息
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
    过程名:    TORACLEConfig.WriteConfig
    作者:      luohuachun
    日期:      2009.07.01
    参数:      ADbLinkInformation: TDbLinkInformation
    返回值:    无
    详细说明:  写入数据库连接信息
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
  过程名:    TSQLServerConfig.getConnectionString
  作者:      luohuachun
  日期:      2009.07.05
  参数:      无
  返回值:    string
  详细说明:  取得连接字符串

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
    过程名:    TORACLEConfig.ReadConfig
    作者:      luohuachun
    日期:      2009.07.01
    参数:      无
    返回值:    TDbLinkInformation
    详细说明:  读取数据库连接信息
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
    过程名:    TSQLServerConfig.WriteConfig
    作者:      luohuachun
    日期:      2009.07.01
    参数:      ADbLinkInformation: TDbLinkInformation
    返回值:    无
    详细说明:  写入数据库连接信息
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
  过程名:    TAbstractConfig.create
  作者:      luohuachun
  日期:      2009.07.05
  参数:      无
  返回值:    无
  详细说明:  生成配置信息
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

