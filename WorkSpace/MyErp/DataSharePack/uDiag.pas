{********************************************************

软件名

版权所有 (C) 2009 公司名

工程名称:
模块名: 对话框类
作者:罗华春
创建时间:
更新时间:
更新历史:
*********************************************************}

unit uDiag;

interface
uses Dialogs, Windows, Controls;

type
  TDiag = class(TObject)
  public
    class function InformationBox(AStr: string): Integer; overload;
    class function InformationBoxA(AStr: string): Integer; overload;
    class function WarningBox(AStr: string): Integer; overload;
    class function WarningBoxA(AStr: string): Integer; overload;
    class function ErrorBox(AStr: string): Integer; overload;
    class function ErrorBoxA(AStr: string): Integer; overload;
  end;

implementation

uses
  Forms;

{ TDiag }

class function TDiag.ErrorBox(AStr: string): Integer;
begin
  Result := MessageBox(0, PChar(AStr), '错误', MB_ICONERROR + MB_OK);
end;

class function TDiag.ErrorBoxA(AStr: string): Integer;
begin
  Result := MessageBox(0, PChar(AStr), '错误', MB_ICONERROR + MB_OKCANCEL);
end;

class function TDiag.InformationBox(AStr: string): Integer;
begin
  Result := MessageBox(0, PChar(AStr), '信息', MB_ICONINFORMATION + MB_OK);
end;

class function TDiag.InformationBoxA(AStr: string): Integer;
begin
  Result := MessageBox(0, PChar(AStr), '信息', MB_ICONINFORMATION + MB_OKCANCEL);
end;

class function TDiag.WarningBox(AStr: string): Integer;
begin
  Result := MessageBox(0, PChar(AStr), '警告', MB_ICONWARNING + MB_OK);
end;

class function TDiag.WarningBoxA(AStr: string): Integer;
begin
  Result := MessageBox(0, PChar(AStr), '警告', MB_ICONWARNING + MB_OKCANCEL);
end;

end.

