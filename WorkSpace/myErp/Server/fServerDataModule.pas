unit fServerDataModule;

interface

uses
  SysUtils, Classes,
  uROClient, uROPoweredByRemObjectsButton, uROClientIntf, uROServer,
  uROBinMessage, uROIndyHTTPServer,
  uDAEngine, uDADriverManager, uDAClasses, uROSessions,
  uDAIBXDriver, uDAADODriver, uROIndyTCPServer, uDAODACDriver;

type
  TServerDataModule = class(TDataModule)
    Server: TROIndyHTTPServer;
    Message: TROBinMessage;
    ConnectionManager: TDAConnectionManager;
    DriverManager: TDADriverManager;
    SessionManager: TROInMemorySessionManager;
    DAODACDriver: TDAODACDriver;
    DataDictionary: TDADataDictionary;
    
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerDataModule: TServerDataModule;

implementation

{$R *.dfm}

procedure TServerDataModule.DataModuleCreate(Sender: TObject);
begin
  Server.Active := true;
end;

end.
