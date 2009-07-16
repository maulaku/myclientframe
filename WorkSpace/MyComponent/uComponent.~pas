unit uComponent;

interface

uses
  classes,SysUtils;


type
  TDepartment = class;

  //【事件】
  TBirthday = Procedure(Sender:TObject; iAge:Integer;sName:string) of object;
  //肤色 【枚举属性】
  TSkin = (siYellow,siBlue,siGreen);
  //状态 【集合属性】
  TMySatate = (msPower,msSpeend,msVirtual);
  TMyStates = set of TMySatate;

  TPerson = class(TComponent)
  private
    Fage: Integer;
    FAName: string;
    FCaption: string;
    FDepartment: TDepartment;
    FID: Integer;
    FOnBirthday: TBirthday;
    FreMark: TStrings;
    FSkin: TSkin;
    FMyState:TMyStates;
    FisYoungMen: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ask;
  published
    property age: Integer read Fage write Fage;
    property AName: string read FAName write FAName;
    property Caption: string read FCaption write FCaption;
    property ID: Integer read FID write FID;
    property reMark: TStrings read FreMark write FreMark;
    property Skin: TSkin read FSkin write FSkin;
    property MyState:TMyStates read FMyState Write FMyState;
    property isYoungMen:Boolean read FisYoungMen Write FisYoungMen;
    //部门属性
    property Department: TDepartment read FDepartment write FDepartment;
    //出生时的事件    
    property OnBirthday: TBirthday read FOnBirthday write FOnBirthday;
  end;

  TDepartment = class(TComponent)
  private
    FAName: string;
    FID: Integer;
    FManager: TPerson;
  published
    property AName: string read FAName write FAName;
    property ID: Integer read FID write FID;
    property Manager: TPerson read FManager write FManager;
  end;

procedure Register;
implementation

procedure Register;
begin
  RegisterComponents('sTest',[TPerson]);
  RegisterComponents('sTest',[TDepartment]);
end;  

procedure TPerson.ask;
{-------------------------------------------------------------------------------
  过程名:    TPerson.ask
  作者:      developer
  日期:      2009.07.16
  参数:      无
  返回值:    无
  详细说明:  用于为了测试事件; 方法原意为询问对象的身份信息时间触发；
-------------------------------------------------------------------------------}
begin
  if Assigned(FOnBirthday) then
    FOnBirthday(self,0,'luohuachun');
end;

constructor TPerson.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FreMark := TStringList.Create;
end;

destructor TPerson.Destroy;
begin
  inherited Destroy;
end;


end.
