{********************************************************

������Ϣ����ϵͳ                                        
��Ȩ���� (C) 2010 ������Ϣ�������޹�˾                  
�������: ����������Ԫ

*********************************************************} 
unit uEnvironment;

interface
uses SysUtils,IniFiles;

type
  TEnvironment = class(TObject)
  private
    FLogOutLevel: Integer;
    FPath: WideString;
    FPort: Integer;

    FIni:TiniFile;
    function GetLogOutLevel: Integer;
    function GetPort: Integer;
    //1 ��ʼ��������Ϣ
    procedure InitConfigInformation;
  public
    constructor Create;
    destructor Destroy; override;
    //1 ��־����ȼ�
    property LogOutLevel: Integer read GetLogOutLevel write FLogOutLevel;
    //1 Ӧ�ó���·��
    property Path: WideString read FPath write FPath;
    //1 �˿ں�
    property Port: Integer read GetPort write FPort;
  end;

Var
  Env:TEnvironment;
  
implementation

uses
  uConst;

constructor TEnvironment.Create;
begin
  inherited;
  {$WARN SYMBOL_PLATFORM OFF}
  FPath := IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)));
  {$WARN SYMBOL_PLATFORM ON}
  FIni := TIniFile.Create(FPath+ConfigName);

  InitConfigInformation;  
end;

destructor TEnvironment.Destroy;
begin
  FreeAndNil(FIni);
  inherited;
end;

function TEnvironment.GetLogOutLevel: Integer;
begin
  FLogOutLevel := FIni.ReadInteger('Log','OutLevel',0);
  Result := FLogOutLevel;
end;

function TEnvironment.GetPort: Integer;
begin
  FPort := FIni.ReadInteger('Server','Port',0);
  if FPort = 0 then
    FPort := 8527;
  Result := FPort;
end;

procedure TEnvironment.InitConfigInformation;
{-------------------------------------------------------------------------------
  ������:    TEnvironment.InitConfigInformation
  ����:      �޻���
  ����:      2010.04.03
  ����:      ��
  ����ֵ:    ��
  ��ϸ˵��:  ��ʼ��������Ϣ.
-------------------------------------------------------------------------------}
begin
  if not Fini.SectionExists('Log') then
    FIni.WriteInteger('Log','OutLevel',0);
  if not Fini.SectionExists('Server') then
    FIni.WriteInteger('Server','port',8527);
end;

initialization
  Env := TEnvironment.Create;
finalization
  Env.Free;
end.
