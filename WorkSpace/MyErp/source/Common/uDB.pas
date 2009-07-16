{=============================================================================

����������
��Ȩ���� (C) 2009 ����������

��������:  �������
����:      �޻���
����ʱ��:  2009-5-17 23:08:18
����˵��:  ���ݹ���ģ��,ע��OracleUniProvider��Ԫ�ز�����.���ṩTuniconnection���������.
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
    ������:    TDbOperate.CreateDataSet
    ����:      �޻���
    ����:      2009.05.19
    ����:      _Sql: string
    ����ֵ:    TUniQuery
    ˵��:      �������ݼ�
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
    ������:    TDbOperate.ExecSql
    ����:      �޻���
    ����:      2009.05.19
    ����:      _Sql: string
    ����ֵ:    Boolean
    ˵��:      ִ��Sql���
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
    ������:    TDbOperate.getDataSet
    ����:      �޻���
    ����:      2009.05.19
    ����:      _Sql: string
    ����ֵ:    TUniQuery
    ˵��:      ȡ�����ݼ�
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
    ������:    TDbOperate.CreateConnection
    ����:      �޻���
    ����:      2009.05.19
    ����:      ��
    ����ֵ:    TuniConnection
    ˵��:      ������������������.
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
        ShowError('�������ݿ����,�����¼�����ò���!');
  {$ELSE}
        ShowError('�������ݿ����,�������Ա��ϵ!');
  {$ENDIF}
      end;
    end;
  end;
end;


end.

