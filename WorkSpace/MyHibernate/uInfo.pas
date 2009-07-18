unit uInfo;

interface

uses
  classes, Uni, IniFiles, Forms;

type
  ///基对象
  TBase = class(TPersistent)
  private
    FAName: string;
    FComment: string;
  public
    property AName: string read FAName write FAName;
    property Comment: string read FComment write FComment;
  end;

  //表对象
  TTable = class(TBase)
  private
    FSpace: string;
  published
    property Space: string read FSpace write FSpace;
  end;

  /// 列对象
  TColumn = class(TBase)
  private
    FColumnType: string;
    FColumnID: Integer;
    FDateLength: Integer;
    FTableName: string;
  public
    property ColumnID: Integer read FColumnID write FColumnID;
  published
    property ColumnType: string read FColumnType write FColumnType;
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
    /// 将表或列转换为相应的对象
    function getObject(_Name: string): TBase; stdcall;
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
  private
    FList: TStrings;
  public
    constructor Create;
    destructor Destroy; override;
    function getObjectList: TStrings; stdcall;
    function getObject(_Name: string): TBase; stdcall;
    procedure init;
  end;

  /// 列对象管理
  TColumnMgr = class(TMgr, iMgr)
  public
    function getObjectList: TStrings; overload; stdcall;
    function getObjectList(_TableName: string): TStrings; overload;
    function getObject(_Name: string): TBase; stdcall;
  end;

  /// 类对象
  TMyClass = class(TPersistent)
  end;

  /// 类对象管理器
  TMyClassMgr = class(TPersistent)
  private
    FSavePath: string;
    function Analysis(ATable: TTable; Columns: TStrings): TStrings;
    //将Oracle的数据类型转换为Delphi识别的数据类型
    function convertDateType(ADateType: string): string;
  public
    procedure Convert(_TableName: string); overload;
    procedure Convert(_List: TStrings); overload;
    property SavePath: string read FSavePath write FSavePath;
  end;

  TConfig = class(TPersistent)
  private
    FPassWord: string;
    FSavePath: string;
    FServer: string;
    FUserName: string;
    ini: TiniFile;
  public
    constructor Create;
    destructor Destroy; override;
    function getPath: string;
    procedure Load;
    procedure save;
    property PassWord: string read FPassWord write FPassWord;
    property SavePath: string read FSavePath write FSavePath;
    property Server: string read FServer write FServer;
    property UserName: string read FUserName write FUserName;
  end;

implementation
uses MainForm, SysUtils, uconst;

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

function TColumnMgr.getObject(_Name: string): TBase;
begin

end;

function TColumnMgr.getObjectList(_TableName: string): TStrings;
var
  o: TColumn;
  S: string;
begin
  S := 'select a.TAble_Name,a.column_id, a.Column_Name,a.Data_Type,a.Data_Length,b.comments' + #13#10 +
    '       from user_tab_columns a' + #13#10 +
    '            left join user_col_comments b on a.TABLE_NAME=b.table_name and a.column_name=b.column_Name' + #13#10 +
    '       where a.Table_Name = ' + QuotedStr(_TableName) + ' ';


  Result := TStringList.Create;
  with DbMgr.getQuery(S) do begin
    try
      if not isempty then begin
        First;
        while not eof do begin
          o := TColumn.Create;
          o.TableName := FieldByName('Table_Name').AsString;
          o.AName := FieldByName('Column_Name').AsString;
          o.ColumnType := FieldByName('Data_Type').AsString;
          o.FDateLength := FieldByName('Data_Length').AsInteger;
          o.Comment := FieldByName('comments').AsString;
          o.ColumnID := FieldByName('Column_ID').AsInteger;
          Result.AddObject(o.AName, o);
          next;
        end;
      end;
    finally
      Free;
    end;
  end;
end;

constructor TTableMgr.Create;
begin
  inherited Create;
  FList := TStringList.Create;
  init;
end;

destructor TTableMgr.Destroy;
begin
  FreeAndNil(FList);
  inherited Destroy;
end;

{ TTableMgr }

function TTableMgr.getObject(_Name: string): TBase;
begin
  Result := TBase(FList.Objects[FList.IndexOf(_Name)]);
end;

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
          Result.AddObject(o.AName, o);
          next;
        end;
      end;
    finally
      Free;
    end;
  end;
end;

procedure TTableMgr.init;
begin
  FList := getObjectList;
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

function TMyClassMgr.Analysis(ATable: TTable; Columns: TStrings): TStrings;
var
  Column: TColumn;
  i: Integer;
begin
  Result := TStringList.Create;

  with Result do begin
    //加入单元名称
    Add(' unit u' + ATable.AName + ';' + #10#13);
    //接口部分
    Add(interfaceFlag);
    Add(usesFlag);

    //接口内容部分
    Add(#32#32 + interfacecontextFlag + #10#13);

    //type
    Add(typeflag);

    //类注释部分
    if Length(ATable.Comment) > 0 then
      Add(#32#32 + Format('///%s', [ATable.Comment]));
    //类定义部分
    Add(#32#32 + Format(ClassDefineFlag, [ATable.AName]));

    //private
    Add(#32#32 + privateFlag);
    for i := 0 to Columns.count - 1 do begin
      Column := TColumn(Columns.Objects[i]);
      Add(#32#32#32#32 + Format(PrivateVarFlag, [column.AName
        , convertDateType(Column.ColumnType)
          ]));
    end;
    //protected
    Add(#32#32 + protectedFlag);

    //public
    Add(#32#32 + publicFlag);
    for i := 0 to Columns.count - 1 do begin
      Column := TColumn(Columns.Objects[i]);
          //属性注释部分
      if Length(Column.Comment) > 0 then
        Add(#32#32#32#32 + Format('///%s', [Column.Comment]));
      Add(#32#32#32#32 + Format(propertyFlag, [column.AName
        , convertDateType(Column.ColumnType)
          , column.AName
          , column.AName
          ]));
    end;
    //publicish
    Add(#32#32 + publishedFlag);

    //结尾标志
    Add(#32#32 + endflag1);
    //添加实现标志
    Add(implementationFlag);
    //结尾标志
    Add(endflag);
  end;
end;

procedure TMyClassMgr.Convert(_TableName: string);
var
  _Table: TTable;
  _TableMgr: TTableMgr;
  _Column: TColumn;
  _ColumnMgr: TColumnMgr;
  List: TStrings;
  //类的内容
  _ClassContext: TStrings;
begin
  //取得表信息
  _TableMgr := TTableMgr.Create;
  _Table := TTable(_TableMgr.getObject(_TableName));
  try
    //取得表的所有列
    _ColumnMgr := TColumnMgr.Create;
    List := _ColumnMgr.getObjectList(_TableName);
    _ClassContext := Analysis(_Table, List);
    _ClassContext.SaveToFile(Format('%su%s.pas', [SavePath, _TableName]));
  finally
    FreeAndNil(_ClassContext);
    FreeAndNil(List);
    FreeAndNil(_ColumnMgr);
    FreeAndNil(_Table);
    FreeAndNil(_TableMgr);
  end;
end;

procedure TMyClassMgr.Convert(_List: TStrings);
var
  i: Integer;
begin
  for i := 0 to _List.Count - 1 do begin
    Convert(_List.strings[i]);
  end;
end;

function TMyClassMgr.convertDateType(ADateType: string): string;
begin
  if Pos(LowerCase(ADateType), LowerCase('NUMBER,CHAR,DATE,VARCHAR2,BLOB')) > 0 then begin
    result := 'String';
  end else if Pos(LowerCase(ADateType), LowerCase('DATE')) > 0 then begin
    result := 'datetime';
  end else if Pos(LowerCase(ADateType), LowerCase('blob,CLOB')) > 0 then begin
    result := 'Variants';
  end else if Pos(LowerCase(ADateType), LowerCase('number,smallint,LONG')) > 0 then begin
    result := 'Integer';
  end
end;

constructor TConfig.Create;
begin
  inherited;
  ini := TIniFile.Create(getPath + 'config.ini');
end;

destructor TConfig.Destroy;
begin
  FreeAndNil(Ini);
  inherited;
end;

function TConfig.getPath: string;
begin
  Result := ExtractFilePath(Application.ExeName);
  if Result[Length(Result)] <> '\' then
    Result := result + '\';
end;

procedure TConfig.Load;
begin
  FServer := ini.ReadString('config', 'server', '');
  FUserName := ini.ReadString('config', 'username', '');
  FPassWord := ini.ReadString('config', 'password', '');
  FSavePath := ini.ReadString('config', 'savepath', '');
end;

procedure TConfig.save;
begin
  ini.WriteString(' config', 'server', FServer);
  ini.WriteString('config', 'username', FUserName);
  ini.WriteString('config', 'password', FPassWord);
  ini.WriteString('config', 'savepath', FSavePath);
end;

end.

