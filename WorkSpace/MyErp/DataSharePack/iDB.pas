{********************************************************

软件名

版权所有 (C) 2009 公司名

工程名称:
模块名: 数据操纵层
作者:罗华春
创建时间:
更新时间:
更新历史:



*********************************************************}


unit iDB;

interface
uses DB, uni;

type
  IDbOperate = interface(IInterface)
    ['{383011CA-0F61-4692-9A7E-041F0F88C142}']
    function CreateQuery(_Sql: AnsiString): TUniQuery; stdcall;
    function ExecSql(_Sql: AnsiString): Boolean; stdcall;
    function OpenDB(_Sql: AnsiString): Boolean; stdcall;
  end;

implementation

end.

