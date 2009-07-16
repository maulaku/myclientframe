{********************************************************

�����

��Ȩ���� (C) 2009 ��˾��

��������:
ģ����: �Ի�����
����:�޻���
����ʱ��:
����ʱ��:
������ʷ:
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
  Result := MessageBox(0, PChar(AStr), '����', MB_ICONERROR + MB_OK);
end;

class function TDiag.ErrorBoxA(AStr: string): Integer;
begin
  Result := MessageBox(0, PChar(AStr), '����', MB_ICONERROR + MB_OKCANCEL);
end;

class function TDiag.InformationBox(AStr: string): Integer;
begin
  Result := MessageBox(0, PChar(AStr), '��Ϣ', MB_ICONINFORMATION + MB_OK);
end;

class function TDiag.InformationBoxA(AStr: string): Integer;
begin
  Result := MessageBox(0, PChar(AStr), '��Ϣ', MB_ICONINFORMATION + MB_OKCANCEL);
end;

class function TDiag.WarningBox(AStr: string): Integer;
begin
  Result := MessageBox(0, PChar(AStr), '����', MB_ICONWARNING + MB_OK);
end;

class function TDiag.WarningBoxA(AStr: string): Integer;
begin
  Result := MessageBox(0, PChar(AStr), '����', MB_ICONWARNING + MB_OKCANCEL);
end;

end.

