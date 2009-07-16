{*******************************************************}
{                                                       }
{       �����������                                    }
{                                                       }
{       ��Ȩ���� (C) 2009 �����Ƽ�                      }
{                                                       }
{*******************************************************}

unit uPlugin;


interface

uses
  Classes, Controls, SysUtils, Windows, Forms;

type

  TShowForm = function: THandle;
  TCloseForm = procedure; stdcall;

  EDlllOadError = class(Exception);

  TPlugin = class(TObject)
  private
    FDllHandle: THandle;
    FFormHandle: THandle;
    FName: string;
  public
    ShowForm: TShowForm;
    CloseForm: TCloseForm;
    
    destructor Destroy; override;
    //1 ������
    property DllHandle: THandle read FDllHandle write FDllHandle;
    //1 �������ľ��
    property FormHandle: THandle read FFormHandle write FFormHandle;
    //1 �������
    property Name: string read FName write FName;


  end;

  TPluginMgr = class(TObject)
  private
    PluginList: TStrings;
    //1 �ڳ��в��Ҳ��
    function FindPlugin(ApluginName: string): TPlugin; overload;
    procedure FreePlugin(APluginName:String);overload;
  public
    constructor Create;
    destructor Destroy; override;   
    //1 ͨ����ǰ����Ӵ��嵽�������Ĳ��
    procedure FreePlugin(AChildFormHandle: THandle);overload;   
    procedure LoadPlugin(PluginName: string);
  end;

implementation


constructor TPluginMgr.Create;
begin
  inherited Create;
  PluginList := TStringList.Create();
end;

destructor TPluginMgr.Destroy;
var
  i: Integer;
begin
  for i := pluginList.Count-1 downto 0 do
  begin
      (pluginList.Objects[i]).Free;
  end;
  FreeAndNil(PluginList);
  inherited Destroy;
end;

function TPluginMgr.FindPlugin(ApluginName: string): TPlugin;
begin
  if PluginList.IndexOf(ApluginName) = -1 then Result := nil
  else Result := TPlugin(PluginList.Objects[PluginList.IndexOf(ApluginName)]);
end;

procedure TPluginMgr.FreePlugin(AChildFormHandle: THandle);
var
  i: Integer;
  plg: TPlugin;
begin
  for i := PluginList.Count-1 downto 0 do begin
      plg := TPlugin(PluginList.Objects[i]);
      if Plg.FormHandle = AChildFormHandle then
      begin
          FreePlugin(plg.FName);
          exit;
      end;
  end;
end;

procedure TPluginMgr.FreePlugin(APluginName:string);
begin
  PluginList.Objects[PluginList.IndexOf(APluginName)].Free;
  PluginList.Delete(PluginList.IndexOf(APluginName));
end;

procedure TPluginMgr.LoadPlugin(PluginName: string);
var
  plg: TPlugin;
begin
  //ȡ�ò��������װ�뵽���С�
  plg := FindPlugin(PluginName);
  if not (plg = nil) then exit;

  //����Ƿ���ڣ��������½�������ֱ�ӷ���;
  plg := TPlugin.Create;
  with plg do
  begin
    Name := PluginName;
    FDllHandle := LoadLibrary(PChar(extractfilepath(application.ExeName) + PluginName));
    if FDllHandle = 0 then begin
      raise EDLLLoadError.Create('�������� [' + extractfilepath(application.ExeName) + PluginName + ']ģ���ļ�!');
      FreeAndNil(plg);
      exit;
    end;

    @ShowForm := GetProcAddress(FDllHandle, 'ShowForm');
    if @ShowForm = nil then exit;
    @CloseForm := GetProcAddress(FDllHandle, 'CloseForm');
    if @CloseForm = nil then exit;

    //��ʾ����
    try
      FormHandle := ShowForm();
    except
      FreeLibrary(FDllHandle);
    end;
  end;
  //װ�����
  PluginList.AddObject(plg.FName,plg);
end;

destructor TPlugin.Destroy;
begin
  inherited;
  CloseForm;
  FreeLibrary(FDllHandle);
  FDllHandle := 0; 
end;

end.

