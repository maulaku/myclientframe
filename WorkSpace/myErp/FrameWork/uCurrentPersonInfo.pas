{=============================================================================

����������
��Ȩ���� (C) 2009 ����������

��������:  �������
����:      �޻���
����ʱ��:  2009-5-14 23:07:57
����˵��:
==============================================================================}


unit uCurrentPersonInfo;

interface
uses Windows, Classes, ubase;

type
  TCurrentPersonInfo = class(TBase)
  end;

  TCurrentPersonInfoMgr = class(TObject)
  public
    //1 ȡ�õ�ǰ��½�û�����Ϣ
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
