{=============================================================================

����������
��Ȩ���� (C) 2009 ����������

��������:  �������
����:      �޻���
����ʱ��:  2009-5-17 22:54:56
����˵��:  ���ú�������Ԫ
==============================================================================}


unit uConst;

interface
uses Windows, Dialogs;

const
  sOpenQueryError = '�����ݼ��쳣!';
  sExecSqlError = '�����ݼ��쳣!';

function ShowError(AText: string): Integer;
function ShowErrorA(AText: string): Integer;
function showInformation(AText: string): Integer;
function showInformationA(AText: string): Integer;
function showWarning(AText: string): Integer;
function showWarningA(AText: string): Integer;

implementation

function ShowError(AText: string): Integer;
begin
  Result := MessageDlg(PChar(AText), mtError, [MBOK], 0);
end;

function ShowErrorA(AText: string): Integer;
begin
  Result := MessageDlg(PChar(AText), mtError, [MBOK, mbCancel], 0);
end;

function showInformation(AText: string): Integer;
begin
  Result := MessageDlg(PChar(AText), mtInformation, [MBOK], 0);
end;

function showInformationA(AText: string): Integer;
begin
  Result := MessageDlg(PChar(AText), mtInformation, [MBOK, MBCancel], 0);
end;

function showWarning(AText: string): Integer;
begin
  Result := MessageDlg(PChar(AText), mtWarning, [MBOK], 0);
end;

function showWarningA(AText: string): Integer;
begin
  Result := MessageDlg(PChar(AText), mtWarning, [MBOK, MBCancel], 0);
end;
end.
