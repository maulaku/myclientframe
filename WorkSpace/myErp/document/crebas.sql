alter table "TSYS_Columns"
   drop constraint FK_TSYS_COL_RELATIONS_TSYS_TAB;

alter table "TSYS_Employee"
   drop constraint FK_TSYS_EMP_RELATIONS_TSYS_ORG;

alter table "TSYS_Employee"
   drop constraint FK_TSYS_EMP_RELATIONS_TSYS_POS;

alter table "TSYS_Function"
   drop constraint FK_TSYS_FUN_RELATIONS_TSYS_MEN;

alter table "TSYS_PosPurviews"
   drop constraint FK_TSYS_POS_RELATIONS_TSYS_POS;

alter table "TSYS_PosPurviews"
   drop constraint FK_TSYS_POS_RELATIONS_TSYS_PUR;

alter table "TSYS_PurMenus"
   drop constraint FK_TSYS_PUR_RELATIONS_TSYS_MEN;

alter table "TSYS_PurMenus"
   drop constraint FK_TSYS_PUR_RELATIONS_TSYS_FUN;

drop index "Relationship_3_FK";

drop index "Relationship_2_FK";

drop index "Relationship_1_FK";

drop index "Relationship_4_FK";

drop index "Relationship_8_FK";

drop index "Relationship_7_FK";

drop index "Relationship_10_FK";

drop index "Relationship_9_FK";

create table "Company"  (
   "FCompanyGUID"       VARCHAR2(32)                    not null,
   "FIncorporator"      VARCHAR2(20),
   "FQuality"           VARCHAR2(20),
   "FFunding"           NUMBER(20),
   "FAddress"           VARCHAR2(100),
   "FCaption"           VARCHAR2(50),
   "FName"              VARCHAR2(20),
   FCREATETIME          DATE                           default SYSDATE,
   FUPDATETIME          DATE                           default SYSDATE,
   constraint PK_COMPANY primary key ("FCompanyGUID")
);

comment on table "Company" is
'公司信息';

comment on column "Company"."FCompanyGUID" is
'公司GUID';

comment on column "Company"."FIncorporator" is
'法人代表';

comment on column "Company"."FQuality" is
'公司性质';

comment on column "Company"."FFunding" is
'注册资金';

comment on column "Company"."FAddress" is
'地址';

comment on column "Company"."FCaption" is
'中文名称';

comment on column "Company"."FName" is
'名称';

comment on column "Company".FCREATETIME is
'创建时间';

comment on column "Company".FUPDATETIME is
'更新时间';

insert into company(fcompanyguid, 
                    fincorporator, 
                    fquality, 
                    ffunding, 
                    faddress, 
                    fcaption, 
                    fname, 
                    fcreatetime, 
                    fupdatetime) values(sys_guid(),'张三','私营',200,'XXX省XX市XXX公司','动力信息技术有限公司','动力科技',sysdate,sysdate);

create table "Modals"  (
   "FModalGUID"         VARCHAR2(80)                    not null,
   FID                  VARCHAR2(20),
   "FName"              VARCHAR2(20),
   "FCaption"           VARCHAR2(18),
   "FFileName"          CHAR(10),
   "Functioning"        BLOB,
   "FFlag"              SMALLINT                       default 1,
   FCREATETIME          DATE                           default SYSDATE,
   FUSERGUID            VARCHAR2(32),
   FUSERID              VARCHAR2(32)                   default NULL,
   "FOrganizationalGUID" VARCHAR2(32),
   constraint PK_MODALS primary key ("FModalGUID")
);

comment on table "Modals" is
'模块表';

comment on column "Modals"."FModalGUID" is
'模块GUID';

comment on column "Modals".FID is
'编号';

comment on column "Modals"."FName" is
'名称';

comment on column "Modals"."FCaption" is
'中文名称';

comment on column "Modals"."FFileName" is
'文件名';

comment on column "Modals"."Functioning" is
'功能';

comment on column "Modals"."FFlag" is
'标志';

comment on column "Modals".FCREATETIME is
'创建时间';

comment on column "Modals".FUSERGUID is
'用户GUID';

comment on column "Modals".FUSERID is
'用户ID';

comment on column "Modals"."FOrganizationalGUID" is
'组织机构GUID';

create table TBASE_DICT  (
   FDGUID               VARCHAR2(32)                    not null,
   "FParentGUID"        VARCHAR2(32),
   FID                  VARCHAR2(20),
   "FName"              VARCHAR2(20),
   "FCaption"           VARCHAR2(18),
   FCREATETIME          DATE                           default SYSDATE,
   FUPDATETIME          DATE                           default SYSDATE,
   FUSERGUID            VARCHAR2(32),
   FUSERID              VARCHAR2(32)                   default NULL,
   "FOrganizationalGUID" VARCHAR2(32),
   "FFlag"              SMALLINT                       default 1,
   constraint PK_TBASE_DICT primary key (FDGUID)
);

comment on table TBASE_DICT is
'字典';

comment on column TBASE_DICT.FDGUID is
'字典GUID';

comment on column TBASE_DICT."FParentGUID" is
'父ID';

comment on column TBASE_DICT.FID is
'编号';

comment on column TBASE_DICT."FName" is
'名称';

comment on column TBASE_DICT."FCaption" is
'中文名称';

comment on column TBASE_DICT.FCREATETIME is
'创建时间';

comment on column TBASE_DICT.FUPDATETIME is
'更新时间';

comment on column TBASE_DICT.FUSERGUID is
'用户GUID';

comment on column TBASE_DICT.FUSERID is
'用户ID';

comment on column TBASE_DICT."FOrganizationalGUID" is
'组织机构GUID';

comment on column TBASE_DICT."FFlag" is
'标志';

create table "TSYS_Columns"  (
   "FColID"             VARCHAR2(32)                    not null,
   "FTabGUID"           VARCHAR2(32)                    not null,
   "FName"              VARCHAR2(20),
   "FCaption"           VARCHAR2(18),
   FCREATETIME          DATE                           default SYSDATE not null,
   FUPDATETIME          DATE                           default SYSDATE not null,
   FUSERID              VARCHAR2(32)                   default NULL not null,
   FUSERGUID            VARCHAR2(32)                    not null,
   "FOrganizationalGUID" VARCHAR2(32)                    not null,
   "FFlag"              SMALLINT                       default 1,
   constraint PK_TSYS_COLUMNS primary key ("FColID")
);

comment on table "TSYS_Columns" is
'列集合';

comment on column "TSYS_Columns"."FColID" is
'列GUID';

comment on column "TSYS_Columns"."FTabGUID" is
'表GUID';

comment on column "TSYS_Columns"."FName" is
'名称';

comment on column "TSYS_Columns"."FCaption" is
'中文名称';

comment on column "TSYS_Columns".FCREATETIME is
'创建时间';

comment on column "TSYS_Columns".FUPDATETIME is
'更新时间';

comment on column "TSYS_Columns".FUSERID is
'用户ID';

comment on column "TSYS_Columns".FUSERGUID is
'用户GUID';

comment on column "TSYS_Columns"."FOrganizationalGUID" is
'组织机构GUID';

comment on column "TSYS_Columns"."FFlag" is
'标志';

create index "Relationship_3_FK" on "TSYS_Columns" (
   "FTabGUID" ASC
);

create table "TSYS_Employee"  (
   "FEmpGUID"           VARCHAR2(32)                    not null,
   "FOgnGUID"           VARCHAR2(32)                    not null,
   "FPosGUID"           VARCHAR2(32)                    not null,
   FID                  VARCHAR2(20),
   "FCaption"           VARCHAR2(18),
   "FName"              VARCHAR2(20)                    not null,
   "FPassWord"          VARCHAR2(18),
   "FisLogin"           SMALLINT                       default 1,
   FZZZT                SMALLINT                       default 1,
   FCREATETIME          DATE                           default SYSDATE not null,
   FUPDATETIME          DATE                           default SYSDATE not null,
   FUSERID              VARCHAR2(32)                   default NULL not null,
   FUSERGUID            VARCHAR2(32)                    not null,
   "FOrganizationalGUID" VARCHAR2(32)                    not null,
   "FFlag"              SMALLINT                       default 1,
   constraint PK_TSYS_EMPLOYEE primary key ("FEmpGUID")
);

comment on table "TSYS_Employee" is
'人员表';

comment on column "TSYS_Employee"."FEmpGUID" is
'用户FGUID';

comment on column "TSYS_Employee"."FOgnGUID" is
'机构GUID';

comment on column "TSYS_Employee"."FPosGUID" is
'岗位GUID';

comment on column "TSYS_Employee".FID is
'编号';

comment on column "TSYS_Employee"."FCaption" is
'中文名称';

comment on column "TSYS_Employee"."FName" is
'名称';

comment on column "TSYS_Employee"."FPassWord" is
'口令';

comment on column "TSYS_Employee"."FisLogin" is
'允许登陆';

comment on column "TSYS_Employee".FZZZT is
'在职状态';

comment on column "TSYS_Employee".FCREATETIME is
'创建时间';

comment on column "TSYS_Employee".FUPDATETIME is
'更新时间';

comment on column "TSYS_Employee".FUSERID is
'用户ID';

comment on column "TSYS_Employee".FUSERGUID is
'用户GUID';

comment on column "TSYS_Employee"."FOrganizationalGUID" is
'组织机构GUID';

comment on column "TSYS_Employee"."FFlag" is
'标志';

insert into tsys_employee
  (fempguid, fognguid, fposguid, fid, fcaption, fname, fpassword, fislogin, fzzzt, fcreatetime, fupdatetime, fuserid, fuserguid, forganizationalguid, fflag)
values
  (sys_guid(), 'A753205F97944B4BB68C638CDB3A2C8E', '55003E6C81F449129E29B16671DBB82C', '00000', '管理员','admin','admin',1, 1, sysdate, sysdate, '000000', sys_guid(), sys_guid(), 1);

create index "Relationship_1_FK" on "TSYS_Employee" (
   "FOgnGUID" ASC
);

create index "Relationship_2_FK" on "TSYS_Employee" (
   "FPosGUID" ASC
);

create table "TSYS_Function"  (
   FUNCGUID             VARCHAR2(32)                    not null,
   "FMenuGUID"          VARCHAR2(32),
   FID                  VARCHAR2(20),
   "FName"              VARCHAR2(20),
   "FCaption"           VARCHAR2(18),
   FCREATETIME          DATE                           default SYSDATE,
   FUPDATETIME          DATE                           default SYSDATE,
   FUSERID              VARCHAR2(32)                   default NULL,
   FUSERGUID            VARCHAR2(32),
   "FOrganizationalGUID" VARCHAR2(32),
   "FFlag"              SMALLINT                       default 1,
   constraint PK_TSYS_FUNCTION primary key (FUNCGUID)
);

comment on table "TSYS_Function" is
'功能表';

comment on column "TSYS_Function".FUNCGUID is
'功能GUID';

comment on column "TSYS_Function"."FMenuGUID" is
'菜单GUID';

comment on column "TSYS_Function".FID is
'编号';

comment on column "TSYS_Function"."FName" is
'名称';

comment on column "TSYS_Function"."FCaption" is
'中文名称';

comment on column "TSYS_Function".FCREATETIME is
'创建时间';

comment on column "TSYS_Function".FUPDATETIME is
'更新时间';

comment on column "TSYS_Function".FUSERID is
'用户ID';

comment on column "TSYS_Function".FUSERGUID is
'用户GUID';

comment on column "TSYS_Function"."FOrganizationalGUID" is
'组织机构GUID';

comment on column "TSYS_Function"."FFlag" is
'标志';

create index "Relationship_4_FK" on "TSYS_Function" (
   "FMenuGUID" ASC
);

create table "TSYS_Menus"  (
   "FMenuGUID"          VARCHAR2(32)                    not null,
   "FParentGUID"        VARCHAR2(32)                    not null,
   FID                  VARCHAR2(20),
   "FName"              VARCHAR2(20),
   "FCaption"           VARCHAR2(18),
   "FOrderNo"           SMALLINT,
   "FAModuleName"       VARCHAR2(30),
   "FFlag"              SMALLINT                       default 1,
   FCREATETIME          DATE                           default SYSDATE not null,
   FUPDATETIME          DATE                           default SYSDATE not null,
   FUSERID              VARCHAR2(32)                   default NULL not null,
   FUSERGUID            VARCHAR2(32)                    not null,
   "FOrganizationalGUID" VARCHAR2(32)                    not null,
   constraint PK_TSYS_MENUS primary key ("FMenuGUID")
);

comment on table "TSYS_Menus" is
'菜单表';

comment on column "TSYS_Menus"."FMenuGUID" is
'菜单GUID';

comment on column "TSYS_Menus"."FParentGUID" is
'父ID';

comment on column "TSYS_Menus".FID is
'编号';

comment on column "TSYS_Menus"."FName" is
'名称';

comment on column "TSYS_Menus"."FCaption" is
'中文名称';

comment on column "TSYS_Menus"."FOrderNo" is
'序号';

comment on column "TSYS_Menus"."FAModuleName" is
'模块名称';

comment on column "TSYS_Menus"."FFlag" is
'标志';

comment on column "TSYS_Menus".FCREATETIME is
'创建时间';

comment on column "TSYS_Menus".FUPDATETIME is
'更新时间';

comment on column "TSYS_Menus".FUSERID is
'用户ID';

comment on column "TSYS_Menus".FUSERGUID is
'用户GUID';

comment on column "TSYS_Menus"."FOrganizationalGUID" is
'组织机构GUID';

create table "TSYS_Organizational"  (
   "FOgnGUID"           VARCHAR2(32)                    not null,
   "FParentGUID"        VARCHAR2(32),
   FID                  VARCHAR2(20),
   "FName"              VARCHAR2(20),
   "FCaption"           VARCHAR2(18),
   FCREATETIME          DATE                           default SYSDATE not null,
   FUPDATETIME          DATE                           default SYSDATE not null,
   FUSERID              VARCHAR2(32)                   default NULL not null,
   FUSERGUID            VARCHAR2(32)                    not null,
   "FOrganizationalGUID" VARCHAR2(32)                    not null,
   "FFlag"              SMALLINT                       default 1,
   constraint PK_TSYS_ORGANIZATIONAL primary key ("FOgnGUID")
);

comment on table "TSYS_Organizational" is
'组织机构表';

comment on column "TSYS_Organizational"."FOgnGUID" is
'机构GUID';

comment on column "TSYS_Organizational"."FParentGUID" is
'父ID';

comment on column "TSYS_Organizational".FID is
'编号';

comment on column "TSYS_Organizational"."FName" is
'名称';

comment on column "TSYS_Organizational"."FCaption" is
'中文名称';

comment on column "TSYS_Organizational".FCREATETIME is
'创建时间';

comment on column "TSYS_Organizational".FUPDATETIME is
'更新时间';

comment on column "TSYS_Organizational".FUSERID is
'用户ID';

comment on column "TSYS_Organizational".FUSERGUID is
'用户GUID';

comment on column "TSYS_Organizational"."FOrganizationalGUID" is
'组织机构GUID';

comment on column "TSYS_Organizational"."FFlag" is
'标志';

insert into tsys_organizational
  (fognguid, fparentguid, fid, fname, fcaption, fcreatetime, fupdatetime, fuserid, fuserguid, forganizationalguid, fflag)
values
  ('A753205F97944B4BB68C638CDB3A2C8E','7D2BE191289047F0BF57ADA4F7CDF04D','000001', 'office', '总经理办公室', sysDate, sysDate, sys_guid(), sys_guid(), sys_guid(), 1);

create table "TSYS_PosPurviews"  (
   "FpmGUID"            VARCHAR2(32)                    not null,
   "FPosGUID"           VARCHAR2(32)                    not null,
   FCREATETIME          DATE                           default SYSDATE not null,
   FUPDATETIME          DATE                           default SYSDATE not null,
   FUSERID              VARCHAR2(32)                   default NULL not null,
   "FOrganizationalGUID" VARCHAR2(32)                    not null
);

comment on table "TSYS_PosPurviews" is
'岗位权限表';

comment on column "TSYS_PosPurviews"."FpmGUID" is
'权限菜单GUID';

comment on column "TSYS_PosPurviews"."FPosGUID" is
'岗位GUID';

comment on column "TSYS_PosPurviews".FCREATETIME is
'创建时间';

comment on column "TSYS_PosPurviews".FUPDATETIME is
'更新时间';

comment on column "TSYS_PosPurviews".FUSERID is
'用户ID';

comment on column "TSYS_PosPurviews"."FOrganizationalGUID" is
'组织机构GUID';

create index "Relationship_7_FK" on "TSYS_PosPurviews" (
   "FPosGUID" ASC
);

create index "Relationship_8_FK" on "TSYS_PosPurviews" (
   "FpmGUID" ASC
);

--
create table "TSYS_Position"  (
   "FPosGUID"           VARCHAR2(32)                    not null,
   "FParentGUID"        VARCHAR2(32),
   "FCaption"           VARCHAR2(18),
   "FName"              VARCHAR2(20),
   FCREATETIME          DATE                           default SYSDATE not null,
   FUPDATETIME          DATE                           default SYSDATE not null,
   FUSERID              VARCHAR2(32)                   default NULL not null,
   FUSERGUID            VARCHAR2(32)                    not null,
   "FOrganizationalGUID" VARCHAR2(32)                    not null,
   "FFlag"              SMALLINT                       default 1,
   constraint PK_TSYS_POSITION primary key ("FPosGUID")
);

comment on table "TSYS_Position" is
'岗位表';

comment on column "TSYS_Position"."FPosGUID" is
'岗位GUID';

comment on column "TSYS_Position"."FParentGUID" is
'父ID';

comment on column "TSYS_Position"."FCaption" is
'中文名称';

comment on column "TSYS_Position"."FName" is
'名称';

comment on column "TSYS_Position".FCREATETIME is
'创建时间';

comment on column "TSYS_Position".FUPDATETIME is
'更新时间';

comment on column "TSYS_Position".FUSERID is
'用户ID';

comment on column "TSYS_Position".FUSERGUID is
'用户GUID';

comment on column "TSYS_Position"."FOrganizationalGUID" is
'组织机构GUID';

comment on column "TSYS_Position"."FFlag" is
'标志';

insert into tsys_position
  (fposguid, fparentguid, fcaption, fname, fcreatetime, fupdatetime, fuserid, fuserguid, forganizationalguid, fflag)
values
  ('55003E6C81F449129E29B16671DBB82C','46A67692E7A446558F58BE555F9038FE','超级管理员','管理员',sysdate, sysdate, sys_guid(), sys_guid(), sys_guid(), 1);

create table "TSYS_PurMenus"  (
   "FpmGUID"            VARCHAR2(32)                    not null,
   "FMenuGUID"          VARCHAR2(32),
   FUNCGUID             VARCHAR2(32),
   FCREATETIME          DATE                           default SYSDATE not null,
   FUSERGUID            VARCHAR2(32)                    not null,
   FUSERID              VARCHAR2(32)                   default NULL not null,
   "FOrganizationalGUID" VARCHAR2(32)                    not null,
   "FEnabled"           SMALLINT,
   "FVisibled"          SMALLINT,
   "FFlag"              SMALLINT                       default 1,
   constraint PK_TSYS_PURMENUS primary key ("FpmGUID")
);

comment on table "TSYS_PurMenus" is
'权限菜单表';

comment on column "TSYS_PurMenus"."FpmGUID" is
'权限菜单GUID';

comment on column "TSYS_PurMenus"."FMenuGUID" is
'菜单GUID';

comment on column "TSYS_PurMenus".FUNCGUID is
'功能GUID';

comment on column "TSYS_PurMenus".FCREATETIME is
'创建时间';

comment on column "TSYS_PurMenus".FUSERGUID is
'用户GUID';

comment on column "TSYS_PurMenus".FUSERID is
'用户ID';

comment on column "TSYS_PurMenus"."FOrganizationalGUID" is
'组织机构GUID';

comment on column "TSYS_PurMenus"."FEnabled" is
'使用';

comment on column "TSYS_PurMenus"."FVisibled" is
'显示';

comment on column "TSYS_PurMenus"."FFlag" is
'标志';

create index "Relationship_9_FK" on "TSYS_PurMenus" (
   FUNCGUID ASC
);

create index "Relationship_10_FK" on "TSYS_PurMenus" (
   "FMenuGUID" ASC
);

create table "TSYS_Tables"  (
   "FTabGUID"           VARCHAR2(32)                    not null,
   "FName"              VARCHAR2(20),
   "FCaption"           VARCHAR2(18),
   FCREATETIME          DATE                           default SYSDATE not null,
   FUPDATETIME          DATE                           default SYSDATE not null,
   FUSERID              VARCHAR2(32)                   default NULL not null,
   FUSERGUID            VARCHAR2(32)                    not null,
   "FOrganizationalGUID" VARCHAR2(32)                    not null,
   "FFlag"              SMALLINT                       default 1,
   constraint PK_TSYS_TABLES primary key ("FTabGUID")
);

comment on table "TSYS_Tables" is
'表集合';

comment on column "TSYS_Tables"."FTabGUID" is
'表GUID';

comment on column "TSYS_Tables"."FName" is
'名称';

comment on column "TSYS_Tables"."FCaption" is
'中文名称';

comment on column "TSYS_Tables".FCREATETIME is
'创建时间';

comment on column "TSYS_Tables".FUPDATETIME is
'更新时间';

comment on column "TSYS_Tables".FUSERID is
'用户ID';

comment on column "TSYS_Tables".FUSERGUID is
'用户GUID';

comment on column "TSYS_Tables"."FOrganizationalGUID" is
'组织机构GUID';

comment on column "TSYS_Tables"."FFlag" is
'标志';

alter table "TSYS_Columns"
   add constraint FK_TSYS_COL_RELATIONS_TSYS_TAB foreign key ("FTabGUID")
      references "TSYS_Tables" ("FTabGUID");

alter table "TSYS_Employee"
   add constraint FK_TSYS_EMP_RELATIONS_TSYS_ORG foreign key ("FOgnGUID")
      references "TSYS_Organizational" ("FOgnGUID");

alter table "TSYS_Employee"
   add constraint FK_TSYS_EMP_RELATIONS_TSYS_POS foreign key ("FPosGUID")
      references "TSYS_Position" ("FPosGUID");

alter table "TSYS_Function"
   add constraint FK_TSYS_FUN_RELATIONS_TSYS_MEN foreign key ("FMenuGUID")
      references "TSYS_Menus" ("FMenuGUID");

alter table "TSYS_PosPurviews"
   add constraint FK_TSYS_POS_RELATIONS_TSYS_POS foreign key ("FPosGUID")
      references "TSYS_Position" ("FPosGUID");

alter table "TSYS_PosPurviews"
   add constraint FK_TSYS_POS_RELATIONS_TSYS_PUR foreign key ("FpmGUID")
      references "TSYS_PurMenus" ("FpmGUID");

alter table "TSYS_PurMenus"
   add constraint FK_TSYS_PUR_RELATIONS_TSYS_MEN foreign key ("FMenuGUID")
      references "TSYS_Menus" ("FMenuGUID");

alter table "TSYS_PurMenus"
   add constraint FK_TSYS_PUR_RELATIONS_TSYS_FUN foreign key (FUNCGUID)
      references "TSYS_Function" (FUNCGUID);

