{=============================================================================

����������
��Ȩ���� (C) 2009 ����������

��������:  �������
����:      �޻���
����ʱ��:  2009-5-14 23:07:47
����˵��:
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
