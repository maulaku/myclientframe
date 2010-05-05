{*******************************************************}
{                                                       }
{       我的工程包--文件实现部分                        }
{                                                       }
{       版权所有 (C) 2009 动力软件工作室                }
{                                                       }
{*******************************************************}


unit uFile;

interface
uses ToolsAPI;


type
  TBaseFile = class(TInterfacedObject)
  private
    FSource: string;
  public
    constructor Create(const ASource: string);
  end;

  TFormFile = class(TBaseFile, IOTAFile)
  public
    function GetAge: TDateTime;
    function GetSource: string;
    property Age: TDateTime read GetAge;
    property Source: string read GetSource;
  end;


  TFormImplFile = class(TBaseFile, IOTAFile)
  public
    function GetAge: TDateTime;
    function GetSource: string;
    property Age: TDateTime read GetAge;
    property Source: string read GetSource;
  end;

  FUnitFile = class(TBaseFile, IOTAFile)
  public
    function GetAge: TDateTime;
    function GetSource: string;
    property Age: TDateTime read GetAge;
    property Source: string read GetSource;
  end;

  TLibraryFile = class(TBaseFile, IOTAFile)
    function GetAge: TDateTime;
    function GetSource: string;
    property Age: TDateTime read GetAge;
    property Source: string read GetSource;
  end;

//{$R MyRes.Res}

implementation

{
********************************** TBaseFile ***********************************
}

constructor TBaseFile.Create(const ASource: string);
begin
  FSource := ASource;
end;

{
********************************** TFormFile ***********************************
}

function TFormFile.GetAge: TDateTime;
begin
  Result := -1;
end;

function TFormFile.GetSource: string;
begin
  Result := FSource;
end;

{
********************************** FUnitFile ***********************************
}

function FUnitFile.GetAge: TDateTime;
begin
  Result := -1;
end;

function FUnitFile.GetSource: string;
begin
  Result := FSource;
end;


{ TFormImplFile }

function TFormImplFile.GetAge: TDateTime;
begin
  Result := -1;
end;

function TFormImplFile.GetSource: string;
begin
  Result := FSource;
end;

{ TLibraryFile }

function TLibraryFile.GetAge: TDateTime;
begin
  Result := -1;
end;

function TLibraryFile.GetSource: string;
begin
  Result := FSource;
end;

end.

