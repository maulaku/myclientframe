{*******************************************************
       XXXϵͳ
       ��Ȩ���� (C) 2009 �㽭������Ϣ�������޹�˾

   ��ϸ˵��:   �ַ�������Ԫ��
   ����:�޻���
   ����ʱ��:2009-12-15
   ����ʱ��:2009-12-15
   ����˵��:
********************************************************}


unit uStrUtils;

interface
uses Classes,SysUtils,FileCtrl,Windows,ComObj,ActiveX;

{$H+}

function ExtractText(SubStr, Str: AnsiString): TStrings;
function StringSaveToFile(S: string; FileName: string): Boolean;

function NewGuid: string;

function FileToString(mFileName: String): string;
function StringToFile(mString: string; mFileName: String): Boolean;
function StreamToString(mStream: TStream): string;
function StringToStream(mString: string; mStream: TStream): Boolean;
Function StreamToVariant(Stream: TStream): OleVariant;
Function VariantToStream(const Data: OleVariant):TStream;

function getRandomize:Cardinal;

implementation

function ExtractText(SubStr, Str: AnsiString): TStrings;
{-------------------------------------------------------------------------------
  ������:    FormatText
  ����:      �޻���
  ����:      2009.12.15
  ����:      SubStr,Str:AnsiString
  ����ֵ:    TStrings
  ��ϸ˵��:  ��ָ�����Ӵ������ַ����ָ��ɼ������֡�
-------------------------------------------------------------------------------}
var
  CurrentPos: Integer;
  AStr, tempStr: AnsiString;

  function getPos(Str: string): Integer;
  begin
    REsult := Pos(SubStr, STR);
  end;

begin
  Result := TStringList.create;
  AStr := Str;
  AStr := Copy(AStr, 7 + 1, Length(AStr) - 7);
  CurrentPos := getPos(AStr);
  while CurrentPos <> 0 do begin
    tempStr := Copy(AStr, 0, CurrentPos - 1);
    Result.Add(SubStr + tempStr);
    AStr := Copy(AStr, CurrentPos + 7, Length(AStr) - CurrentPos - 7);
    CurrentPos := getPos(AStr);
  end;
  Result.Add(SubStr + AStr);
end;

function StringSaveToFile(S: string; FileName: string): Boolean;
{-------------------------------------------------------------------------------
  ������:    StringSaveToFile
  ����:      �޻���
  ����:      2009.12.16
  ����:      S: string; FN: string
  ����ֵ:    Boolean
  ��ϸ˵��:  ���ַ�������Ϊ�ļ�
-------------------------------------------------------------------------------}
var
  H: THandle;
  LH, LL: Cardinal;
begin
  Result := ForceDirectories(ExtractFilePath(FileName));
  if not Result then
    Exit;

  H := CreateFile(PChar(FileName), GENERIC_WRITE,
    FILE_SHARE_READ, nil,
    CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);

  if H = INVALID_HANDLE_VALUE then
    RaiseLastWin32Error
  else
  try
    LL := Length(S);
    if not WriteFile(H, PChar(S)^, LL, LH, nil) then
      RaiseLastWin32Error;
  finally
    CloseHandle(H);
  end;
end;

function NewGuid: string;
{-------------------------------------------------------------------------------
  ������:    NewGuid
  ����:      �޻���
  ����:      2009.12.18
  ����:      ��
  ����ֵ:    string
  ��ϸ˵��:  ����һ���µ�GUID�ִ���
-------------------------------------------------------------------------------}
var
  sGuid: string;
  tmpGuid: TGUID;

  function FormatStr(aGUID: string): string;
  var
    c: Char;
    i: Integer;
    tmps: string;
  begin
    Result := '';
    tmps := Copy(aGUID, 2, Length(aGUID) - 2);

    for i := 1 to Length(tmps) do begin
      c := tmps[i];

      if not (c in ['{', '}', '-']) then begin
        Result := Result + c;
      end;
    end;
  end;

begin
  sGuid := '';

  if CoCreateGUID(tmpGuid) = S_OK then
    sGuid := GUIDToString(tmpGuid);

  Result := FormatStr(sGUID);
end;      

function StringToFile(mString: string; mFileName: String): Boolean;
{-------------------------------------------------------------------------------
  ������:    StringToFile
  ����:      �޻���
  ����:      2009.12.22
  ����:      mString: string; mFileName: TFileName
  ����ֵ:    Boolean
  ��ϸ˵��:  ���ַ������浽�ļ�.
-------------------------------------------------------------------------------}
var
  vFileChar: file of Char;
  I: Integer;
begin
{$I-}
  AssignFile(vFileChar, mFileName);
  Rewrite(vFileChar);
  for I := 1 to Length(mString) do Write(vFileChar, mString[I]);
  CloseFile(vFileChar);
{$I+}
  Result := (IOResult = 0) and (mFileName <> '');
end;

function FileToString(mFileName: String): string;
{-------------------------------------------------------------------------------
  ������:    FileToString
  ����:      �޻���
  ����:      2009.12.22
  ����:      mFileName: TFileName
  ����ֵ:    string
  ��ϸ˵��:  ���ļ�����ת��Ϊ�ַ���
-------------------------------------------------------------------------------}
var
  vFileChar: file of Char;
  vChar: Char;
begin
  Result := '';
{$I-}
  AssignFile(vFileChar, mFileName);
  Reset(vFileChar);
  while not Eof(vFileChar) do begin
    Read(vFileChar, vChar);
    Result := Result + vChar;
  end;
  CloseFile(vFileChar);
{$I+}
end;

function StreamToString(mStream: TStream): string;
{-------------------------------------------------------------------------------
  ������:    StreamToString
  ����:      �޻���
  ����:      2009.12.22
  ����:      mStream: TStream
  ����ֵ:    string
  ��ϸ˵��:  ����ת��Ϊ�ַ���
-------------------------------------------------------------------------------}
var
  I: Integer;
begin
  Result := '';
  if not Assigned(mStream) then Exit;
  SetLength(Result, mStream.Size);
  for I := 0 to Pred(mStream.Size) do try
    mStream.Position := I;
    mStream.Read(Result[Succ(I)], 1);
  except
    Result := '';
  end;  
end; {   StreamToString   }


function StringToStream(mString: string; mStream: TStream): Boolean;
{-------------------------------------------------------------------------------
  ������:    StringToStream
  ����:      �޻���
  ����:      2009.12.22
  ����:      mString: string; mStream: TStream
  ����ֵ:    Boolean
  ��ϸ˵��:  ���ַ���ת��Ϊ��
-------------------------------------------------------------------------------}
Var
  I: Integer;
begin
  Result := True;
  try
    mStream.Size := 0;
    mStream.Position := 0;
    for I := 1 to Length(mString) do mStream.Write(mString[I], 1);
  except
    Result := False;
  end;
end; {   StringToStream   }

{   ========================DEMO===================
procedure TForm1.Button1Click(Sender: TObject);
var
  vMemoryStream: TMemoryStream;
begin
  Memo1.Text := FileToString('C:\WINDOWS\Desktop\1.txt');
  vMemoryStream := TMemoryStream.Create;
  try
    Memo1.Lines.SaveToStream(vMemoryStream);
    Memo2.Text := StreamToString(vMemoryStream);
  finally
    vMemoryStream.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  vMemoryStream: TMemoryStream;
begin
  StringToFile(Memo2.Text, 'C:\WINDOWS\Desktop\1.txt');
  vMemoryStream := TMemoryStream.Create;
  try
    StringToStream(Memo2.Text, vMemoryStream);
    vMemoryStream.Position := 0;
    Memo1.Lines.LoadFromStream(vMemoryStream);
  finally
    vMemoryStream.Free;
  end;
end;
  ///////End   Demo

{==========================����������ͻ���====================================}
Function StreamToVariant(Stream: TStream): OleVariant;
{-------------------------------------------------------------------------------
  ������:    StreamToVariant
  ����:      �޻���
  ����:      2009.12.22
  ����:      Stream: TStream
  ����ֵ:    OleVariant
  ��ϸ˵��:  ����ת��Ϊ��������
-------------------------------------------------------------------------------}
var
  p: Pointer;
begin
  Result := VarArrayCreate([0, Stream.Size - 1], varByte);
  p := VarArrayLock(Result);
  try
    Stream.Position := 0;
    Stream.Read(p^, Stream.Size);
  finally
    VarArrayUnlock(Result);
  end;
end;

Function VariantToStream(const Data: OleVariant):TStream;
{-------------------------------------------------------------------------------
  ������:    VariantToStream
  ����:      �޻���
  ����:      2009.12.22
  ����:      const Data: OleVariant
  ����ֵ:    TStream
  ��ϸ˵��:  ����������ת��Ϊ����  
-------------------------------------------------------------------------------}
var
  p: Pointer;
begin
  Result := TMemoryStream.Create;
  p := VarArrayLock(Data);
  try
    Result.Write(p^, VarArrayHighBound(Data,1) + 1);
  finally
    VarArrayUnlock(Data);
  end;
end;


function getRandomize:Cardinal;
{-------------------------------------------------------------------------------
  ������:    getRandomize
  ����:      �޻���
  ����:      2009.12.24
  ����:      ��
  ����ֵ:    Cardinal
  ��ϸ˵��:  ȡ��һ���������
-------------------------------------------------------------------------------}
begin
    Randomize;
    Result :=  Random(MaxLongint);
end;


end.

