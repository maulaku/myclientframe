unit fClientDataModule;

interface

uses 
  {vcl:} SysUtils, Classes, DB, DBClient, 
  {RemObjects:} uROClient, uROClientIntf, uRORemoteService, uROBinMessage, uROWinInetHTTPChannel, 
  {Data Abstract:} uDADataTable, uDABINAdapter, uDAInterfaces,
  uDADataStreamer, uDARemoteDataAdapter, uDAScriptingProvider,
  uDACDSDataTable;

type
  TClientDataModule = class(TDataModule)
    Message: TROBinMessage;
    Channel: TROWinInetHTTPChannel;
    RemoteService: TRORemoteService;
    DataStreamer: TDABinDataStreamer;
    RemoteDataAdapter: TDARemoteDataAdapter;
    tbl_MyTable: TDACDSDataTable;
    ds_MyTable: TDADataSource;
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
