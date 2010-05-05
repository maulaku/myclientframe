{*******************************************************}
{                                                       }
{       �ͻ����                                        }
{                                                       }
{       ��Ȩ���� (C) 2009 ����������                    }
{                                                       }
{*******************************************************}

unit uGlobal;

interface
uses ToolsAPI, ShellAPI, Windows, SysUtils,uMyProject;

type
  TAnsiCharSet = set of AnsiChar;
  TCompileMode = (cmDEBUG, cmRELEASE); //����ģʽ,����ģʽ;

const
  CompileFile = 'Compile.cfg'; //����ָ���ļ�
  SetupFile = 'Setup.dof'; //�����ļ�

function getProjectConfig: TProjectInfo;
//ȡ�ñ������ָ��
function getCompileParam(CompileMode: TCompileMode): string;
function GetCurrentModule: IOTAModule;
function FindModuleInterface(AInterface: TGUID): IUnknown;
function GetCurrentProject: IOTAProject;
function GetActiveProjectOptions(Project: IOTAProject = nil): IOTAProjectOptions;
function GetActiveProjectOption(const Option: string; var Value: Variant): Boolean;
function AddDirSuffix(const Dir: string): string;
function CharInSet(C: Char; CharSet: TAnsiCharSet): Boolean;
function GetOutputDir: string;
function LinkPath(const Head, Tail: string): string;
function MakeDir(const Path: string): string;
function MakePath(const Dir: string): string;
procedure CompileProject(CompileMode: TCompileMode);
procedure CompileProject1;
procedure RunProject;
procedure SetCompileParam(Project:IOTAProject);
Function FormatPath(Path:string):String;


implementation
uses uConst, Dialogs,uPackProject;



Function FormatPath(Path:string):String;
{-------------------------------------------------------------------------------
  ������:    FormatPath
  ����:      developer
  ����:      2009.09.07
  ����:      Path:string
  ����ֵ:    String
  ˵��:      ��ʽ��Ŀ¼·��      
-------------------------------------------------------------------------------}
begin
  if Path[Length(Path)] <> '\' then
    Path := Path + '\';
  Result := Path;
end;

procedure SetCompileParam(Project:IOTAProject);
{-------------------------------------------------------------------------------
  ������:    SetCompileParam
  ����:      developer
  ����:      2009.09.07
  ����:      ��
  ����ֵ:    ��
  ˵��:      ���ñ������
-------------------------------------------------------------------------------}
Var
  ProjectOption:IOTAProjectOptions;
  ProjectConfig:TProjectInfo;
begin
  ProjectConfig := getProjectConfig;
  try
  ProjectOption := Project.ProjectOptions;
  ProjectOption.Values['OutPutDir'] := FormatPath(ProjectConfig.DirectoryInfo.binPlugin);
  ProjectOption.Values['HostApplication'] := FormatPath(ProjectConfig.DirectoryInfo.Bin) + ProjectConfig.exeName;
  ProjectOption.Values['UnitOutputDir'] := FormatPath(ProjectConfig.DirectoryInfo.dcu);
  ProjectOption.Values['Packages'] := 'vcl;rtl;iPack';
  ProjectOption.Values['UsePackages'] := 1;
  ProjectOption.Values['Conditionals'] := 'DEBUG';
  ProjectOption.Values['UsePackages'] := 1;
  Finally
      FreeAndNil(ProjectConfig);
  end;

  {$IFDEF Ver160}
    //ShowMessage('��ʹ�õ���Delphi 7.0 �İ汾');
  {$ENDIF}  

end;


{-------------------------------------------------------------------------------
  ������:    getProjectConfig
  ����:      luohuachun
  ����:      2009.08.30
  ����:      ��
  ����ֵ:    TLHCPerferences
  ��ϸ˵��:  ȡ����Ŀ���ö���
-------------------------------------------------------------------------------}

function getProjectConfig: TProjectInfo;
begin
  Result := TProjectInfo.Create;
  Result.Read;
end; 

function getCompileParam(CompileMode: TCompileMode): string;
{-------------------------------------------------------------------------------
  ������:    getCompileParam
  ����:      luohuachun
  ����:      2009.08.30
  ����:      CompileMode:TCompileMode
  ����ֵ:    string
  ��ϸ˵��:  ȡ�ñ���������в���


-------------------------------------------------------------------------------}
var
  CompileStr: string;
  FDirectoryMgr: TProjectInfo;
begin
  FDirectoryMgr := TProjectInfo.Create;
  FDirectoryMgr.Read;

  CompileStr := '-$A8 -$B- -$C+ -$D+ -$E- -$F- -$G+ -$H+ -$I+ -$J- -$K- -$L+ -$M-' +
    ' -$N+ -$O+ -$P+ -$Q- -$R- -$S- -$T- -$U- -$V+ -$W- -$X+ -$YD-$Z1' +
    ' -cg -AWinTypes=Windows;WinProcs=Windows;DbiTypes=BDE;DbiProcs=BDE;DbiErrs=BDE;' +
    ' -H+ -W+ -M  -$M16384,1048576 -K$00400000 "%s" -E"%s" -N"%s" -LE"%s" -LN"%s" -D%s' +
    ' -LUvcl;rtl;iPack -w-UNSAFE_TYPE -w-UNSAFE_CODE -w-UNSAFE_CAST';
  with FDirectoryMgr.DirectoryInfo do begin
    if CompileMode in [cmDEBUG] then
      Result := Format(CompileStr, [GetActiveProject.FileName,BinPlugin, Dcu, Bpl, Dcp, 'DEBUG'])
    else Result := Format(CompileStr, [GetActiveProject.FileName, BinPlugin, Dcu, Bpl, Dcp, 'RELEASE'])
  end;
  FDirectoryMgr.Free;
end;

procedure CompileProject1;
var
  ProjectGroup: IOTAProjectGroup;
  ModuleProjectIndex: Integer;
  Module: IOTAModule;
  p: Integer;
  m: Integer;

  function GetProjectGroup: IOTAProjectGroup;
  var
    ModuleServices: IOTAModuleServices;
    i: Integer;
  begin
    // Standaard resultaat
    Result := nil;

    // Verkrijg een referentie naar de moduloe services
    ModuleServices := (BorlandIDEServices as IOTAModuleServices);

    // Loop door de modules
    for i := 0 to ModuleServices.ModuleCount - 1 do
    begin
      // Als een van de modules het IOTAProjectGroup interface implementeert,
      // dan is er een project group gevonden
      if (ModuleServices.Modules[i].QueryInterface(IOTAProjectGroup, Result) = S_OK) then
        Break;
    end;

    // Laat referentie naar het interface los
    ModuleServices := nil;
  end;

begin
  Module := (BorlandIDEServices as IOTAModuleServices).CurrentModule;
  ProjectGroup := GetProjectGroup;

  // Alleen als er referenties gevonden zijn dan moet er actie worden ondernomen
  if Assigned(Module) and Assigned(ProjectGroup) then
  begin
    // Tot dusverre is er geen project gevonden waarin de huidige module
    // zich bevindt
    ModuleProjectIndex := -1;

    // Loop door alle projecten van de projectgroup
    for p := 0 to ProjectGroup.ProjectCount - 1 do
    begin

      // Loop door alle modules van het project
      for m := 0 to ProjectGroup.Projects[p].GetModuleCount - 1 do
      begin

        // Als de filename van de module module overeenkomst met de filename
        // van de huidige module dan wordt het project als gevonden beschouwd
        if SameText(ProjectGroup.Projects[p].GetModule(m).FileName, Module.FileName) then
        begin
          // Onthou index
          ModuleProjectIndex := p;
          // Stop loop
          Break;
        end;

      end;

      // Als er iets gevonden is, stop dan de loop
      if ModuleProjectIndex <> -1 then
        Break;

    end;

    // Als er een project gevonden is, compileer het dan
    if ModuleProjectIndex <> -1 then
    begin
      // Compileer nooit het project waarin deze unit zit
      if Pos('IDEMENU.DPK', UpperCase(ExtractFileName(ProjectGroup.Projects[ModuleProjectIndex].FileName))) = 0 then
        ProjectGroup.Projects[ModuleProjectIndex].ProjectBuilder.BuildProject(cmOTAMake, False);
    end;
  end;
end;

function GetCurrentModule: IOTAModule;
{-------------------------------------------------------------------------------
  ������:    GetCurrentModule
  ����:      luohuachun
  ����:      2009.04.19
  ����:      ��
  ����ֵ:    IOTAModule
  ��ϸ˵��:  ȡ�õ�ǰ����ӵ�е�ģ��.
-------------------------------------------------------------------------------}
var
  Svc: IOTAModuleServices;
  AModule, NewModule: IOTAModule;
begin
  Result := nil;
  Svc := (BorlandideServices as IOTAModuleServices);
  AModule := Svc.CurrentModule;

  if AModule <> nil then
  begin
    if AModule.QueryInterface(IOTAProject, NewModule) = S_OK then
      Result := NewModule
    else if AModule.OwnerModuleCount > 0 then
    begin
      NewModule := AModule.OwnerModules[0];
      if NewModule <> nil then
        if NewModule.QueryInterface(IOTAProject, Result) <> S_OK then
          Result := nil;
    end;
  end;
end;



function FindModuleInterface(AInterface: TGUID): IUnknown;
{-------------------------------------------------------------------------------
  ������:    FindModuleInterface
  ����:      luohuachun
  ����:      2009.04.19
  ����:      AInterface: TGUID
  ����ֵ:    IUnknown
  ��ϸ˵��:  ȡ�ýӿ�.
-------------------------------------------------------------------------------}
var
  I: Integer;
begin
  Result := nil;
  with BorlandIDEServices as IOTAModuleServices do
    for I := 0 to ModuleCount - 1 do
      if (Modules[I].QueryInterface(AInterface, Result) = S_OK) then
        Break;
end;

function GetCurrentProjectGroup: IOTAProjectGroup;
{-------------------------------------------------------------------------------
  ������:    GetCurrentProjectGroup
  ����:      luohuachun
  ����:      2009.04.19
  ����:      ��
  ����ֵ:    IOTAProjectGroup
  ��ϸ˵��:  ȡ�õ�ǰ������.
-------------------------------------------------------------------------------}
begin
  Result := FindModuleInterface(IOTAProjectGroup) as IOTAProjectGroup;
end;

function GetCurrentProject: IOTAProject;
{-------------------------------------------------------------------------------
  ������:    GetCurrentProject
  ����:      luohuachun
  ����:      2009.04.19
  ����:      ��
  ����ֵ:    IOTAProject
  ��ϸ˵��:  ȡ�õ�ǰ���̵Ľӿ�.
-------------------------------------------------------------------------------}
var
  ProjectGroup: IOTAProjectGroup;
begin
  ProjectGroup := GetCurrentProjectGroup;
  if Assigned(ProjectGroup) then
    Result := ProjectGroup.ActiveProject
  else
    Result := FindModuleInterface(IOTAProject) as IOTAProject;
end;

function GetActiveProjectOptions(Project: IOTAProject = nil): IOTAProjectOptions;
begin
  Result := nil;
  if Assigned(Project) then
  begin
    Result := Project.ProjectOptions;
    Exit;
  end;
  Project := GetCurrentProject;
  if Assigned(Project) then
    Result := Project.ProjectOptions;
end;


function GetActiveProjectOption(const Option: string; var Value: Variant): Boolean;
var
  ProjectOptions: IOTAProjectOptions;
begin
  Result := False;
  Value := '';
  ProjectOptions := GetActiveProjectOptions;
  if Assigned(ProjectOptions) then
  begin
    Value := ProjectOptions.Values[Option];
    Result := True;
  end;
end;

  // ȡ��ǰ�����ļ�����

function GetCurrentProjectFileName: string;
var
  CurrentProject: IOTAProject;
begin
  CurrentProject := GetCurrentProject;
  if Assigned(CurrentProject) then
    Result := CurrentProject.FileName
  else
    Result := '';
end;
 // �ж��ַ��Ƿ��ڼ�����

function CharInSet(C: Char; CharSet: TAnsiCharSet): Boolean;
begin
{$IFDEF COMPILER12_UP}
  if Ord(C) <= $FF then
    Result := AnsiChar(C) in CharSet
  else
    Result := False;
{$ELSE}
  Result := C in CharSet;
{$ENDIF}
end;


function MakeDir(const Path: string): string;
begin
  Result := Trim(Path);
  if Result = '' then Exit;
  if CharInSet(Result[Length(Result)], ['/', '\']) then
    Delete(Result, Length(Result), 1);
end;

// Ŀ¼β��'\'����

function AddDirSuffix(const Dir: string): string;
begin
  Result := Trim(Dir);
  if Result = '' then Exit;
  if not IsPathDelimiter(Result, Length(Result)) then
    Result := Result + {$IFDEF MSWINDOWS} '\'; {$ELSE} '/'; {$ENDIF};
end;


// Ŀ¼β��'\'����

function MakePath(const Dir: string): string;
begin
  Result := AddDirSuffix(Dir);
end;


// ��������·����
// Head - ��·���������� C:\Test��\\Test\C\Abc��http://www.abc.com/dir/ �ȸ�ʽ
// Tail - β·���������� ..\Test��Abc\Temp��\Test��/web/lib �ȸ�ʽ����Ե�ַ��ʽ

function LinkPath(const Head, Tail: string): string;
var
  HeadIsUrl: Boolean;
  TailHasRoot: Boolean;
  TailIsRel: Boolean;
  AHead, ATail, S: string;
  UrlPos, i: Integer;
begin
  if Head = '' then
  begin
    Result := Tail;
    Exit;
  end;

  if Tail = '' then
  begin
    Result := Head;
    Exit;
  end;

  TailHasRoot := (AnsiPos(':\', Tail) = 2) or // C:\Test
    (AnsiPos('\\', Tail) = 1) or // \\Name\C\Test
    (AnsiPos('://', Tail) > 0); // ftp://ftp.abc.com
  if TailHasRoot then
  begin
    Result := Tail;
    Exit;
  end;

  UrlPos := AnsiPos('://', Head);
  HeadIsUrl := UrlPos > 0;
  AHead := StringReplace(Head, '/', '\', [rfReplaceAll]);
  ATail := StringReplace(Tail, '/', '\', [rfReplaceAll]);

  TailIsRel := ATail[1] = '\'; // β·�������·��
  if TailIsRel then
  begin
    if AnsiPos(':\', AHead) = 2 then
      Result := AHead[1] + ':' + ATail
    else if AnsiPos('\\', AHead) = 1 then
    begin
      S := Copy(AHead, 3, MaxInt);
      i := AnsiPos('\', S);
      if i > 0 then
        Result := Copy(AHead, 1, i + 1) + ATail
      else
        Result := AHead + ATail;
    end else if HeadIsUrl then
    begin
      S := Copy(AHead, UrlPos + 3, MaxInt);
      i := AnsiPos('\', S);
      if i > 0 then
        Result := Copy(AHead, 1, i + UrlPos + 1) + ATail
      else
        Result := AHead + ATail;
    end
    else
    begin
      Result := Tail;
      Exit;
    end;
  end
  else
  begin
    if Copy(ATail, 1, 2) = '.\' then
      Delete(ATail, 1, 2);
    AHead := MakeDir(AHead);
    i := Pos('..\', ATail);
    while i > 0 do
    begin
      AHead := ExtractFileDir(AHead);
      Delete(ATail, 1, 3);
      i := Pos('..\', ATail);
    end;
    Result := MakePath(AHead) + ATail;
  end;

  if HeadIsUrl then
    Result := StringReplace(Result, '\', '/', [rfReplaceAll]);
end;


function GetOutputDir: string;
var
  ProjectDir: string;
  OutputDir: Variant;
begin
  ProjectDir := ExtractFileDir(GetCurrentProjectFileName);
  if GetActiveProjectOption('OutputDir', OutputDir) then
    Result := LinkPath(ProjectDir, OutputDir)
  else
    Result := ProjectDir;
end;

procedure CompileProject(CompileMode: TCompileMode);
{-------------------------------------------------------------------------------
  ������:    CompileProject
  ����:      luohuachun
  ����:      2009.04.23 23:46:57
  ����:      ��
  ����ֵ:    ��
  ��ϸ˵��:  ���빤��
             ȡ�ù��������õ�ѡ������ô����?

             ���������ȡ�ù����е�ѡ��;
             �½�һ����ͨ��Ӧ�ó���Ϊ Project1�������棻Ȼ�����;
             ��UltraEditȥ��Ŀ¼�µ� project1.cfg�ļ�; �㽫�ῴ�����µ�����;

             ...
             [Directories]
              OutputDir=D:\MySpace\project\bin
              UnitOutputDir=D:\MySpace\project\dcu
              PackageDLLOutputDir=
              PackageDCPOutputDir=
              SearchPath=
              Packages=vcl;rtl;vclx;indy;inet;xmlrtl;vclie;inetdbbde;inetdbxpress;dbrtl;dsnap;dsnapcon;vcldb;soaprtl;VclSmp;dbexpress;dbxcds;inetdb;bdertl;vcldbx;webdsnap;adortl;ibxpress;teeui;teedb;tee;dss;visualclx;visualdbclx;vclactnband;vclshlctrls;Rave50CLX;Rave50VCL;RemObjects_WebBroker_D7;RemObjects_Indy_D7;RemObjects_RODX_D7;RemObjects_BPDX_D7;RemObjects_Synapse_D7;RaizeComponentsVcl;RaizeComponentsVclDb;frx7;frxADO7;frxBDE7;frxcs7;frxDB7;frxDBX7;frxe7;frxIBX7;fs7;fsADO7;fsBDE7;fsDB7;fsIBX7;dclOfficeXP
              Conditionals=
              DebugSourceDirs=
              UsePackages=0
              [Parameters]
              RunParams=
              HostApplication=
              Launcher=
              UseLauncher=0
              DebugCWD=
              [Language]
              ...
              ...

              ������Ҫȡ��Ӧ�ó�������Ŀ¼������������(�����÷����Բ�������ĺ���);

              // ȡ Ӧ�ó�������Ŀ¼ ����
              if GetActiveProjectOption('OutputDir', BinDir) then
                 OutputDir := BinDir;

              �������У�'outputDir'����ȡ��Ӧ�ó�������Ŀ¼; 'UnitOutputDir' ����
              ȡ�õ�Ԫ�������Ŀ¼;

-------------------------------------------------------------------------------}
//���빤��
//var
//  Project: IOTAProject;
//  ProjectBuilder: IOTAProjectBuilder;
//  ProjectFileName, ProjectExt: string;
//  CompileParam: string;
begin
//  showMessage('ȡ�ù���');
//  CompileParam := getCompileParam(CompileMode);
//
//  Project := GetCurrentProject;
//  if not Assigned(Project) then
//    Exit;
//
//
//  ProjectFileName := Project.GetFileName;
//  ProjectExt := ExtractFileExt(ProjectFileName);
//
//  //���ù��̵ı������
//  SetCompileParam(Project);
//
////  showMessage(Format('�����ļ�����:%s;����ϵͳ����:%s', [Project.FileName, project.FileSystem]));
////  showMessage(Format('Project.getFileName:%s;', [Project.getFileName]));
//
//  //if IndexStr(ProjectExt, ['.dpr', '.cpp', '.bpr', 'dpk', 'bpk']) < 0 then Exit;
//
//  // ���빤��
//  ProjectBuilder := Project.GetProjectBuilder;
//  ProjectBuilder.BuildProject(cmOTAMake, False);
//   // Exit if failure
//  if ProjectBuilder.ShouldBuild and not ProjectBuilder.BuildProject(cmOTAMake, False) then
//  begin
//    Exit;
//    //Showmessage('�˳���!');
//  end;

  // ȡ Host ����
//  if GetActiveProjectOption('HostApplication', HostApp) then
//    ExeName := HostApp;

//  Showmessage('ExeName:' + ExeName);

//   MyProjectOption := project.ProjectOptions;
//  MyProjectOption.Values['OutPutDir'] := 'c:\';
    // ȡ Ӧ�ó�������Ŀ¼ ����
//  if GetActiveProjectOption('OutputDir', BinDir) then
//    OutputDir := BinDir;

//  Showmessage('OutputDir:' + OutputDir);

  // ȡ���в���
//  GetActiveProjectOption('RunParams', RunParams);
//  Params := RunParams;

  //Showmessage('Param:' + Params);

  // ����������
//  if ExeName = '' then
//  begin
//    OutputDir := GetOutputDir;
//    ExeName := MakePath(OutputDir) + ChangeFileExt(ExtractFileName(ProjectFileName), '.exe');
//  end;

//    ExeName := 'dcc32.exe ';

  // ִ�г���. ���������Ǳ��룬������ע�͵������µķ���.
  {
    ע�⣺����㷢���޷��༭�ļ���ԭ������:��ǰ����Ŀ¼��û��.cfg��.dof���������������ļ�;
          Ҫ���������⣬1:���ڽ������̲��������Զ������������ļ�;
                          2:��Ҳ����ͨ�� dcc32����������ָ���ı������(���Բ���.cfg��.dof)���б���;
    ����: ���ڴ������̲������ʱ��û������.cfg .dof�������ļ�.��ˣ�����һ������������;
  }
  //if FileExists(ExeName) then
   // ShellExecute(0, 'open', PChar(ExeName), PChar(CompileParam), PChar(WorkSpaceDirectory), SW_SHOWNORMAL);
end;

procedure RunProject;
{-------------------------------------------------------------------------------
  ������:    RunProject
  ����:      luohuachun
  ����:      2009.04.23 23:46:37
  ����:      ��
  ����ֵ:    ��
  ��ϸ˵��:  ���й���
-------------------------------------------------------------------------------}
//���빤��
//var
//  Project: IOTAProject;
//  ProjectBuilder: IOTAProjectBuilder;
//  HostApp, RunParams: Variant;
//  Params, OutputDir, ProjectFileName, ExeName, ProjectExt: string;
//  ProjectConfig: TLHCPerferences;
//begin
//
//  ProjectConfig := getProjectConfig;
//  try
//    Project := GetCurrentProject;
//    if not Assigned(Project) then
//      Exit;
//
//    ProjectFileName := Project.GetFileName;
//    ProjectExt := ExtractFileExt(ProjectFileName);
//
//  //if IndexStr(ProjectExt, ['.dpr', '.cpp', '.bpr', 'dpk', 'bpk']) < 0 then Exit;
//
//  // ���빤��
//    ProjectBuilder := Project.GetProjectBuilder;
//  // Exit if failure
//    if ProjectBuilder.ShouldBuild and not ProjectBuilder.BuildProject(cmOTAMake, False) then
//      Exit;
//
//  //������������
//    Project.ProjectOptions.Values['HostApplication'] := ProjectConfig.Bin + '\' + ProjectConfig.ProjectName;
//
//  // ȡ Host ����
//    if GetActiveProjectOption('HostApplication', HostApp) then
//      ExeName := HostApp;
//
//  // ȡ���в���
//    GetActiveProjectOption('RunParams', RunParams);
//    Params := RunParams;
//
//  // ����������
//    if ExeName = '' then
//    begin
//      OutputDir := GetOutputDir;
//      ExeName := MakePath(OutputDir) + ChangeFileExt(ExtractFileName(ProjectFileName), '.exe');
//    end;
//
//  // ִ�г���
//    if FileExists(ExeName) then
//      ShellExecute(0, 'open', PChar(ExeName), PChar(Params),
//        PChar(ExtractFileDir(ExeName)), SW_SHOWNORMAL);
//  finally
//    ProjectConfig.Free;
//  end;
var
  MyProject:TPackProject;
begin
  MyProject := TPackProject.Create;
  Myproject.Run;
  MyProject.Free;
end;
end.

