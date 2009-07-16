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
'��˾��Ϣ';

comment on column "Company"."FCompanyGUID" is
'��˾GUID';

comment on column "Company"."FIncorporator" is
'���˴���';

comment on column "Company"."FQuality" is
'��˾����';

comment on column "Company"."FFunding" is
'ע���ʽ�';

comment on column "Company"."FAddress" is
'��ַ';

comment on column "Company"."FCaption" is
'��������';

comment on column "Company"."FName" is
'����';

comment on column "Company".FCREATETIME is
'����ʱ��';

comment on column "Company".FUPDATETIME is
'����ʱ��';

insert into company(fcompanyguid, 
                    fincorporator, 
                    fquality, 
                    ffunding, 
                    faddress, 
                    fcaption, 
                    fname, 
                    fcreatetime, 
                    fupdatetime) values(sys_guid(),'����','˽Ӫ',200,'XXXʡXX��XXX��˾','������Ϣ�������޹�˾','�����Ƽ�',sysdate,sysdate);

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
'ģ���';

comment on column "Modals"."FModalGUID" is
'ģ��GUID';

comment on column "Modals".FID is
'���';

comment on column "Modals"."FName" is
'����';

comment on column "Modals"."FCaption" is
'��������';

comment on column "Modals"."FFileName" is
'�ļ���';

comment on column "Modals"."Functioning" is
'����';

comment on column "Modals"."FFlag" is
'��־';

comment on column "Modals".FCREATETIME is
'����ʱ��';

comment on column "Modals".FUSERGUID is
'�û�GUID';

comment on column "Modals".FUSERID is
'�û�ID';

comment on column "Modals"."FOrganizationalGUID" is
'��֯����GUID';

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
'�ֵ�';

comment on column TBASE_DICT.FDGUID is
'�ֵ�GUID';

comment on column TBASE_DICT."FParentGUID" is
'��ID';

comment on column TBASE_DICT.FID is
'���';

comment on column TBASE_DICT."FName" is
'����';

comment on column TBASE_DICT."FCaption" is
'��������';

comment on column TBASE_DICT.FCREATETIME is
'����ʱ��';

comment on column TBASE_DICT.FUPDATETIME is
'����ʱ��';

comment on column TBASE_DICT.FUSERGUID is
'�û�GUID';

comment on column TBASE_DICT.FUSERID is
'�û�ID';

comment on column TBASE_DICT."FOrganizationalGUID" is
'��֯����GUID';

comment on column TBASE_DICT."FFlag" is
'��־';

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
'�м���';

comment on column "TSYS_Columns"."FColID" is
'��GUID';

comment on column "TSYS_Columns"."FTabGUID" is
'��GUID';

comment on column "TSYS_Columns"."FName" is
'����';

comment on column "TSYS_Columns"."FCaption" is
'��������';

comment on column "TSYS_Columns".FCREATETIME is
'����ʱ��';

comment on column "TSYS_Columns".FUPDATETIME is
'����ʱ��';

comment on column "TSYS_Columns".FUSERID is
'�û�ID';

comment on column "TSYS_Columns".FUSERGUID is
'�û�GUID';

comment on column "TSYS_Columns"."FOrganizationalGUID" is
'��֯����GUID';

comment on column "TSYS_Columns"."FFlag" is
'��־';

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
'��Ա��';

comment on column "TSYS_Employee"."FEmpGUID" is
'�û�FGUID';

comment on column "TSYS_Employee"."FOgnGUID" is
'����GUID';

comment on column "TSYS_Employee"."FPosGUID" is
'��λGUID';

comment on column "TSYS_Employee".FID is
'���';

comment on column "TSYS_Employee"."FCaption" is
'��������';

comment on column "TSYS_Employee"."FName" is
'����';

comment on column "TSYS_Employee"."FPassWord" is
'����';

comment on column "TSYS_Employee"."FisLogin" is
'�����½';

comment on column "TSYS_Employee".FZZZT is
'��ְ״̬';

comment on column "TSYS_Employee".FCREATETIME is
'����ʱ��';

comment on column "TSYS_Employee".FUPDATETIME is
'����ʱ��';

comment on column "TSYS_Employee".FUSERID is
'�û�ID';

comment on column "TSYS_Employee".FUSERGUID is
'�û�GUID';

comment on column "TSYS_Employee"."FOrganizationalGUID" is
'��֯����GUID';

comment on column "TSYS_Employee"."FFlag" is
'��־';

insert into tsys_employee
  (fempguid, fognguid, fposguid, fid, fcaption, fname, fpassword, fislogin, fzzzt, fcreatetime, fupdatetime, fuserid, fuserguid, forganizationalguid, fflag)
values
  (sys_guid(), 'A753205F97944B4BB68C638CDB3A2C8E', '55003E6C81F449129E29B16671DBB82C', '00000', '����Ա','admin','admin',1, 1, sysdate, sysdate, '000000', sys_guid(), sys_guid(), 1);

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
'���ܱ�';

comment on column "TSYS_Function".FUNCGUID is
'����GUID';

comment on column "TSYS_Function"."FMenuGUID" is
'�˵�GUID';

comment on column "TSYS_Function".FID is
'���';

comment on column "TSYS_Function"."FName" is
'����';

comment on column "TSYS_Function"."FCaption" is
'��������';

comment on column "TSYS_Function".FCREATETIME is
'����ʱ��';

comment on column "TSYS_Function".FUPDATETIME is
'����ʱ��';

comment on column "TSYS_Function".FUSERID is
'�û�ID';

comment on column "TSYS_Function".FUSERGUID is
'�û�GUID';

comment on column "TSYS_Function"."FOrganizationalGUID" is
'��֯����GUID';

comment on column "TSYS_Function"."FFlag" is
'��־';

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
'�˵���';

comment on column "TSYS_Menus"."FMenuGUID" is
'�˵�GUID';

comment on column "TSYS_Menus"."FParentGUID" is
'��ID';

comment on column "TSYS_Menus".FID is
'���';

comment on column "TSYS_Menus"."FName" is
'����';

comment on column "TSYS_Menus"."FCaption" is
'��������';

comment on column "TSYS_Menus"."FOrderNo" is
'���';

comment on column "TSYS_Menus"."FAModuleName" is
'ģ������';

comment on column "TSYS_Menus"."FFlag" is
'��־';

comment on column "TSYS_Menus".FCREATETIME is
'����ʱ��';

comment on column "TSYS_Menus".FUPDATETIME is
'����ʱ��';

comment on column "TSYS_Menus".FUSERID is
'�û�ID';

comment on column "TSYS_Menus".FUSERGUID is
'�û�GUID';

comment on column "TSYS_Menus"."FOrganizationalGUID" is
'��֯����GUID';

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
'��֯������';

comment on column "TSYS_Organizational"."FOgnGUID" is
'����GUID';

comment on column "TSYS_Organizational"."FParentGUID" is
'��ID';

comment on column "TSYS_Organizational".FID is
'���';

comment on column "TSYS_Organizational"."FName" is
'����';

comment on column "TSYS_Organizational"."FCaption" is
'��������';

comment on column "TSYS_Organizational".FCREATETIME is
'����ʱ��';

comment on column "TSYS_Organizational".FUPDATETIME is
'����ʱ��';

comment on column "TSYS_Organizational".FUSERID is
'�û�ID';

comment on column "TSYS_Organizational".FUSERGUID is
'�û�GUID';

comment on column "TSYS_Organizational"."FOrganizationalGUID" is
'��֯����GUID';

comment on column "TSYS_Organizational"."FFlag" is
'��־';

insert into tsys_organizational
  (fognguid, fparentguid, fid, fname, fcaption, fcreatetime, fupdatetime, fuserid, fuserguid, forganizationalguid, fflag)
values
  ('A753205F97944B4BB68C638CDB3A2C8E','7D2BE191289047F0BF57ADA4F7CDF04D','000001', 'office', '�ܾ���칫��', sysDate, sysDate, sys_guid(), sys_guid(), sys_guid(), 1);

create table "TSYS_PosPurviews"  (
   "FpmGUID"            VARCHAR2(32)                    not null,
   "FPosGUID"           VARCHAR2(32)                    not null,
   FCREATETIME          DATE                           default SYSDATE not null,
   FUPDATETIME          DATE                           default SYSDATE not null,
   FUSERID              VARCHAR2(32)                   default NULL not null,
   "FOrganizationalGUID" VARCHAR2(32)                    not null
);

comment on table "TSYS_PosPurviews" is
'��λȨ�ޱ�';

comment on column "TSYS_PosPurviews"."FpmGUID" is
'Ȩ�޲˵�GUID';

comment on column "TSYS_PosPurviews"."FPosGUID" is
'��λGUID';

comment on column "TSYS_PosPurviews".FCREATETIME is
'����ʱ��';

comment on column "TSYS_PosPurviews".FUPDATETIME is
'����ʱ��';

comment on column "TSYS_PosPurviews".FUSERID is
'�û�ID';

comment on column "TSYS_PosPurviews"."FOrganizationalGUID" is
'��֯����GUID';

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
'��λ��';

comment on column "TSYS_Position"."FPosGUID" is
'��λGUID';

comment on column "TSYS_Position"."FParentGUID" is
'��ID';

comment on column "TSYS_Position"."FCaption" is
'��������';

comment on column "TSYS_Position"."FName" is
'����';

comment on column "TSYS_Position".FCREATETIME is
'����ʱ��';

comment on column "TSYS_Position".FUPDATETIME is
'����ʱ��';

comment on column "TSYS_Position".FUSERID is
'�û�ID';

comment on column "TSYS_Position".FUSERGUID is
'�û�GUID';

comment on column "TSYS_Position"."FOrganizationalGUID" is
'��֯����GUID';

comment on column "TSYS_Position"."FFlag" is
'��־';

insert into tsys_position
  (fposguid, fparentguid, fcaption, fname, fcreatetime, fupdatetime, fuserid, fuserguid, forganizationalguid, fflag)
values
  ('55003E6C81F449129E29B16671DBB82C','46A67692E7A446558F58BE555F9038FE','��������Ա','����Ա',sysdate, sysdate, sys_guid(), sys_guid(), sys_guid(), 1);

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
'Ȩ�޲˵���';

comment on column "TSYS_PurMenus"."FpmGUID" is
'Ȩ�޲˵�GUID';

comment on column "TSYS_PurMenus"."FMenuGUID" is
'�˵�GUID';

comment on column "TSYS_PurMenus".FUNCGUID is
'����GUID';

comment on column "TSYS_PurMenus".FCREATETIME is
'����ʱ��';

comment on column "TSYS_PurMenus".FUSERGUID is
'�û�GUID';

comment on column "TSYS_PurMenus".FUSERID is
'�û�ID';

comment on column "TSYS_PurMenus"."FOrganizationalGUID" is
'��֯����GUID';

comment on column "TSYS_PurMenus"."FEnabled" is
'ʹ��';

comment on column "TSYS_PurMenus"."FVisibled" is
'��ʾ';

comment on column "TSYS_PurMenus"."FFlag" is
'��־';

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
'����';

comment on column "TSYS_Tables"."FTabGUID" is
'��GUID';

comment on column "TSYS_Tables"."FName" is
'����';

comment on column "TSYS_Tables"."FCaption" is
'��������';

comment on column "TSYS_Tables".FCREATETIME is
'����ʱ��';

comment on column "TSYS_Tables".FUPDATETIME is
'����ʱ��';

comment on column "TSYS_Tables".FUSERID is
'�û�ID';

comment on column "TSYS_Tables".FUSERGUID is
'�û�GUID';

comment on column "TSYS_Tables"."FOrganizationalGUID" is
'��֯����GUID';

comment on column "TSYS_Tables"."FFlag" is
'��־';

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

