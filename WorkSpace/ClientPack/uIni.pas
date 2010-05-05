{*******************************************************}
{                                                       }
{       �ͻ����--��INI���ж�д                         }
{                                                       }
{       ��Ȩ���� (C) 2009 ����������                    }
{                                                       }
{*******************************************************}


unit uIni;

interface

uses
  IniFiles,uConst;

type
  TLHCINI = class(TIniFile)
  private
    FRoot:String;
    function GetBin: String;
    function Getbpl: String;
    function GetDCU: string;
    function GetPlugin: String;

    function GetRoot: String;
    function GetSource: String;
    procedure SetRoot(const Value: String);
  public
    constructor Create;
    property Bin: String read GetBin;
    property bpl: String read Getbpl;
    property DCU: string read GetDCU;
    property Plugin: String read GetPlugin;
    //1 ȡ�ù��̸�Ŀ¼
    property Root: String read GetRoot write SetRoot;
    property Source: String read GetSource;
  end;

implementation
uses SysUtils;

{
�����Ŀ¼�ṹΪ:

����Ŀ¼
        /Bin
        /Dcu
        /package
        /bpl
        /Source
               /Plugin
                      /�������1
                      /�������2

}

constructor TLHCINI.Create;
{-------------------------------------------------------------------------------
  ������:    TLHCINI.Create
  ����:      luohuachun
  ����:      2009.04.20
  ����:      ��
  ����ֵ:    ��
  ��ϸ˵��:  ���캯��,����ļ������ڣ� �򴴽��ļ�;
-------------------------------------------------------------------------------}
Var
  FilePathName:String;
begin
  if Not FileExists(FilePathName) then
  begin
     FileCreate(FilePathName);
  end;
end;

function TLHCINI.GetBin: String;
{-------------------------------------------------------------------------------
  ������:    TLHCINI.GetBin
  ����:      luohuachun
  ����:      2009.04.20
  ����:      ��
  ����ֵ:    String
  ��ϸ˵��:  ȡ�ù��̵�BinĿ¼,���ڴ��.exe�ļ���Ŀ¼
-------------------------------------------------------------------------------}
begin
  // TODO -cMM: TLHCINI.GetBin default body inserted
  Result := GetRoot + '';
end;
     
function TLHCINI.Getbpl: String;
{-------------------------------------------------------------------------------
  ������:    TLHCINI.Getbpl
  ����:      luohuachun
  ����:      2009.04.20
  ����:      ��
  ����ֵ:    String
  ��ϸ˵��:  ȡ��bpl�Ĵ��Ŀ¼
-------------------------------------------------------------------------------}
begin
  // TODO -cMM: TLHCINI.Getbpl default body inserted
  Result := Root + 'BPL' ;
end;

function TLHCINI.GetDCU: string;
begin
  // TODO -cMM: TLHCINI.GetDCU default body inserted
  Result := GetRoot + 'Dcu' ;
end;

function TLHCINI.GetPlugin: String;
begin
  // TODO -cMM: TLHCINI.GetPlugin default body inserted
  Result := Source + 'Plugin';
end;

function TLHCINI.GetRoot: String;
{-------------------------------------------------------------------------------
  ������:    TLHCINI.GetRoot
  ����:      luohuachun
  ����:      2009.04.20
  ����:      ��
  ����ֵ:    String
  ��ϸ˵��:  ȡ�ù��̸�Ŀ¼
-------------------------------------------------------------------------------}
begin
  Result := FRoot;
end;


{-------------------------------------------------------------------------------
  ������:    TLHCINI.GetSource
  ����:      luohuachun
  ����:      2009.04.20
  ����:      ��
  ����ֵ:    String
  ��ϸ˵��:  ȡ��Դ����ĸ�Ŀ¼;
-------------------------------------------------------------------------------}
function TLHCINI.GetSource: String;
begin
  Result := Root + 'Source';
end;

procedure TLHCINI.SetRoot(const Value: String);
begin
  FRoot := Value;
end;

end.
