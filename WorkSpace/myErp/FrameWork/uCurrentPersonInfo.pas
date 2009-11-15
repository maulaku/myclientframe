{=============================================================================

动力软件插件
版权所有 (C) 2009 动力工作室

工程名称:  插件工程
作者:      罗华春
更新时间:  2009-5-14 23:07:57
功能说明:
==============================================================================}


unit uCurrentPersonInfo;

interface
uses Windows, Classes, ubase;

type
  TCurrentPersonInfo = class(TBase)
  end;

  TCurrentPersonInfoMgr = class(TObject)
  public
    //1 取得当前登陆用户的信息
    function LoadCurrentPerson: TCurrentPersonInfo;
  end;



implementation

{
**************************** TCurrentPersonInfoMgr *****************************
}

function TCurrentPersonInfoMgr.LoadCurrentPerson: TCurrentPersonInfo;
begin
  Result := nil;
end;


end.
