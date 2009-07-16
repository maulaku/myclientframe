{=============================================================================

动力软件插件
版权所有 (C) 2009 动力工作室

工程名称:  插件工程
作者:      罗华春
更新时间:  2009-5-17 23:08:18
功能说明:  数据工厂模块,注意OracleUniProvider单元必不可少.它提供Tuniconnection组件的驱动.
==============================================================================}

{$I erp.inc}

unit uDB;

interface
uses Uni, Windows, Classes, uConfig, SysUtils, OracleUniProvider;

type
  iDbOperate = interface(IInterface)
    ['{DC83003C-E60A-4569-B4C7-47687AC6E3E8}']
    function CreateDataSet(_Sql: string): TUniQuery; stdcall;
    function ExecSql(_Sql: string): Boolean; stdcall;
    function getDataSet(_Sql: string): TUniQuery; stdcall;
    function GetLocalDB: TUniConnection; stdcall;
    property LocalDB: TUniConnection read GetLocalDB;
  end;

  TDbOperate = class(TInterFacedObject, iDbOperate)
  private
    FConfig: TConfig;
    FConnection: TUniConnection;
  public
    constructor Create;
    destructor Destroy; override;
    function CreateDataSet(_Sql: string): TUniQuery; stdcall;
    function ExecSql(_Sql: string): Boolean; stdcall;
    function getDataSet(_Sql: string): TUniQuery; stdcall;
    function GetLocalDB: TUniConnection; stdcall;
    property LocalDB: TUniConnection read GetLocalDB;
  end;

implementation
uses uConst;

{
********************************** TDbOperate **********************************
}
constructor TDbOperate.Create;
begin
  inherited Create;
  FConfig := TConfig.Create();
end;

destructor TDbOperate.Destroy;
begin
  if Assigned(FConnection) then FreeAndNil(FConnection);
  FreeAndNil(FConfig);
  inherited Destroy;
end;

function TDbOperate.CreateDataSet(_Sql: string): TUniQuery;
var
  Query: TuniQuery;

  {-------------------------------------------------------------------------------
    过程名:    TDbOperate.CreateDataSet
    作者:      罗华春
    日期:      2009.05.19
    参数:      _Sql: string
    返回值:    TUniQuery
    说明:      创建数据集
  -------------------------------------------------------------------------------}

begin
  Query := TuniQuery.Create(nil);
  with Query do
  begin
    Close;
    Connection := FConnection;
    Sql.Text := _sql;
  end;
end;

function TDbOperate.ExecSql(_Sql: string): Boolean;
var
  Query: TUniQuery;

  {-------------------------------------------------------------------------------
    过程名:    TDbOperate.ExecSql
    作者:      罗华春
    日期:      2009.05.19
    参数:      _Sql: string
    返回值:    Boolean
    说明:      执行Sql语句
  -------------------------------------------------------------------------------}

begin
  Query := getDataSet(_Sql);
  with Query do
  begin
    Close;
    sql.text := _Sql;
    try
      Execute;
    except
      ShowError(sExecSqlError);
    end;
  end;
end;


function TDbOperate.getDataSet(_Sql: string): TUniQuery;
var
  Query: TUniQuery;

  {-------------------------------------------------------------------------------
    过程名:    TDbOperate.getDataSet
    作者:      罗华春
    日期:      2009.05.19
    参数:      _Sql: string
    返回值:    TUniQuery
    说明:      取得数据集
  -------------------------------------------------------------------------------}

begin
  Query := CreateDataSet(_Sql);
  try
    if not Query.Active then Query.open;
  except
    ShowError(sOpenQueryError);
  end;
  Result := Query;
end;

function TDbOperate.GetLocalDB: TUniConnection;
begin
  {-------------------------------------------------------------------------------
    过程名:    TDbOperate.CreateConnection
    作者:      罗华春
    日期:      2009.05.19
    参数:      无
    返回值:    TuniConnection
    说明:      创建数据连接组件组件.
  -------------------------------------------------------------------------------}
  begin
    if FConnection <> nil then Result := FConnection;

    FConnection := TUniConnection.Create(nil);
    with FConnection do
    begin
      FConnection.ProviderName := FConfig.ProviderName;
      FConnection.Server := FConfig.DriverName;
      FConnection.Username := FConfig.UserName;
      FConnection.Password := FConfig.PassWord;

      try
        FConnection.Connected := True;
        Result := FConnection;
      except
        FreeAndNil(FConnection);
  {$IFDEF DEBUG}
        ShowError('连接数据库错误,请重新检查配置参数!');
  {$ELSE}
        ShowError('连接数据库错误,请与管理员联系!');
  {$ENDIF}
      end;
    end;
  end;
end;


end.

