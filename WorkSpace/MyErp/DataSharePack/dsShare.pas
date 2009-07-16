unit dsShare;

interface

uses
  Classes,SysUtils,UniProvider, DB, DBAccess, Uni,uConfig,oracleUniProvider;

type
  TShare = class(TDataModule)
  private
    FLocalDB: TUniConnection;
    function GetLocalDB: TUniConnection;

  public
    constructor Create;reintroduce;
    destructor Destroy; override;
    property LocalDB: TUniConnection read GetLocalDB write FLocalDB;
  end;

var
  Share:TShare;

implementation



constructor TShare.Create;
begin
end;

destructor TShare.Destroy;
begin
  inherited;
  if FLocalDB.Connected then
    FLocalDB.Connected := False;

  FreeAndNil(FLocalDB);
end;

function TShare.GetLocalDB: TUniConnection;
Var
  _Config: iConfig;
  _DbLinkInformation:TDbLinkInformation;
begin
  if FLocalDB <> nil then
    Result := FLocalDB
  else begin
  _Config := TORACLEConfig.Create;
  _DbLinkInformation := _Config.ReadConfig;
  Try
  FLocalDB := TUniConnection.Create(self);
  with FLocalDB do begin
      ProviderName := _DbLinkInformation.ProviderName;
      Server := _DbLinkInformation.ServerName;
      UserName := _DbLinkInformation.UserName;
      Password := _DbLinkInformation.PassWord;
  end;
  Finally
      FreeAndNil(_DbLinkInformation);
      _Config := nil;
  end;
  Result := FLocalDB;
  end;
end;


end.

