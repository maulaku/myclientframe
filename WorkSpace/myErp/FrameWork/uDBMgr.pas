{=============================================================================

动力软件插件
版权所有 (C) 2009 动力工作室

工程名称:  插件工程
作者:      罗华春
更新时间:  2009-5-14 23:07:36
功能说明:
==============================================================================}


unit uDBMgr;

interface
uses Classes, uni;

type
  IFWDbMgr = interface(IInterface)
    ['{C254619A-CCEB-42E9-9948-20746C486614}']
    function getDB: TUniConnection; stdcall;
  end;

  TFWDbMgr = class(TInterFacedObject, IFWDbMgr)
  private
    FDataBaseName: string;
    FPassWord: string;
    FUserName: string;
  public
    function getDB: TUniConnection; stdcall;
    //1 读取配置信息
    procedure ReadConfig;
    //1 写入配置信息
    procedure WriteConfig;
    property DataBaseName: string read FDataBaseName write FDataBaseName;
    property PassWord: string read FPassWord write FPassWord;
    property UserName: string read FUserName write FUserName;
  end;



implementation

{
*********************************** TFWDbMgr ***********************************
}

function TFWDbMgr.getDB: TUniConnection;
begin
  // TODO -cMM : Interface wizard: Implement interface method
end;

procedure TFWDbMgr.ReadConfig;
begin
end;

procedure TFWDbMgr.WriteConfig;
begin
end;


end.
