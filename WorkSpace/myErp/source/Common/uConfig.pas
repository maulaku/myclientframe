{=============================================================================

����������
��Ȩ���� (C) 2009 ����������

��������:  �������
����:      �޻���
����ʱ��:  2009-5-17 22:07:07
����˵��:  ���ݿ������ļ�
==============================================================================}


unit uConfig;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, Registry, RegStr;

type
  TConfig = class(TObject)
  private
    FLocalIP: string;
    FPassWord: string;
    FPort: Integer;
    FProviderName: string;
    FRemoteIP: string;
    FRemotePassWord: string;
    FRemotePort: Integer;
    FRemoteServerName: string;
    FRemoteUserName: string;
    FServerName: string;
    FUserName: string;
    reg: TRegIniFile;
    function GetDriverName: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ReadLocalConfig;
    procedure ReadRemoteConfig;
    procedure WriteLocalConfig;
    procedure WriteRemoteConfig;
    property DriverName: string read GetDriverName;
    property LocalIP: string read FLocalIP write FLocalIP;
    property PassWord: string read FPassWord write FPassWord;
    property Port: Integer read FPort write FPort;
    property ProviderName: string read FProviderName write FProviderName;
    property RemoteIP: string read FRemoteIP write FRemoteIP;
    property RemotePassWord: string read FRemotePassWord write FRemotePassWord;
    property RemotePort: Integer read FRemotePort write FRemotePort;
    property RemoteServerName: string read FRemoteServerName write
      FRemoteServerName;
    property RemoteUserName: string read FRemoteUserName write FRemoteUserName;
    property ServerName: string read FServerName write FServerName;
    property UserName: string read FUserName write FUserName;
  end;


implementation

{
*********************************** TConfig ************************************
}

constructor TConfig.Create;
begin
  inherited Create;
  reg := TRegIniFile.Create('Config');
end;

destructor TConfig.Destroy;
begin
  reg.CloseKey;
  FreeAndNil(reg);

  inherited Destroy;
end;

function TConfig.GetDriverName: string;
{-------------------------------------------------------------------------------
  ������:    TConfig.GetDriverName
  ����:      �޻���
  ����:      2009.05.21
  ����:      ��
  ����ֵ:    String
  ��ϸ˵��:  ȡ�������ַ���
-------------------------------------------------------------------------------}
begin
  Result := Format('%s:%s:%s', [FLocalIP, IntToStr(FPort), FServerName]);
end;

procedure TConfig.ReadLocalConfig;

  {-------------------------------------------------------------------------------
    ������:    TConfig.ReadLocalConfig
    ����:      �޻���
    ����:      2009.05.17
    ����:      ��
    ����ֵ:    ��
    ˵��:      ��ȡ��������
  -------------------------------------------------------------------------------}

begin
  LocalIp := reg.ReadString('Local', 'Ip', '');
  ServerName := reg.ReadString('Local', 'ServerName', '');
  PassWord := reg.ReadString('Local', 'PassWord', '');
  UserName := reg.ReadString('Local', 'UserName', '');
  Port := reg.ReadInteger('Local', 'Port', 0);
  ProviderName := reg.ReadString('Local', 'ProviderName', '');
end;

procedure TConfig.ReadRemoteConfig;

  {-------------------------------------------------------------------------------
    ������:    TConfig.ReadRemoteConfig
    ����:      �޻���
    ����:      2009.05.17
    ����:      ��
    ����ֵ:    ��
    ˵��:      ��ȡԶ������
  -------------------------------------------------------------------------------}

begin
  RemoteIp := reg.ReadString('Remote', 'Ip', '');
  RemoteServerName := reg.ReadString('Remote', 'RemoteServerName', '');
  RemotePassWord := reg.ReadString('Remote', 'PassWord', '');
  RemoteUserName := reg.ReadString('Remote', 'UserName', '');
  RemotePort := reg.ReadInteger('Remote', 'Port', 0);
  ProviderName := reg.ReadString('Remote', 'ProviderName', '');
end;

procedure TConfig.WriteLocalConfig;

  {-------------------------------------------------------------------------------
    ������:    TConfig.WriteLocalConfig
    ����:      �޻���
    ����:      2009.05.17
    ����:      ��
    ����ֵ:    ��
    ˵��:      д�뱾������
  -------------------------------------------------------------------------------}

begin
  reg.WriteString('Local', 'Ip', LocalIp);
  reg.WriteString('Local', 'ServerName', ServerName);
  reg.WriteString('Local', 'PassWord', PassWord);
  reg.WriteString('Local', 'UserName', UserName);
  reg.WriteInteger('Local', 'Port', Port);
  reg.WriteString('Local', 'ProviderName', ProviderName);
end;

procedure TConfig.WriteRemoteConfig;

  {-------------------------------------------------------------------------------
    ������:    TConfig.WriteRemoteConfig
    ����:      �޻���
    ����:      2009.05.17
    ����:      ��
    ����ֵ:    ��
    ˵��:      д��Զ������
  -------------------------------------------------------------------------------}

begin
  reg.WriteString('Remote', 'Ip', RemoteIp);
  reg.WriteString('Remote', 'ServerName', RemoteServerName);
  reg.WriteString('Remote', 'PassWord', RemotePassWord);
  reg.WriteString('Remote', 'UserName', RemoteUserName);
  reg.WriteInteger('Remote', 'Port', RemotePort);
  reg.WriteString('Remote', 'ProviderName', ProviderName);
end;  

end.

