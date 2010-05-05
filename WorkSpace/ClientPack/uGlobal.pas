{*******************************************************}
{                                                       }
{       客户插件                                        }
{                                                       }
{       版权所有 (C) 2009 动力工作室                    }
{                                                       }
{*******************************************************}

unit uGlobal;

interface
uses ToolsAPI, ShellAPI, Windows, SysUtils,uMyProject;

type
  TAnsiCharSet = set of AnsiChar;
  TCompileMode = (cmDEBUG, cmRELEASE); //调试模式,发布模式;

const
  CompileFile = 'Compile.cfg'; //编译指令文件
  SetupFile = 'Setup.dof'; //配置文件

function getProjectConfig: TProjectInfo;
//取得编译参数指令
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
  过程名:    FormatPath
  作者:      developer
  日期:      2009.09.07
  参数:      Path:string
  返回值:    String
  说明:      格式化目录路径      
-------------------------------------------------------------------------------}
begin
  if Path[Length(Path)] <> '\' then
    Path := Path + '\';
  Result := Path;
end;

procedure SetCompileParam(Project:IOTAProject);
{-------------------------------------------------------------------------------
  过程名:    SetCompileParam
  作者:      developer
  日期:      2009.09.07
  参数:      无
  返回值:    无
  说明:      设置编译参数
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
    //ShowMessage('你使用的是Delphi 7.0 的版本');
  {$ENDIF}  

end;


{-------------------------------------------------------------------------------
  过程名:    getProjectConfig
  作者:      luohuachun
  日期:      2009.08.30
  参数:      无
  返回值:    TLHCPerferences
  详细说明:  取得项目配置对象
-------------------------------------------------------------------------------}

function getProjectConfig: TProjectInfo;
begin
  Result := TProjectInfo.Create;
  Result.Read;
end; 

function getCompileParam(CompileMode: TCompileMode): string;
{-------------------------------------------------------------------------------
  过程名:    getCompileParam
  作者:      luohuachun
  日期:      2009.08.30
  参数:      CompileMode:TCompileMode
  返回值:    string
  详细说明:  取得编译的命令行参数


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
  过程名:    GetCurrentModule
  作者:      luohuachun
  日期:      2009.04.19
  参数:      无
  返回值:    IOTAModule
  详细说明:  取得当前工程拥有的模块.
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
  过程名:    FindModuleInterface
  作者:      luohuachun
  日期:      2009.04.19
  参数:      AInterface: TGUID
  返回值:    IUnknown
  详细说明:  取得接口.
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
  过程名:    GetCurrentProjectGroup
  作者:      luohuachun
  日期:      2009.04.19
  参数:      无
  返回值:    IOTAProjectGroup
  详细说明:  取得当前工程组.
-------------------------------------------------------------------------------}
begin
  Result := FindModuleInterface(IOTAProjectGroup) as IOTAProjectGroup;
end;

function GetCurrentProject: IOTAProject;
{-------------------------------------------------------------------------------
  过程名:    GetCurrentProject
  作者:      luohuachun
  日期:      2009.04.19
  参数:      无
  返回值:    IOTAProject
  详细说明:  取得当前工程的接口.
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

  // 取当前工程文件名称

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
 // 判断字符是否在集合内

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

// 目录尾加'\'修正

function AddDirSuffix(const Dir: string): string;
begin
  Result := Trim(Dir);
  if Result = '' then Exit;
  if not IsPathDelimiter(Result, Length(Result)) then
    Result := Result + {$IFDEF MSWINDOWS} '\'; {$ELSE} '/'; {$ENDIF};
end;


// 目录尾加'\'修正

function MakePath(const Dir: string): string;
begin
  Result := AddDirSuffix(Dir);
end;


// 连接两个路径，
// Head - 首路径，可以是 C:\Test、\\Test\C\Abc、http://www.abc.com/dir/ 等格式
// Tail - 尾路径，可以是 ..\Test、Abc\Temp、\Test、/web/lib 等格式或绝对地址格式

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

  TailIsRel := ATail[1] = '\'; // 尾路径是相对路径
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
  过程名:    CompileProject
  作者:      luohuachun
  日期:      2009.04.23 23:46:57
  参数:      无
  返回值:    无
  详细说明:  编译工程
             取得工程中设置的选项是怎么来的?

             你可以这样取得工程中的选项;
             新建一个普通的应用程序为 Project1，并保存；然后编译;
             用UltraEdit去打开目录下的 project1.cfg文件; 你将会看到如下的内容;

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

              比如你要取得应用程序的输出目录，可以这样做(具体用法可以参照下面的函数);

              // 取 应用程序的输出目录 程序
              if GetActiveProjectOption('OutputDir', BinDir) then
                 OutputDir := BinDir;

              在上例中，'outputDir'可以取得应用程序的输出目录; 'UnitOutputDir' 可以
              取得单元的输入出目录;

-------------------------------------------------------------------------------}
//编译工程
//var
//  Project: IOTAProject;
//  ProjectBuilder: IOTAProjectBuilder;
//  ProjectFileName, ProjectExt: string;
//  CompileParam: string;
begin
//  showMessage('取得工程');
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
//  //设置工程的编译参数
//  SetCompileParam(Project);
//
////  showMessage(Format('工程文件名称:%s;工程系统名称:%s', [Project.FileName, project.FileSystem]));
////  showMessage(Format('Project.getFileName:%s;', [Project.getFileName]));
//
//  //if IndexStr(ProjectExt, ['.dpr', '.cpp', '.bpr', 'dpk', 'bpk']) < 0 then Exit;
//
//  // 编译工程
//  ProjectBuilder := Project.GetProjectBuilder;
//  ProjectBuilder.BuildProject(cmOTAMake, False);
//   // Exit if failure
//  if ProjectBuilder.ShouldBuild and not ProjectBuilder.BuildProject(cmOTAMake, False) then
//  begin
//    Exit;
//    //Showmessage('退出了!');
//  end;

  // 取 Host 程序
//  if GetActiveProjectOption('HostApplication', HostApp) then
//    ExeName := HostApp;

//  Showmessage('ExeName:' + ExeName);

//   MyProjectOption := project.ProjectOptions;
//  MyProjectOption.Values['OutPutDir'] := 'c:\';
    // 取 应用程序的输出目录 程序
//  if GetActiveProjectOption('OutputDir', BinDir) then
//    OutputDir := BinDir;

//  Showmessage('OutputDir:' + OutputDir);

  // 取运行参数
//  GetActiveProjectOption('RunParams', RunParams);
//  Params := RunParams;

  //Showmessage('Param:' + Params);

  // 无宿主程序
//  if ExeName = '' then
//  begin
//    OutputDir := GetOutputDir;
//    ExeName := MakePath(OutputDir) + ChangeFileExt(ExtractFileName(ProjectFileName), '.exe');
//  end;

//    ExeName := 'dcc32.exe ';

  // 执行程序. 由于这里是编译，所以我注释掉了以下的方法.
  {
    注意：如果你发现无法编辑文件的原因在于:当前工程目录下没有.cfg和.dof这两个工程配置文件;
          要解决这个问题，1:你在建立工程并保存后会自动生成这两个文件;
                          2:你也可以通过 dcc32这个命令加载指定的编译参数(可以参照.cfg和.dof)进行编译;
    其他: 我在创建工程并保存的时候没有生成.cfg .dof这两个文件.因此，这是一个遗留的问题;
  }
  //if FileExists(ExeName) then
   // ShellExecute(0, 'open', PChar(ExeName), PChar(CompileParam), PChar(WorkSpaceDirectory), SW_SHOWNORMAL);
end;

procedure RunProject;
{-------------------------------------------------------------------------------
  过程名:    RunProject
  作者:      luohuachun
  日期:      2009.04.23 23:46:37
  参数:      无
  返回值:    无
  详细说明:  运行工程
-------------------------------------------------------------------------------}
//编译工程
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
//  // 编译工程
//    ProjectBuilder := Project.GetProjectBuilder;
//  // Exit if failure
//    if ProjectBuilder.ShouldBuild and not ProjectBuilder.BuildProject(cmOTAMake, False) then
//      Exit;
//
//  //设置宿主程序
//    Project.ProjectOptions.Values['HostApplication'] := ProjectConfig.Bin + '\' + ProjectConfig.ProjectName;
//
//  // 取 Host 程序
//    if GetActiveProjectOption('HostApplication', HostApp) then
//      ExeName := HostApp;
//
//  // 取运行参数
//    GetActiveProjectOption('RunParams', RunParams);
//    Params := RunParams;
//
//  // 无宿主程序
//    if ExeName = '' then
//    begin
//      OutputDir := GetOutputDir;
//      ExeName := MakePath(OutputDir) + ChangeFileExt(ExtractFileName(ProjectFileName), '.exe');
//    end;
//
//  // 执行程序
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

