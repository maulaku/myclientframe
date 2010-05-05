{*******************************************************}
{                                                       }
{       客户插件--对INI进行读写                         }
{                                                       }
{       版权所有 (C) 2009 动力工作室                    }
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
    //1 取得工程根目录
    property Root: String read GetRoot write SetRoot;
    property Source: String read GetSource;
  end;

implementation
uses SysUtils;

{
程序的目录结构为:

工程目录
        /Bin
        /Dcu
        /package
        /bpl
        /Source
               /Plugin
                      /插件工程1
                      /插件工程2

}

constructor TLHCINI.Create;
{-------------------------------------------------------------------------------
  过程名:    TLHCINI.Create
  作者:      luohuachun
  日期:      2009.04.20
  参数:      无
  返回值:    无
  详细说明:  构造函数,如果文件不存在， 则创建文件;
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
  过程名:    TLHCINI.GetBin
  作者:      luohuachun
  日期:      2009.04.20
  参数:      无
  返回值:    String
  详细说明:  取得工程的Bin目录,用于存放.exe文件的目录
-------------------------------------------------------------------------------}
begin
  // TODO -cMM: TLHCINI.GetBin default body inserted
  Result := GetRoot + '';
end;
     
function TLHCINI.Getbpl: String;
{-------------------------------------------------------------------------------
  过程名:    TLHCINI.Getbpl
  作者:      luohuachun
  日期:      2009.04.20
  参数:      无
  返回值:    String
  详细说明:  取得bpl的存放目录
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
  过程名:    TLHCINI.GetRoot
  作者:      luohuachun
  日期:      2009.04.20
  参数:      无
  返回值:    String
  详细说明:  取得工程根目录
-------------------------------------------------------------------------------}
begin
  Result := FRoot;
end;


{-------------------------------------------------------------------------------
  过程名:    TLHCINI.GetSource
  作者:      luohuachun
  日期:      2009.04.20
  参数:      无
  返回值:    String
  详细说明:  取得源代码的根目录;
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
