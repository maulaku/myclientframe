/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     2009-7-26 23:10:16                           */
/*==============================================================*/


alter table TSYS_Columns
   drop constraint FK_TSYS_COL_RELATIONS_TSYS_TAB;

alter table TSYS_Function
   drop constraint FK_TSYS_FUN_RELATIONS_TSYS_MEN;

alter table TSYS_PosPurviews
   drop constraint FK_TSYS_POS_RELATIONS_TSYS_POS;

alter table TSYS_PosPurviews
   drop constraint FK_TSYS_POS_RELATIONS_TSYS_PUR;

alter table TSYS_PurMenus
   drop constraint FK_TSYS_PUR_RELATIONS_TSYS_MEN;

alter table TSYS_PurMenus
   drop constraint FK_TSYS_PUR_RELATIONS_TSYS_FUN;

drop table Company cascade constraints;

drop table Modals cascade constraints;

drop table TBASE_DICT cascade constraints;

drop index Relationship_3_FK;

drop table TSYS_Columns cascade constraints;

drop index Relationship_2_FK;

drop index Relationship_1_FK;

drop table TSYS_Employee cascade constraints;

drop index Relationship_4_FK;

drop table TSYS_Function cascade constraints;

drop table TSYS_Menus cascade constraints;

drop table TSYS_Organizational cascade constraints;

drop index Relationship_8_FK;

drop index Relationship_7_FK;

drop table TSYS_PosPurviews cascade constraints;

drop table TSYS_Position cascade constraints;

drop index Relationship_10_FK;

drop index Relationship_9_FK;

drop table TSYS_PurMenus cascade constraints;

drop table TSYS_Tables cascade constraints;

/*==============================================================*/
/* Table: Company                                               */
/*==============================================================*/
create table Company  (
   CompanyGUID          VARCHAR2(32)                    not null,
   Incorporator         VARCHAR2(20),
   Quality              VARCHAR2(20),
   Funding              NUMBER(20),
   Address              VARCHAR2(100),
   Caption              VARCHAR2(100),
   Name                 VARCHAR2(20),
   CREATETIME           DATE                           default SYSDATE,
   UPDATETIME           DATE                           default SYSDATE,
   constraint PK_COMPANY primary key (CompanyGUID)
);

comment on table Company is
'公司信息';

comment on column Company.CompanyGUID is
'公司GUID';

comment on column Company.Incorporator is
'法人代表';

comment on column Company.Quality is
'公司性质';

comment on column Company.Funding is
'注册资金';

comment on column Company.Address is
'地址';

comment on column Company.Caption is
'中文名称';

comment on column Company.Name is
'名称';

comment on column Company.CREATETIME is
'创建时间';

comment on column Company.UPDATETIME is
'更新时间';

insert into company(companyguid, 
                    incorporator, 
                    quality, 
                    funding, 
                    address, 
                    caption, 
                    name, 
                    createtime, 
                    updatetime) values(sys_guid(),'张三','私营',200,'XXX省XX市XXX公司','动力信息技术有限公司','动力科技',sysdate,sysdate);

/*==============================================================*/
/* Table: Modals                                                */
/*==============================================================*/
create table Modals  (
   ModalGUID            VARCHAR2(80)                    not null,
   ID                   VARCHAR2(20),
   Name                 VARCHAR2(20),
   Caption              VARCHAR2(100),
   FileName             CHAR(10),
   Functioning          BLOB,
   Flag                 SMALLINT                       default 1,
   CREATETIME           DATE                           default SYSDATE,
   USERGUID             VARCHAR2(32),
   USERID               VARCHAR2(32)                   default NULL,
   OrganizationalGUID   VARCHAR2(32),
   constraint PK_MODALS primary key (ModalGUID)
);

comment on table Modals is
'模块表';

comment on column Modals.ModalGUID is
'模块GUID';

comment on column Modals.ID is
'编号';

comment on column Modals.Name is
'名称';

comment on column Modals.Caption is
'中文名称';

comment on column Modals.FileName is
'文件名';

comment on column Modals.Functioning is
'功能';

comment on column Modals.Flag is
'标志';

comment on column Modals.CREATETIME is
'创建时间';

comment on column Modals.USERGUID is
'用户GUID';

comment on column Modals.USERID is
'用户ID';

comment on column Modals.OrganizationalGUID is
'组织机构GUID';

/*==============================================================*/
/* Table: TBASE_DICT                                            */
/*==============================================================*/
create table TBASE_DICT  (
   DGUID                VARCHAR2(32)                    not null,
   ParentGUID           VARCHAR2(32),
   ID                   VARCHAR2(20),
   Name                 VARCHAR2(20),
   Caption              VARCHAR2(100),
   CREATETIME           DATE                           default SYSDATE,
   UPDATETIME           DATE                           default SYSDATE,
   USERGUID             VARCHAR2(32),
   USERID               VARCHAR2(32)                   default NULL,
   OrganizationalGUID   VARCHAR2(32),
   Flag                 SMALLINT                       default 1,
   constraint PK_TBASE_DICT primary key (DGUID)
);

comment on table TBASE_DICT is
'字典';

comment on column TBASE_DICT.DGUID is
'字典GUID';

comment on column TBASE_DICT.ParentGUID is
'父ID';

comment on column TBASE_DICT.ID is
'编号';

comment on column TBASE_DICT.Name is
'名称';

comment on column TBASE_DICT.Caption is
'中文名称';

comment on column TBASE_DICT.CREATETIME is
'创建时间';

comment on column TBASE_DICT.UPDATETIME is
'更新时间';

comment on column TBASE_DICT.USERGUID is
'用户GUID';

comment on column TBASE_DICT.USERID is
'用户ID';

comment on column TBASE_DICT.OrganizationalGUID is
'组织机构GUID';

comment on column TBASE_DICT.Flag is
'标志';

/*==============================================================*/
/* Table: TSYS_Columns                                          */
/*==============================================================*/
create table TSYS_Columns  (
   ColID                VARCHAR2(32)                    not null,
   TabGUID              VARCHAR2(32)                    not null,
   Name                 VARCHAR2(20),
   Caption              VARCHAR2(100),
   CREATETIME           DATE                           default SYSDATE not null,
   UPDATETIME           DATE                           default SYSDATE not null,
   USERID               VARCHAR2(32)                   default NULL not null,
   USERGUID             VARCHAR2(32)                    not null,
   OrganizationalGUID   VARCHAR2(32)                    not null,
   Flag                 SMALLINT                       default 1,
   constraint PK_TSYS_COLUMNS primary key (ColID)
);

comment on table TSYS_Columns is
'列集合';

comment on column TSYS_Columns.ColID is
'列GUID';

comment on column TSYS_Columns.TabGUID is
'表GUID';

comment on column TSYS_Columns.Name is
'名称';

comment on column TSYS_Columns.Caption is
'中文名称';

comment on column TSYS_Columns.CREATETIME is
'创建时间';

comment on column TSYS_Columns.UPDATETIME is
'更新时间';

comment on column TSYS_Columns.USERID is
'用户ID';

comment on column TSYS_Columns.USERGUID is
'用户GUID';

comment on column TSYS_Columns.OrganizationalGUID is
'组织机构GUID';

comment on column TSYS_Columns.Flag is
'标志';

/*==============================================================*/
/* Index: Relationship_3_FK                                     */
/*==============================================================*/
create index Relationship_3_FK on TSYS_Columns (
   TabGUID ASC
);

/*==============================================================*/
/* Table: TSYS_Employee                                         */
/*==============================================================*/
create table TSYS_Employee  (
   empGUID              VARCHAR2(32)                    not null,
   OgnGUID              VARCHAR2(32)                    not null,
   PosGUID              VARCHAR2(32)                    not null,
   ID                   VARCHAR2(20),
   Caption              VARCHAR2(100),
   Name                 VARCHAR2(20)                    not null,
   PassWord             VARCHAR2(18),
   isLogin              SMALLINT                       default 1,
   ZZZT                 SMALLINT                       default 1,
   CREATETIME           DATE                           default SYSDATE not null,
   UPDATETIME           DATE                           default SYSDATE not null,
   USERID               VARCHAR2(32)                   default NULL not null,
   USERGUID             VARCHAR2(32)                    not null,
   OrganizationalGUID   VARCHAR2(32)                    not null,
   Flag                 SMALLINT                       default 1,
   constraint PK_TSYS_EMPLOYEE primary key (empGUID)
);

comment on table TSYS_Employee is
'人员表';

comment on column TSYS_Employee.empGUID is
'用户FGUID';

comment on column TSYS_Employee.OgnGUID is
'机构GUID';

comment on column TSYS_Employee.PosGUID is
'岗位GUID';

comment on column TSYS_Employee.ID is
'编号';

comment on column TSYS_Employee.Caption is
'中文名称';

comment on column TSYS_Employee.Name is
'名称';

comment on column TSYS_Employee.PassWord is
'口令';

comment on column TSYS_Employee.isLogin is
'允许登陆';

comment on column TSYS_Employee.ZZZT is
'在职状态';

comment on column TSYS_Employee.CREATETIME is
'创建时间';

comment on column TSYS_Employee.UPDATETIME is
'更新时间';

comment on column TSYS_Employee.USERID is
'用户ID';

comment on column TSYS_Employee.USERGUID is
'用户GUID';

comment on column TSYS_Employee.OrganizationalGUID is
'组织机构GUID';

comment on column TSYS_Employee.Flag is
'标志';

insert into tsys_employee
  (empguid, ognguid, posguid, id, caption, name, password, islogin, zzzt, createtime, updatetime, userid, userguid, organizationalguid, flag)
values
  (sys_guid(), 'A753205F97944B4BB68C638CDB3A2C8E', '55003E6C81F449129E29B16671DBB82C', '00000', '管理员','admin','admin',1, 1, sysdate, sysdate, '000000', sys_guid(), sys_guid(), 1);

/*==============================================================*/
/* Index: Relationship_1_FK                                     */
/*==============================================================*/
create index Relationship_1_FK on TSYS_Employee (
   OgnGUID ASC
);

/*==============================================================*/
/* Index: Relationship_2_FK                                     */
/*==============================================================*/
create index Relationship_2_FK on TSYS_Employee (
   PosGUID ASC
);

/*==============================================================*/
/* Table: TSYS_Function                                         */
/*==============================================================*/
create table TSYS_Function  (
   UNCGUID              VARCHAR2(32)                    not null,
   MenuGUID             VARCHAR2(32),
   ID                   VARCHAR2(20),
   Name                 VARCHAR2(20),
   Caption              VARCHAR2(100),
   CREATETIME           DATE                           default SYSDATE,
   UPDATETIME           DATE                           default SYSDATE,
   USERID               VARCHAR2(32)                   default NULL,
   USERGUID             VARCHAR2(32),
   OrganizationalGUID   VARCHAR2(32),
   Flag                 SMALLINT                       default 1,
   constraint PK_TSYS_FUNCTION primary key (UNCGUID)
);

comment on table TSYS_Function is
'功能表';

comment on column TSYS_Function.UNCGUID is
'功能GUID';

comment on column TSYS_Function.MenuGUID is
'菜单GUID';

comment on column TSYS_Function.ID is
'编号';

comment on column TSYS_Function.Name is
'名称';

comment on column TSYS_Function.Caption is
'中文名称';

comment on column TSYS_Function.CREATETIME is
'创建时间';

comment on column TSYS_Function.UPDATETIME is
'更新时间';

comment on column TSYS_Function.USERID is
'用户ID';

comment on column TSYS_Function.USERGUID is
'用户GUID';

comment on column TSYS_Function.OrganizationalGUID is
'组织机构GUID';

comment on column TSYS_Function.Flag is
'标志';

/*==============================================================*/
/* Index: Relationship_4_FK                                     */
/*==============================================================*/
create index Relationship_4_FK on TSYS_Function (
   MenuGUID ASC
);

/*==============================================================*/
/* Table: TSYS_Menus                                            */
/*==============================================================*/
create table TSYS_Menus  (
   MenuGUID             VARCHAR2(32)                    not null,
   ParentGUID           VARCHAR2(32)                    not null,
   ID                   VARCHAR2(20),
   Name                 VARCHAR2(20),
   Caption              VARCHAR2(100),
   OrderNo              SMALLINT,
   AModuleName          VARCHAR2(30),
   Flag                 SMALLINT                       default 1,
   CREATETIME           DATE                           default SYSDATE not null,
   UPDATETIME           DATE                           default SYSDATE not null,
   USERID               VARCHAR2(32)                   default NULL not null,
   USERGUID             VARCHAR2(32)                    not null,
   OrganizationalGUID   VARCHAR2(32)                    not null,
   constraint PK_TSYS_MENUS primary key (MenuGUID)
);

comment on table TSYS_Menus is
'菜单表';

comment on column TSYS_Menus.MenuGUID is
'菜单GUID';

comment on column TSYS_Menus.ParentGUID is
'父ID';

comment on column TSYS_Menus.ID is
'编号';

comment on column TSYS_Menus.Name is
'名称';

comment on column TSYS_Menus.Caption is
'中文名称';

comment on column TSYS_Menus.OrderNo is
'序号';

comment on column TSYS_Menus.AModuleName is
'模块名称';

comment on column TSYS_Menus.Flag is
'标志';

comment on column TSYS_Menus.CREATETIME is
'创建时间';

comment on column TSYS_Menus.UPDATETIME is
'更新时间';

comment on column TSYS_Menus.USERID is
'用户ID';

comment on column TSYS_Menus.USERGUID is
'用户GUID';

comment on column TSYS_Menus.OrganizationalGUID is
'组织机构GUID';

/*==============================================================*/
/* Table: TSYS_Organizational                                   */
/*==============================================================*/
create table TSYS_Organizational  (
   OgnGUID              VARCHAR2(32)                    not null,
   ParentGUID           VARCHAR2(32),
   ID                   VARCHAR2(20),
   Name                 VARCHAR2(20),
   Caption              VARCHAR2(100),
   CREATETIME           DATE                           default SYSDATE not null,
   UPDATETIME           DATE                           default SYSDATE not null,
   USERID               VARCHAR2(32)                   default NULL not null,
   USERGUID             VARCHAR2(32)                    not null,
   OrganizationalGUID   VARCHAR2(32)                    not null,
   Flag                 SMALLINT                       default 1,
   constraint PK_TSYS_ORGANIZATIONAL primary key (OgnGUID)
);

comment on table TSYS_Organizational is
'组织机构表';

comment on column TSYS_Organizational.OgnGUID is
'机构GUID';

comment on column TSYS_Organizational.ParentGUID is
'父ID';

comment on column TSYS_Organizational.ID is
'编号';

comment on column TSYS_Organizational.Name is
'名称';

comment on column TSYS_Organizational.Caption is
'中文名称';

comment on column TSYS_Organizational.CREATETIME is
'创建时间';

comment on column TSYS_Organizational.UPDATETIME is
'更新时间';

comment on column TSYS_Organizational.USERID is
'用户ID';

comment on column TSYS_Organizational.USERGUID is
'用户GUID';

comment on column TSYS_Organizational.OrganizationalGUID is
'组织机构GUID';

comment on column TSYS_Organizational.Flag is
'标志';

insert into tsys_organizational
  (ognguid, parentguid, id, name, caption, createtime, updatetime, userid, userguid, organizationalguid, flag)
values
  ('A753205F97944B4BB68C638CDB3A2C8E','7D2BE191289047F0BF57ADA4F7CDF04D','000001', 'office', '总经理办公室', sysDate, sysDate, sys_guid(), sys_guid(), sys_guid(), 1);

/*==============================================================*/
/* Table: TSYS_PosPurviews                                      */
/*==============================================================*/
create table TSYS_PosPurviews  (
   epmGUID              VARCHAR2(32)                    not null,
   PosGUID              VARCHAR2(32)                    not null,
   CREATETIME           DATE                           default SYSDATE not null,
   UPDATETIME           DATE                           default SYSDATE not null,
   USERID               VARCHAR2(32)                   default NULL not null,
   OrganizationalGUID   VARCHAR2(32)                    not null
);

comment on table TSYS_PosPurviews is
'岗位权限表';

comment on column TSYS_PosPurviews.epmGUID is
'权限菜单GUID';

comment on column TSYS_PosPurviews.PosGUID is
'岗位GUID';

comment on column TSYS_PosPurviews.CREATETIME is
'创建时间';

comment on column TSYS_PosPurviews.UPDATETIME is
'更新时间';

comment on column TSYS_PosPurviews.USERID is
'用户ID';

comment on column TSYS_PosPurviews.OrganizationalGUID is
'组织机构GUID';

/*==============================================================*/
/* Index: Relationship_7_FK                                     */
/*==============================================================*/
create index Relationship_7_FK on TSYS_PosPurviews (
   PosGUID ASC
);

/*==============================================================*/
/* Index: Relationship_8_FK                                     */
/*==============================================================*/
create index Relationship_8_FK on TSYS_PosPurviews (
   epmGUID ASC
);

/*==============================================================*/
/* Table: TSYS_Position                                         */
/*==============================================================*/
--
create table TSYS_Position  (
   PosGUID              VARCHAR2(32)                    not null,
   ParentGUID           VARCHAR2(32),
   Caption              VARCHAR2(100),
   Name                 VARCHAR2(20),
   CREATETIME           DATE                           default SYSDATE not null,
   UPDATETIME           DATE                           default SYSDATE not null,
   USERID               VARCHAR2(32)                   default NULL not null,
   USERGUID             VARCHAR2(32)                    not null,
   OrganizationalGUID   VARCHAR2(32)                    not null,
   Flag                 SMALLINT                       default 1,
   constraint PK_TSYS_POSITION primary key (PosGUID)
);

comment on table TSYS_Position is
'岗位表';

comment on column TSYS_Position.PosGUID is
'岗位GUID';

comment on column TSYS_Position.ParentGUID is
'父ID';

comment on column TSYS_Position.Caption is
'中文名称';

comment on column TSYS_Position.Name is
'名称';

comment on column TSYS_Position.CREATETIME is
'创建时间';

comment on column TSYS_Position.UPDATETIME is
'更新时间';

comment on column TSYS_Position.USERID is
'用户ID';

comment on column TSYS_Position.USERGUID is
'用户GUID';

comment on column TSYS_Position.OrganizationalGUID is
'组织机构GUID';

comment on column TSYS_Position.Flag is
'标志';

insert into tsys_position
  (posguid, parentguid, caption, name, createtime, updatetime, userid, userguid, organizationalguid, flag)
values
  ('55003E6C81F449129E29B16671DBB82C','46A67692E7A446558F58BE555F9038FE','超级管理员','管理员',sysdate, sysdate, sys_guid(), sys_guid(), sys_guid(), 1);

/*==============================================================*/
/* Table: TSYS_PurMenus                                         */
/*==============================================================*/
create table TSYS_PurMenus  (
   epmGUID              VARCHAR2(32)                    not null,
   MenuGUID             VARCHAR2(32),
   UNCGUID              VARCHAR2(32),
   CREATETIME           DATE                           default SYSDATE not null,
   USERGUID             VARCHAR2(32)                    not null,
   USERID               VARCHAR2(32)                   default NULL not null,
   OrganizationalGUID   VARCHAR2(32)                    not null,
   Enabled              SMALLINT,
   Visibled             SMALLINT,
   Flag                 SMALLINT                       default 1,
   constraint PK_TSYS_PURMENUS primary key (epmGUID)
);

comment on table TSYS_PurMenus is
'权限菜单表';

comment on column TSYS_PurMenus.epmGUID is
'权限菜单GUID';

comment on column TSYS_PurMenus.MenuGUID is
'菜单GUID';

comment on column TSYS_PurMenus.UNCGUID is
'功能GUID';

comment on column TSYS_PurMenus.CREATETIME is
'创建时间';

comment on column TSYS_PurMenus.USERGUID is
'用户GUID';

comment on column TSYS_PurMenus.USERID is
'用户ID';

comment on column TSYS_PurMenus.OrganizationalGUID is
'组织机构GUID';

comment on column TSYS_PurMenus.Enabled is
'使用';

comment on column TSYS_PurMenus.Visibled is
'显示';

comment on column TSYS_PurMenus.Flag is
'标志';

/*==============================================================*/
/* Index: Relationship_9_FK                                     */
/*==============================================================*/
create index Relationship_9_FK on TSYS_PurMenus (
   UNCGUID ASC
);

/*==============================================================*/
/* Index: Relationship_10_FK                                    */
/*==============================================================*/
create index Relationship_10_FK on TSYS_PurMenus (
   MenuGUID ASC
);

/*==============================================================*/
/* Table: TSYS_Tables                                           */
/*==============================================================*/
create table TSYS_Tables  (
   TabGUID              VARCHAR2(32)                    not null,
   Name                 VARCHAR2(20),
   Caption              VARCHAR2(100),
   CREATETIME           DATE                           default SYSDATE not null,
   UPDATETIME           DATE                           default SYSDATE not null,
   USERID               VARCHAR2(32)                   default NULL not null,
   USERGUID             VARCHAR2(32)                    not null,
   OrganizationalGUID   VARCHAR2(32)                    not null,
   Flag                 SMALLINT                       default 1,
   constraint PK_TSYS_TABLES primary key (TabGUID)
);

comment on table TSYS_Tables is
'表集合';

comment on column TSYS_Tables.TabGUID is
'表GUID';

comment on column TSYS_Tables.Name is
'名称';

comment on column TSYS_Tables.Caption is
'中文名称';

comment on column TSYS_Tables.CREATETIME is
'创建时间';

comment on column TSYS_Tables.UPDATETIME is
'更新时间';

comment on column TSYS_Tables.USERID is
'用户ID';

comment on column TSYS_Tables.USERGUID is
'用户GUID';

comment on column TSYS_Tables.OrganizationalGUID is
'组织机构GUID';

comment on column TSYS_Tables.Flag is
'标志';

