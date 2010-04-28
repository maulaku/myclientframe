unit erpService_Impl;

interface

uses
  {vcl:} Classes, SysUtils, 
  {RemObjects:} uROClientIntf, uROTypes, uROServer, uROServerIntf, uROSessions,
  {Data Abstract:} uDAClasses, uDADataTable, uDABin2DataStreamer, uDAInterfaces, uDADataStreamer,
  {Ancestor Implementation:} DataAbstractService_Impl,
  {Used RODLs:} DataAbstract4_Intf,
  {Generated:} erpLibrary_Intf;

type
  { TerpService }
  TerpService = class(TDataAbstractService, IerpService)
    DataStreamer: TDABin2DataStreamer;
    Schema: TDASchema;
  private
  protected
    { IerpService methods }
  end;

implementation

{$R *.dfm}
uses
  {Generated:} erpLibrary_Invk, fServerDataModule;

procedure Create_erpService(out anInstance: IUnknown);
begin
  anInstance := TerpService.Create(nil);
end;

initialization
  TROClassFactory.Create('erpService', Create_erpService, TerpService_Invoker);
finalization
end.
