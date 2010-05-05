unit uMyProject;

interface
uses Registry, SysUtils, Windows, Classes;

const
  sIMPETUS = 'SOFTWARE\IMPETUS\';
  sPROJECTNAME = 'ProjectName';
  SPROJECTCNNAME= 'ProjectCNName';
  SDEVELOPERNAME= 'DeveloperName';
  SAUTHOR= 'Author';
  SVERSIONS= 'Versions';
  SRoot='Root';
  SdbType='DBTYPE';
  SAddress='ADDRESS';
  SAddresss='ADDRESSS';
  SPort='PORT';
  SProviderName='ProviderName';
  SDataBaseName='DataBaseName';
  SUserName='UserName';
  SPassWord='PassWord';

type
  TDataBaseKind = (dbkLocate, dbkRemote);

  TDataBaseInfo = class;
  TDirectoryInfo = class;
  TProjectInfo = class;

  IMyProject = interface(IInterface)
    ['{29523933-775D-40BD-ADA0-02C002401833}']
    function getDataBaseInfo: TDataBaseInfo; stdcall;
    function getDirectory: TDirectoryInfo; stdcall;
    function getMyProject: TProjectInfo; stdcall;
  end;

  TMyProject = class(TInterfacedObject, IMyProject)
  public
    function getDataBaseInfo: TDataBaseInfo; stdcall;
    function getDirectory: TDirectoryInfo; stdcall;
    function getMyProject: TProjectInfo; stdcall;
  end;

  TInfo = class(TObject)
  protected
  public
    constructor Create; virtual;
    destructor Destroy; override;
    function FormatPath(sPath: string): string;
    procedure Read; virtual; abstract;
    procedure Write; virtual; abstract;
  end;

  TDataBaseInfo = class(TInfo)
  private
    FAddress: string;
    FAddresss: TStrings;
    FDataBaseKind: TDataBaseKind;
    FDataBaseName: string;
    FPassWord: string;
    FPort: Integer;
    FProviderName: string;
    FUserName: string;
  protected
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Read; override;
    procedure Write; override;
    property Address: string read FAddress write FAddress;
    property DataBaseKind: TDataBaseKind read FDataBaseKind write FDataBaseKind
      default dbkRemote;
    property DataBaseName: string read FDataBaseName write FDataBaseName;
    property PassWord: string read FPassWord write FPassWord;
    property Port: Integer read FPort write FPort;
    property ProviderName: string read FProviderName write FProviderName;
    property UserName: string read FUserName write FUserName;
  published
    property Addresss: TStrings read FAddresss write FAddresss;
  end;

  TDirectoryInfo = class(TInfo)
  private
    FRoot: string;
    function GetBin: string;
    function GetbinPlugin: string;
    function Getbpl: string;
    function Getdcp: string;
    function Getdcu: string;
    function GetDocument: string;
    function Geticon: string;
    function GetImages: string;
    function GetReport: string;
    function GetSource: string;
    function GetSourcePlugin: string;
  public
    procedure CreateDirectory;
    procedure Read; override;
    procedure Write; override;
    property Bin: string read GetBin;
    property binPlugin: string read GetbinPlugin;
    property bpl: string read Getbpl;
    property dcp: string read Getdcp;
    property dcu: string read Getdcu;
    property Document: string read GetDocument;
    property icon: string read Geticon;
    property Images: string read GetImages;
    property Report: string read GetReport;
    property Root: string read FRoot write FRoot;
    property Source: string read GetSource;
    property SourcePlugin: string read GetSourcePlugin;
  end;

  TProjectInfo = class(TInfo)
  private
    FAuthor: string;
    FcnName: string;
    FDataBaseInfo: TDataBaseInfo;
    FDeveloperName: string;
    FDirectoryInfo: TDirectoryInfo;
    FexeName: string;
    FVersion: string;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Read; override;
    procedure Write; override;
    property Author: string read FAuthor write FAuthor;
    property cnName: string read FcnName write FcnName;
    property DataBaseInfo: TDataBaseInfo read FDataBaseInfo write FDataBaseInfo;
    property DeveloperName: string read FDeveloperName write FDeveloperName;
    property DirectoryInfo: TDirectoryInfo read FDirectoryInfo write
      FDirectoryInfo;
    property exeName: string read FexeName write FexeName;
    property Version: string read FVersion write FVersion;
  end;



implementation

uses
  uEnvironment,dialogs;

constructor TDataBaseInfo.Create;
begin
  inherited Create;
  FAddresss := TStringList.Create;
end;

destructor TDataBaseInfo.Destroy;
begin
  FreeAndNil(FAddresss);
  inherited;
end;

{
******************************** TDataBaseInfo *********************************
}

procedure TDataBaseInfo.Read;
begin
  FProviderName := Env.IniMgr.ReadString(SIMPETUS, SProviderName, '');

  FAddress := Env.IniMgr.ReadString(SIMPETUS, SAddress, '');
  FAddresss.CommaText := Env.IniMgr.ReadString(SIMPETUS, SAddresss, '');
  FPort := Env.IniMgr.ReadInteger(SIMPETUS, SPort, -1);

  FDataBaseName := Env.IniMgr.ReadString(SIMPETUS, SDataBaseName, '');
  FUserName := Env.IniMgr.ReadString(SIMPETUS, SUserName, '');
  FPassWord := Env.IniMgr.ReadString(SIMPETUS, SPassWord, '');

  if Env.IniMgr.ReadString(SIMPETUS, SdbType, '') = 'dbkLocate' then
    FDataBaseKind := dbkLocate
  else FDataBaseKind := dbkRemote;
end;

procedure TDataBaseInfo.Write;
var
  sDataBaseKind: string;
begin
  if FDataBaseKind = dbkLocate then
    sDataBaseKind := 'dbkLocate'
  else sDataBaseKind := 'dbkRemote';
  
  Env.IniMgr.WriteString(SIMPETUS, SdbType, sDataBaseKind);
  Env.IniMgr.WriteString(SIMPETUS, SAddress, FAddress);
  Env.IniMgr.WriteString(SIMPETUS, SAddresss, FAddresss.CommaText);
  Env.IniMgr.WriteInteger(SIMPETUS, SPort, FPort);

  Env.IniMgr.WriteString(SIMPETUS, SProviderName, ProviderName);
  Env.IniMgr.WriteString(SIMPETUS, SDataBaseName, FDataBaseName);
  Env.IniMgr.WriteString(SIMPETUS, SUserName, FUserName);
  Env.IniMgr.WriteString(SIMPETUS, SPassWord, FPassWord);
end;

{
******************************** TDirectoryInfo ********************************
}



procedure TDirectoryInfo.CreateDirectory;
{-------------------------------------------------------------------------------
  过程名:    TDirectoryInfo.CreateDirectory
  作者:      hua
  日期:      2009.09.18
  参数:      无
  返回值:    无
  详细说明:  创建目录结构

-------------------------------------------------------------------------------}
begin
  if Length(Trim(Root)) = 0 then exit;

  ForceDirectories(bin);
  ForceDirectories(Document);
  ForceDirectories(Dcu);
  ForceDirectories(Report);
  ForceDirectories(BinPlugin);
  ForceDirectories(SourcePlugin);
  ForceDirectories(images);
  ForceDirectories(bpl);
  ForceDirectories(dcp);
end;

function TDirectoryInfo.GetBin: string;
begin
  Result := FormatPath(Root + 'Bin');
end;

function TDirectoryInfo.GetbinPlugin: string;
begin
  Result := FormatPath(FormatPath(Bin) + 'Plugin');
end;

function TDirectoryInfo.Getbpl: string;
begin
  Result := FormatPath(FormatPath(Bin) + 'bpl');
end;

function TDirectoryInfo.Getdcp: string;
begin
  Result := FormatPath(FormatPath(Bin) + 'Dcp');
end;

function TDirectoryInfo.Getdcu: string;
begin
  Result := FormatPath(FormatPath(Root) + 'Dcu');
end;

function TDirectoryInfo.GetDocument: string;
begin
  Result := FormatPath(FormatPath(Root) + 'Document');
end;

function TDirectoryInfo.Geticon: string;
begin
  Result := FormatPath(FormatPath(Root) + 'ICON');
end;

function TDirectoryInfo.GetImages: string;
begin
  Result := FormatPath(FormatPath(Root) + 'Images');
end;

function TDirectoryInfo.GetReport: string;
begin
  Result := FormatPath(FormatPath(Root) + 'Report');
end;

function TDirectoryInfo.GetSource: string;
begin
  Result := FormatPath(FormatPath(Root) + 'Source');
//  Showmessage('Source:' +  Result);
end;

function TDirectoryInfo.GetSourcePlugin: string;
begin
  Result := FormatPath(FormatPath(Source) + 'Plugin');
//  Showmessage('SourcePlugin:' +  Result);
end;



procedure TDirectoryInfo.Read;
{-------------------------------------------------------------------------------
  过程名:    TDirectoryInfo.Read
  作者:      hua
  日期:      2009.09.18
  参数:      无
  返回值:    无
  详细说明:  读取目录信息

-------------------------------------------------------------------------------}
begin
  FRoot := Env.IniMgr.ReadString(SIMPETUS, SRoot, '');
  if Length(TRim(FRoot)) = 0 then
    FRoot := ''
  else FRoot := FormatPath(FRoot);
end;

procedure TDirectoryInfo.Write;
{-------------------------------------------------------------------------------
  过程名:    TDirectoryInfo.Write
  作者:      hua
  日期:      2009.09.18
  参数:      无
  返回值:    无
  详细说明:  写入目录信息

-------------------------------------------------------------------------------}
begin
  FRoot := FormatPath(FRoot);
  Env.IniMgr.WriteString(SIMPETUS, SRoot, FRoot);
end;

{
************************************ TInfo *************************************
}

constructor TInfo.Create;
begin
  inherited Create;
end;

destructor TInfo.Destroy;
begin
  inherited Destroy;
end;

function TInfo.FormatPath(sPath: string): string;
begin
  {$WARN SYMBOL_PLATFORM OFF}
  Result := IncludeTrailingBackslash(sPath);
  {$WARN SYMBOL_PLATFORM ON}
end;

{
********************************** TMyProject **********************************
}

function TMyProject.getDataBaseInfo: TDataBaseInfo;
begin
  Result := TDataBaseInfo.Create;
  Result.Read;
end;

function TMyProject.getDirectory: TDirectoryInfo;
begin
  Result := TDirectoryInfo.Create;
  Result.Read;
end;

function TMyProject.getMyProject: TProjectInfo;
begin
  Result := TProjectInfo.Create;
  Result.Read;
end;

{
********************************* TProjectInfo *********************************
}

constructor TProjectInfo.Create;
begin
  inherited Create;
  FDataBaseInfo := TDataBaseInfo.Create();
  FDataBaseInfo.Read;
  FDirectoryInfo := TDirectoryInfo.Create();
  FDirectoryInfo.Read;
end;

destructor TProjectInfo.Destroy;
begin
  FreeAndNil(FDirectoryInfo);
  FreeAndNil(FDataBaseInfo);
  inherited Destroy;
end;

procedure TProjectInfo.Read;
begin
  FexeName := Env.IniMgr.ReadString(sIMPETUS, SPROJECTNAME, '');
  FCNName := Env.IniMgr.ReadString(sIMPETUS, SProjectCNName, '');
  FDeveloperName := Env.IniMgr.ReadString(sIMPETUS, SDeveloperName, '');
  FAuthor := Env.IniMgr.ReadString(sIMPETUS, SAuthor, '');
  FVersion := Env.IniMgr.ReadString(sIMPETUS, SVersions, '');
end;

procedure TProjectInfo.Write;
begin
  Env.IniMgr.WriteString(sIMPETUS, SVersions, FVersion);
  Env.IniMgr.WriteString(sIMPETUS, SProjectName, FexeName);
  Env.IniMgr.WriteString(sIMPETUS, SProjectCNName, FCNName);
  Env.IniMgr.WriteString(sIMPETUS, SDeveloperName, FDeveloperName);
  Env.IniMgr.WriteString(sIMPETUS, SAuthor, FAuthor);
end;


end.

