unit uClientTest;

interface
uses Classes,Forms,Windows;

type
  TCreateMDIForm = procedure(AApp:TApplication;AScrn:TScreen);stdcall;
  
  TClientTest = class(TComponent)
  public
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function ShowDlgBox: string;
    procedure ShowMsgDlg;
    //��DLL����

    procedure LoadMDIForm;
  end;

implementation
uses Dialogs; 

{
********************************* TClientTest **********************************
}
constructor TClientTest.Create(AOwner : TComponent);
begin
  inherited  Create(AOwner);
end;

destructor TClientTest.Destroy;
begin

  inherited;
end;  

procedure TClientTest.LoadMDIForm;
{-------------------------------------------------------------------------------
  ������:    TClientTest.LoadMDIForm
  ����:      luohuachun
  ����:      2009.05.10 14:14:47
  ����:      ��
  ����ֵ:    ��
  ��ϸ˵��:  ����MDI����ģ��.
-------------------------------------------------------------------------------}
var
  LibHandle:THandle;
  CreateMDIForm:TCreateMDIForm;
begin
  libHandle := LoadLibrary('D:\WorkSpace\Lpack\MyPlugin.dll');
  try
    if LibHandle = 0  then exit;

    @CreateMDIForm := GetProcAddress(LibHandle,'CreateMDIForm');
    if @CreateMDIForm = nil then exit;
    
    CreateMDIForm(Application,Screen);     
  Finally
      FreeLibrary(libHandle);
  end;
end;

function TClientTest.ShowDlgBox: string;
begin
  Result := '���,�й�!';
end;

procedure TClientTest.ShowMsgDlg;
begin
//  ShowMessage('Nihao china!');
end;


end.
