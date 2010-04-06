{********************************************************

������Ϣ����ϵͳ                                        
��Ȩ���� (C) 2010 ������Ϣ�������޹�˾                  
�������: ����ʵ�ֵ�Ԫ

*********************************************************}


unit iService_Impl;

interface

uses
  {vcl:} Classes, SysUtils, 
  {RemObjects:} uROClientIntf, uROTypes, uROServer, uROServerIntf, uROSessions,
  {Data Abstract:} uDAClasses, uDADataTable, uDABinAdapter, uDAInterfaces, uDADataStreamer,
  {Ancestor Implementation:} DataAbstractService_Impl,
  {Used RODLs:} DataAbstract4_Intf,
  {Generated:} iLibrary_Intf;

type
  { TiService }
  TiService = class(TDataAbstractService, IiService)
    DataStreamer: TDABinDataStreamer;
    Schema: TDASchema;
  private
  protected
    { IiService methods }
  end;

implementation

{$R *.dfm}
uses
  {Generated:} iLibrary_Invk, fServerDataModule;

procedure Create_iService(out anInstance: IUnknown);
begin
  anInstance := TiService.Create(nil);
end;

initialization
  TROClassFactory.Create('iService', Create_iService, TiService_Invoker);
finalization
end.
