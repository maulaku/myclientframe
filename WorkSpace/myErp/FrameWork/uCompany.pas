{=============================================================================

����������
��Ȩ���� (C) 2009 ����������

��������:  �������
����:      �޻���
����ʱ��:  2009-5-14 23:07:42
����˵��:
==============================================================================}

unit uCompany;

interface
uses uDBMgr, Classes, uBase;

type
  TCompany = class(TBase)
  private
    FDisplayName: string;
    FName: string;
    FShortTitle: string;
  public
    property DisplayName: string read FDisplayName write FDisplayName;
    property Name: string read FName write FName;
    property ShortTitle: string read FShortTitle write FShortTitle;
  end;

  TCompanyMgr = class(TPersistent)
  private
    FFWDbMgr: IFWDbMgr;
  public
    constructor Create;
    destructor Destroy; override;
    function LoadCompany: TCompany;
    //1 ע����ҵ��Ϣ
    procedure RegisterCompany(ACompany: TCompany);
  end;



implementation

{
********************************* TCompanyMgr **********************************
}

constructor TCompanyMgr.Create;
begin
  inherited Create;
  FFWDbMgr := TFWDbMgr.Create();
end;

destructor TCompanyMgr.Destroy;
begin
  FFWDbMgr := nil;
  inherited Destroy;
end;

function TCompanyMgr.LoadCompany: TCompany;
begin
end;

//1 ע����ҵ��Ϣ

procedure TCompanyMgr.RegisterCompany(ACompany: TCompany);
begin
end;


end.
