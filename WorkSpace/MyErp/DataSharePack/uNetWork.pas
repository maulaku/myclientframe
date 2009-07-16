{********************************************************

软件名

版权所有 (C) 2009 公司名

工程名称:
模块名:
作者:罗华春
创建时间:
更新时间:
更新历史:



*********************************************************}


unit uNetWork;

interface
uses WinSock, Windows, SysUtils;

type
  TNetWork = class(TObject)
  public
    function getLocalIpAddress: string;
    function getMacAddress: string;
    function getNetHostName: string;
    function SetHostName(AHostName: string): Boolean;
    Function getLoginUser:String;
  end;

implementation

{
*********************************** TNetWork ***********************************
}

function TNetWork.getNetHostName: string;
{-------------------------------------------------------------------------------
  过程名:    TNetWork.getNetHostName
  作者:      罗华春
  日期:      2009.06.16
  参数:      无
  返回值:    string
  详细说明:  取得本机名称

-------------------------------------------------------------------------------}
var
  WSAData: TWSAData;
  AHostName: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
begin
  try
    if 0 = WSAStartup(MAKEWORD(1, 1), WSAData) then
    try
      GetHostName(AHostName, MAX_COMPUTERNAME_LENGTH + 1);
    finally
      WSACleanup;
    end;
    Result := trim(AHostName);
  except
    Result := '';
  end;
end;

function TNetWork.getLocalIpAddress: string;
{-------------------------------------------------------------------------------
  过程名:    TNetWork.getLocalIpAddress
  作者:      罗华春
  日期:      2009.06.16
  参数:      无
  返回值:    string
  详细说明:  取得本机局域网名称
-------------------------------------------------------------------------------}
var
  HostEnt: PHostEnt;
  Ip: string;
  addr: pchar;
  Buffer: array[0..63] of char;
  GInitData: TWSADATA;
begin
  Result := '';
  try
    WSAStartup(2, GInitData);
    GetHostName(Buffer, SizeOf(Buffer));
    HostEnt := GetHostByName(buffer);
    if HostEnt = nil then Exit;
    addr := HostEnt^.h_addr_list^;
    ip := Format('%d.%d.%d.%d', [byte(addr[0]),
      byte(addr[1]), byte(addr[2]), byte(addr[3])]);
    Result := Ip;
  finally
    WSACleanup;
  end;
end;

function TNetWork.getMacAddress: string;
{-------------------------------------------------------------------------------
  过程名:    TNetWork.getMacAddress
  作者:      罗华春
  日期:      2009.06.16
  参数:      无
  返回值:    string
  详细说明:  取得本机的MAC地址
-------------------------------------------------------------------------------}
begin

end;

function TNetWork.SetHostName(AHostName: string): Boolean;
{-------------------------------------------------------------------------------
  过程名:    TNetWork.SetHostName
  作者:      罗华春
  日期:      2009.06.16
  参数:      AHostName: String
  返回值:    Boolean
  详细说明:  设置本机的名称
-------------------------------------------------------------------------------}
var
  ComputerName: pchar;
  Size: Cardinal;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  GetMem(ComputerName, Size);
  StrPCopy(ComputerName, AHostName);

  if SetComputerName(ComputerName) then
    Result := True
  else
    Result := False;
  Freemem(ComputerName);
end;

function TNetWork.getLoginUser: String;
{-------------------------------------------------------------------------------
  过程名:    TNetWork.getLoginUser
  作者:      luohuachun
  日期:      2009.07.06
  参数:      无
  返回值:    String
  详细说明:  取得系统当前登陆的用户名;
-------------------------------------------------------------------------------}

Var
 LogName: PChar;
 Len: Cardinal;
begin
 GetMem(LogName, 255);
 Len := 255;
 GetUserName(LogName, Len); //    WNetGetUser(nil, LogName, Len);也可以
 Result := string(LogName);
 FreeMem(LogName);
end;

end.

