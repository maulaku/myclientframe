unit uClientModule;

interface

uses
  SysUtils, Classes, uDADataTable, uDARemoteDataAdapter, uRORemoteService,
  uDADataStreamer, uDABin2DataStreamer, uROClient, uROWinInetHttpChannel,
  uROBinMessage, DB, uDAInterfaces, uDAScriptingProvider, uDACDSDataTable,
  uDAMemDataTable;

type
  TdmClient = class(TDataModule)
    erpMessage: TROBinMessage;
    erpChannel: TROWinInetHTTPChannel;
    erpDataStreamer: TDABin2DataStreamer;
    erpRemoteService: TRORemoteService;
    erpRemoteDataAdapter: TDARemoteDataAdapter;
    cdsModules: TDACDSDataTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmClient: TdmClient;

implementation
uses uEnvironment;

{$R *.dfm}

procedure TdmClient.DataModuleCreate(Sender: TObject);
var
  sUrl:string;
begin
  sUrl := 'http://%s:%d/BIN';
  erpChannel.TargetURL := Format(sUrl,[Env.server,Env.Port]);
  erpChannel.Connected := False;
  erpChannel.Connected := True;

end;

end.
