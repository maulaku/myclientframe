{********************************************************

动力信息管理系统                                        
版权所有 (C) 2010 动力信息技术有限公司                  
软件功能: 环境变量单元

*********************************************************} 
unit uEnvironment;

interface
uses SysUtils,IniFiles;

type
  TEnvironment = class(TObject)
  private
    FLogOutLevel: Integer;
    FPath: WideString;
    FPort: Integer;

    FIni:TiniFile;
    function GetLogOutLevel: Integer;
    function GetPort: Integer;
    //1 初始化配置信息
    procedure InitConfigInformation;
  public
    constructor Create;
    destructor Destroy; override;
    //1 日志输出等级
    property LogOutLevel: Integer read GetLogOutLevel write FLogOutLevel;
    //1 应用程序路径
    property Path: WideString read FPath write FPath;
    //1 端口号
    property Port: Integer read GetPort write FPort;
  end;

Var
  Env:TEnvironment;
  
implementation

uses
  uConst;

constructor TEnvironment.Create;
begin
  inherited;
  {$WARN SYMBOL_PLATFORM OFF}
  FPath := IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)));
  {$WARN SYMBOL_PLATFORM ON}
  FIni := TIniFile.Create(FPath+ConfigName);

  InitConfigInformation;  
end;

destructor TEnvironment.Destroy;
begin
  FreeAndNil(FIni);
  inherited;
end;

function TEnvironment.GetLogOutLevel: Integer;
begin
  FLogOutLevel := FIni.ReadInteger('Log','OutLevel',0);
  Result := FLogOutLevel;
end;

function TEnvironment.GetPort: Integer;
begin
  FPort := FIni.ReadInteger('Server','Port',0);
  if FPort = 0 then
    FPort := 8527;
  Result := FPort;
end;

procedure TEnvironment.InitConfigInformation;
{-------------------------------------------------------------------------------
  过程名:    TEnvironment.InitConfigInformation
  作者:      罗华春
  日期:      2010.04.03
  参数:      无
  返回值:    无
  详细说明:  初始化配置信息.
-------------------------------------------------------------------------------}
begin
  if not Fini.SectionExists('Log') then
    FIni.WriteInteger('Log','OutLevel',0);
  if not Fini.SectionExists('Server') then
    FIni.WriteInteger('Server','port',8527);
end;

initialization
  Env := TEnvironment.Create;
finalization
  Env.Free;
end.
