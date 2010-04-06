{********************************************************

������Ϣ����ϵͳ
��Ȩ���� (C) 2010 ������Ϣ�������޹�˾
�������:  ����ģ��

*********************************************************}


unit fServerDataModule;

interface

uses
  SysUtils, Classes,
  uROClient, uROPoweredByRemObjectsButton, uROClientIntf, uROServer,
  uROBinMessage, uROIndyHTTPServer, SimpleLogger,
  uDAEngine, uDADriverManager, uDAClasses, uROSessions,
  uDAIBXDriver, uDAADODriver, uROIndyTCPServer, uDAInterfaces;

type
  TServerDataModule = class(TDataModule)
    Server: TROIndyHTTPServer;
      Message: TROBinMessage;
    ConnectionManager: TDAConnectionManager;
    DriverManager: TDADriverManager;
    ADODriver: TDAADODriver;
    IBXDriver: TDAIBXDriver;
    DataDictionary: TDADataDictionary;
    SessionManager: TROInMemorySessionManager;
    procedure ConnectionManagerConnectionCreated(Sender: TDAConnectionManager;
        const Connection: IDAConnection);
    procedure ConnectionManagerConnectionFailure(Sender: TDAConnectionManager; Ex:
        Exception);
    procedure ConnectionManagerConnectionReleased(Sender: TDAConnectionManager;
        const Connection: IDAConnection);
    procedure ConnectionManagerConnectionTimedOut(Sender: TDAConnectionManager);
    procedure DataModuleCreate(Sender: TObject);
    procedure MessageServerException(anException: Exception; var RaiseException:
      Boolean);
    procedure SessionManagerException(aSessionID: TGUID; anException: Exception;
        var aRetry: Boolean);
    procedure SessionManagerSessionCreated(const aSession: TROSession);
    procedure SessionManagerSessionDeleted(const aSessionID: TGUID; IsExpired:
        Boolean);
  private
    FOnLogEvent: TLogEvent;
    { Private declarations }
  protected
    property OnLogEvent: TLogEvent read FOnLogEvent write FOnLogEvent;
    procedure WriteLog(aType: Integer; S: string);
  public
    { Public declarations }
  end;

var
  ServerDataModule: TServerDataModule;

implementation

uses
  uEnvironment;

{$R *.dfm}

procedure TServerDataModule.ConnectionManagerConnectionCreated(Sender:
    TDAConnectionManager; const Connection: IDAConnection);
begin 
   WriteLog(2, Format('��������:%s',[Connection.ConnectionString]));
end;

procedure TServerDataModule.ConnectionManagerConnectionFailure(Sender:
    TDAConnectionManager; Ex: Exception);
begin
   WriteLog(-1, Format('����ʧ��:%s',[ex.Message]));
end;

procedure TServerDataModule.ConnectionManagerConnectionReleased(Sender:
    TDAConnectionManager; const Connection: IDAConnection);
begin
   WriteLog(2, Format('�����ͷ�:%s',[Connection.ConnectionString]));
end;

procedure TServerDataModule.ConnectionManagerConnectionTimedOut(Sender:
    TDAConnectionManager);
begin
  WriteLog(-1, Format('���ӳ�ʱ.',[]));
end;

procedure TServerDataModule.DataModuleCreate(Sender: TObject);
begin
  OnLogEvent := Log.HandleLog; //������־
  WriteLog(2, '����׼������');
  Server.Port := Env.Port;
  try
    Server.Active := true;
    WriteLog(0, Format('��������,�˿�:%d',[Server.Port]));
  except
    WriteLog(0, Format('���������쳣,�˿�:%d',[Server.Port]));
  end;
end;

procedure TServerDataModule.MessageServerException(anException: Exception; var
  RaiseException: Boolean);
begin
  WriteLog(-1, Format('�������쳣,%s', [anException.Message]));
end;

procedure TServerDataModule.SessionManagerException(aSessionID: TGUID;
    anException: Exception; var aRetry: Boolean);
begin
  WriteLog(-1, Format('Session�쳣,%s', [anException.Message]));
end;

procedure TServerDataModule.SessionManagerSessionCreated(const aSession:
    TROSession);
begin
  WriteLog(2, Format('����Session;', []));
end;

procedure TServerDataModule.SessionManagerSessionDeleted(const aSessionID:
    TGUID; IsExpired: Boolean);
begin
  WriteLog(2, Format('ɾ��Session;', []));
end;

procedure TServerDataModule.WriteLog(aType: Integer; S: string);
begin
  if Assigned(FOnLogEvent) then FOnLogEvent(Self, aType, S);
end;

end.

