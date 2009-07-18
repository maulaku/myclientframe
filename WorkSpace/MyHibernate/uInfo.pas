unit uInfo;

interface

uses
  classes, Uni;

type
  //表对象
  TTable = class(TPersistent)
  private
    FAName: string;
    FComment: string;
    FSpace: string;
  published
    property AName: string read FAName write FAName;
    property Comment: string read FComment write FComment;
    property Space: string read FSpace write FSpace;
  end;

  /// 列对象
  TColumn = class(TPersistent)
  private
    FColumnName: string;
    FColumnType: string;
    FComment: string;
    FDataType: string;
    FDateLength: Integer;
    FTableName: string;
  published
    property ColumnName: string read FColumnName write FColumnName;
    property ColumnType: string read FColumnType write FColumnType;
    property Comment: string read FComment write FComment;
    property DataType: string read FDataType write FDataType;
    property DateLength: Integer read FDateLength write FDateLength;
    property TableName: string read FTableName write FTableName;
  end;

  /// 数据操纵接口
  IDbOperate = interface(IInterface)
  ['{090AA5CC-70D3-4C36-A2E5-A8E3F603F91A}']
    function getQuery(_Sql: string): TUniQuery; stdcall;
  end;

  /// 对象管理接口
  iMgr = interface(IInterface)
  ['{293BDC6F-11B6-4C80-B853-F37301C1DE2E}']
    /// 取得对象列表
    function getObjectList: TStrings; stdcall;
  end;

  /// 数据操纵实现类
  TDbOperate = class(TInterfacedObject, IDbOperate)
    function getQuery(_Sql: string): TUniQuery; stdcall;
  private
    FConn: TUniConnection;
  public
    constructor Create;
    property Conn: TUniConnection read FConn write FConn;
  published
  end;

  TMgr = class(TInterfacedObject)
  private
    DbMgr: IDBOperate;
  public
    constructor Create;
    destructor Destroy; override;
  end;


  /// 表对象管理
  TTableMgr = class(TMgr, IMgr)
  public
    function getObjectList: TStrings; stdcall;
  end;

  /// 列对象管理
  TColumnMgr = class(TMgr, iMgr)
  public
    function getObjectList: TStrings; overload; stdcall;
    function getObjectList(_TableName: string): TStrings; overload;
  end;



implementation
uses MainForm,SysUtils;

constructor TDbOperate.Create;
begin
  inherited;
  // TODO -cMM: TDbOperate.Create default body inserted
end;

{ TDbOperate }

function TDbOperate.getQuery(_Sql: string): TUniQuery;
begin
  Result := TUniQuery.Create(nil);
  try
    with Result do begin
      Connection := frmMain.UCMain;
      Close;
      SQL.Text := _Sql;
      Open;
    end;
  except
    Result := nil;
  end;
end;

{ TColumnMgr }

function TColumnMgr.getObjectList: TStrings;
begin
  Result := nil;
end;

function TColumnMgr.getObjectList(_TableName: string): TStrings;
var
  o: TColumn;
  S: string;
begin
  S := 'select a.TAble_Name,a.Column_Name,a.Data_Type,a.Data_Length,b.comments' + #13#10 +
    '       from user_tab_columns a' + #13#10 +
    '            left join user_col_comments b on a.TABLE_NAME=b.table_name and a.column_name=b.column_Name' + #13#10 +
    '       where a.Table_Name = ' + QuotedStr(_TableName) + ' ';


  Result  := TStringList.Create;
  with DbMgr.getQuery(S) do begin
    try
      if not isempty then begin
        First;
        while not eof do begin
          o := TColumn.Create;
          o.TableName := FieldByName('Table_Name').AsString;
          o.ColumnName := FieldByName('Column_Name').AsString;
          o.ColumnType := FieldByName('Data_Type').AsString;
          o.FDateLength := FieldByName('Data_Length').AsInteger;
          o.Comment := FieldByName('comments').AsString;
          Result.AddObject(o.ColumnName+ '['+o.Comment+']',o);
          next;
        end;
      end;
    finally
      Free;
    end;
  end; 
end;

{ TTableMgr }

function TTableMgr.getObjectList: TStrings;
var
  o: TTable;
  S: string;
begin
  S := 'select a.table_Name,a.tablespace_name,b.Comments' + #13#10 +
    '       from user_all_tables a' + #13#10 +
    '            left join user_tab_comments b on a.table_name=b.table_Name';

  Result := TStringList.Create;
  with DbMgr.getQuery(S) do begin
    try
      if not isempty then begin
        First;
        while not eof do begin
          o := TTable.Create;
          o.AName := FieldByName('Table_Name').AsString;
          o.Space := FieldByName('TableSpace_Name').AsString;
          o.Comment := FieldByName('Comments').AsString;
          Result.AddObject(o.AName+ '['+o.Comment+']',o);
          next;
        end;
      end;
    finally
      Free;
    end;
  end;
end;

constructor TMgr.Create;
begin
  inherited;
  DbMgr := TDbOperate.Create;
end;

destructor TMgr.Destroy;
begin
  DbMgr := nil;
  inherited;
end;

end.

