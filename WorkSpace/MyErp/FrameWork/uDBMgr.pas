{=============================================================================

����������
��Ȩ���� (C) 2009 ����������

��������:  �������
����:      �޻���
����ʱ��:  2009-5-14 23:07:36
����˵��:
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
    //1 ��ȡ������Ϣ
    procedure ReadConfig;
    //1 д��������Ϣ
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
