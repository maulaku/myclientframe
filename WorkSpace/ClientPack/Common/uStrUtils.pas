{*******************************************************
       XXX系统
       版权所有 (C) 2009 浙江动力信息技术有限公司

   详细说明:   字符串处理单元。
   作者:罗华春
   创建时间:2009-12-15
   更新时间:2009-12-15
   更新说明:
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
  过程名:    FormatText
  作者:      罗华春
  日期:      2009.12.15
  参数:      SubStr,Str:AnsiString
  返回值:    TStrings
  详细说明:  按指定的子串，将字符串分隔成几个部分。
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
  过程名:    StringSaveToFile
  作者:      罗华春
  日期:      2009.12.16
  参数:      S: string; FN: string
  返回值:    Boolean
  详细说明:  将字符串保存为文件
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
  过程名:    NewGuid
  作者:      罗华春
  日期:      2009.12.18
  参数:      无
  返回值:    string
  详细说明:  建立一个新的GUID字串。
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
  过程名:    StringToFile
  作者:      罗华春
  日期:      2009.12.22
  参数:      mString: string; mFileName: TFileName
  返回值:    Boolean
  详细说明:  将字符串保存到文件.
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
  过程名:    FileToString
  作者:      罗华春
  日期:      2009.12.22
  参数:      mFileName: TFileName
  返回值:    string
  详细说明:  将文件内容转换为字符串
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
  过程名:    StreamToString
  作者:      罗华春
  日期:      2009.12.22
  参数:      mStream: TStream
  返回值:    string
  详细说明:  将流转换为字符串
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
  过程名:    StringToStream
  作者:      罗华春
  日期:      2009.12.22
  参数:      mString: string; mStream: TStream
  返回值:    Boolean
  详细说明:  将字符串转换为流
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

{==========================流与变体类型互换====================================}
Function StreamToVariant(Stream: TStream): OleVariant;
{-------------------------------------------------------------------------------
  过程名:    StreamToVariant
  作者:      罗华春
  日期:      2009.12.22
  参数:      Stream: TStream
  返回值:    OleVariant
  详细说明:  将流转换为变体类型
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
  过程名:    VariantToStream
  作者:      罗华春
  日期:      2009.12.22
  参数:      const Data: OleVariant
  返回值:    TStream
  详细说明:  将变体类型转换为流。  
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
  过程名:    getRandomize
  作者:      罗华春
  日期:      2009.12.24
  参数:      无
  返回值:    Cardinal
  详细说明:  取得一个随机数。
-------------------------------------------------------------------------------}
begin
    Randomize;
    Result :=  Random(MaxLongint);
end;


end.

