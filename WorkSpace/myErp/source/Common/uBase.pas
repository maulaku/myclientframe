{=============================================================================

动力软件插件
版权所有 (C) 2009 动力工作室

工程名称:  插件工程
作者:      罗华春
更新时间:  2009-5-14 23:07:47
功能说明:
==============================================================================}


unit uBase;

interface
uses Classes;

type
  TBase = class(TPersistent)
  private
    FGUID: string;
    FID: string;
    FName: string;
  public
    property GUID: string read FGUID write FGUID;
    property ID: string read FID write FID;
    property Name: string read FName write FName;
  end;

implementation


end.
