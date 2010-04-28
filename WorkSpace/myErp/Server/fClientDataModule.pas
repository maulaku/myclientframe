unit fClientDataModule;

interface

uses 
  {vcl:} SysUtils, Classes, DB, DBClient, 
  {RemObjects:} uROClient, uROClientIntf, uRORemoteService, uROBinMessage, uROWinInetHTTPChannel, 
  {Data Abstract:} uDADataTable, uDABin2DataStreamer, uDAInterfaces, uDARemoteDataAdapter;

type
  TClientDataModule = class(TDataModule)
    Message: TROBinMessage;
    Channel: TROWinInetHTTPChannel;
    RemoteService: TRORemoteService;
    DataStreamer: TDABin2DataStreamer;
    RemoteDataAdapter: TDARemoteDataAdapter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientDataModule: TClientDataModule;

implementation

{$R *.dfm}

end.
