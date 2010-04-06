{********************************************************

动力信息管理系统
版权所有 (C) 2010 动力信息技术有限公司
软件功能:  服务模块

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
   WriteLog(2, Format('创建连接:%s',[Connection.ConnectionString]));
end;

procedure TServerDataModule.ConnectionManagerConnectionFailure(Sender:
    TDAConnectionManager; Ex: Exception);
begin
   WriteLog(-1, Format('连接失败:%s',[ex.Message]));
end;

procedure TServerDataModule.ConnectionManagerConnectionReleased(Sender:
    TDAConnectionManager; const Connection: IDAConnection);
begin
   WriteLog(2, Format('连接释放:%s',[Connection.ConnectionString]));
end;

procedure TServerDataModule.ConnectionManagerConnectionTimedOut(Sender:
    TDAConnectionManager);
begin
  WriteLog(-1, Format('连接超时.',[]));
end;

procedure TServerDataModule.DataModuleCreate(Sender: TObject);
begin
  OnLogEvent := Log.HandleLog; //关联日志
  WriteLog(2, '服务准备启动');
  Server.Port := Env.Port;
  try
    Server.Active := true;
    WriteLog(0, Format('服务启动,端口:%d',[Server.Port]));
  except
    WriteLog(0, Format('服务启动异常,端口:%d',[Server.Port]));
  end;
end;

procedure TServerDataModule.MessageServerException(anException: Exception; var
  RaiseException: Boolean);
begin
  WriteLog(-1, Format('服务发生异常,%s', [anException.Message]));
end;

procedure TServerDataModule.SessionManagerException(aSessionID: TGUID;
    anException: Exception; var aRetry: Boolean);
begin
  WriteLog(-1, Format('Session异常,%s', [anException.Message]));
end;

procedure TServerDataModule.SessionManagerSessionCreated(const aSession:
    TROSession);
begin
  WriteLog(2, Format('创建Session;', []));
end;

procedure TServerDataModule.SessionManagerSessionDeleted(const aSessionID:
    TGUID; IsExpired: Boolean);
begin
  WriteLog(2, Format('删除Session;', []));
end;

procedure TServerDataModule.WriteLog(aType: Integer; S: string);
begin
  if Assigned(FOnLogEvent) then FOnLogEvent(Self, aType, S);
end;

end.

