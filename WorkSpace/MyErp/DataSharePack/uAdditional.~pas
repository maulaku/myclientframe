unit uAdditional;

interface
uses SysUtils, Windows;

const
  C1 = 52845;
  C2 = 22719;

type
  TAdditional = class(TObject)
  private
    //===============对字符串进行加密的部分函数 begin=========================//
    function Encode(const S: AnsiString): AnsiString;
    function Decode(const S: AnsiString): AnsiString;
    function PreProcess(const S: AnsiString): AnsiString;
    function InternalDecrypt(const S: AnsiString; Key: Word): AnsiString;
    function PostProcess(const S: AnsiString): AnsiString;
    function InternalEncrypt(const S: AnsiString; Key: Word): AnsiString;
    //===============对字符串进行加密的部分函数 end=========================//
  public
    function getHzPy(const AStr: string): string;
    function Decrypt(const AStr: AnsiString; Key: Word): AnsiString;
    function Encrypt(const AStr: AnsiString; Key: Word): AnsiString;
  end;

implementation

{
********************************* uAdditional **********************************
}

function TAdditional.Decode(const S: AnsiString): AnsiString;
const
  Map: array[Char] of Byte = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 0, 0, 0, 63, 52, 53,
    54, 55, 56, 57, 58, 59, 60, 61, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2,
    3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    20, 21, 22, 23, 24, 25, 0, 0, 0, 0, 0, 0, 26, 27, 28, 29, 30,
    31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45,
    46, 47, 48, 49, 50, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0);
var
  I: LongInt;
begin
  case Length(S) of
    2:
      begin
        I := Map[S[1]] + (Map[S[2]] shl 6);
        SetLength(Result, 1);
        Move(I, Result[1], Length(Result))
      end;
    3:
      begin
        I := Map[S[1]] + (Map[S[2]] shl 6) + (Map[S[3]] shl 12);
        SetLength(Result, 2);
        Move(I, Result[1], Length(Result))
      end;
    4:
      begin
        I := Map[S[1]] + (Map[S[2]] shl 6) + (Map[S[3]] shl 12) +
          (Map[S[4]] shl 18);
        SetLength(Result, 3);
        Move(I, Result[1], Length(Result))
      end
  end
end;

function TAdditional.Encode(const S: AnsiString): AnsiString;
const
  Map: array[0..63] of Char = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' +
  'abcdefghijklmnopqrstuvwxyz0123456789+/';
var
  I: LongInt;
begin
  I := 0;
  Move(S[1], I, Length(S));
  case Length(S) of
    1:
      Result := Map[I mod 64] + Map[(I shr 6) mod 64];
    2:
      Result := Map[I mod 64] + Map[(I shr 6) mod 64] +
        Map[(I shr 12) mod 64];
    3:
      Result := Map[I mod 64] + Map[(I shr 6) mod 64] +
        Map[(I shr 12) mod 64] + Map[(I shr 18) mod 64]
  end
end;

function TAdditional.Encrypt(const AStr: AnsiString; Key: Word): AnsiString;
{-------------------------------------------------------------------------------
  过程名:    TAdditional.Encrypt
  作者:      罗华春
  日期:      2009.06.16
  参数:      const AStr: AnsiString; Key: Word
  返回值:    AnsiString
  详细说明:  对字符串进行加密
-------------------------------------------------------------------------------}
begin
  Result := PostProcess(InternalEncrypt(AStr, Key))
end;


function TAdditional.Decrypt(const AStr: AnsiString; Key: Word): AnsiString;
{-------------------------------------------------------------------------------
  过程名:    TAdditional.Decrypt
  作者:      罗华春
  日期:      2009.06.16
  参数:      const AStr: AnsiString; Key: Word
  返回值:    AnsiString
  详细说明:  对字符串进行解密
-------------------------------------------------------------------------------}
begin
  Result := InternalDecrypt(PreProcess(AStr), Key)
end;

function TAdditional.getHzPy(const AStr: string): string;
{-------------------------------------------------------------------------------
  过程名:    TAdditional.getHzPy
  作者:      罗华春
  日期:      2009.06.16
  参数:      const AStr: string
  返回值:    string
  详细说明:  取得汉字的拼音串

-------------------------------------------------------------------------------}
const
  ChinaCode: array[0..25, 0..1] of Integer = ((1601, 1636), (1637, 1832), (1833, 2077),
    (2078, 2273), (2274, 2301), (2302, 2432), (2433, 2593), (2594, 2786), (9999, 0000),
    (2787, 3105), (3106, 3211), (3212, 3471), (3472, 3634), (3635, 3722), (3723, 3729),
    (3730, 3857), (3858, 4026), (4027, 4085), (4086, 4389), (4390, 4557), (9999, 0000),
    (9999, 0000), (4558, 4683), (4684, 4924), (4925, 5248), (5249, 5589));
var
  i, j, HzOrd: integer;
begin
  i := 1;
  Result := '';
  while i <= Length(AStr) do
  begin
    if (AStr[i] >= #160) and (AStr[i + 1] >= #160) then
    begin
      HzOrd := (Ord(AStr[i]) - 160) * 100 + Ord(AStr[i + 1]) - 160;
      for j := 0 to 25 do
      begin
        if (HzOrd >= ChinaCode[j][0]) and (HzOrd <= ChinaCode[j][1]) then
        begin
          Result := Result + char(byte('A') + j);
          break;
        end;
      end;
      Inc(i);
    end else Result := Result + AStr[i];
    Inc(i);
  end;
end;


function TAdditional.InternalDecrypt(const S: AnsiString;
  Key: Word): AnsiString;
var
  I: Word;
  Seed: Word;
begin
  Result := S;
  Seed := Key;
  for I := 1 to Length(Result) do
  begin
    Result[I] := Char(Byte(Result[I]) xor (Seed shr 8));
    Seed := (Byte(S[I]) + Seed) * Word(C1) + Word(C2)
  end
end;


function TAdditional.InternalEncrypt(const S: AnsiString;
  Key: Word): AnsiString;
var
  I: Word;
  Seed: Word;
begin
  Result := S;
  Seed := Key;
  for I := 1 to Length(Result) do
  begin
    Result[I] := Char(Byte(Result[I]) xor (Seed shr 8));
    Seed := (Byte(Result[I]) + Seed) * Word(C1) + Word(C2)
  end
end;

function TAdditional.PostProcess(const S: AnsiString): AnsiString;
var
  SS: AnsiString;
begin
  SS := S;
  Result := '';
  while SS <> '' do
  begin
    Result := Result + Encode(Copy(SS, 1, 3));
    Delete(SS, 1, 3)
  end
end;


function TAdditional.PreProcess(const S: AnsiString): AnsiString;
var
  SS: AnsiString;
begin
  SS := S;
  Result := '';
  while SS <> '' do
  begin
    Result := Result + Decode(Copy(SS, 1, 4));
    Delete(SS, 1, 4)
  end
end;


end.

