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
'��˾��Ϣ';

comment on column Company.CompanyGUID is
'��˾GUID';

comment on column Company.Incorporator is
'���˴���';

comment on column Company.Quality is
'��˾����';

comment on column Company.Funding is
'ע���ʽ�';

comment on column Company.Address is
'��ַ';

comment on column Company.Caption is
'��������';

comment on column Company.Name is
'����';

comment on column Company.CREATETIME is
'����ʱ��';

comment on column Company.UPDATETIME is
'����ʱ��';

insert into company(companyguid, 
                    incorporator, 
                    quality, 
                    funding, 
                    address, 
                    caption, 
                    name, 
                    createtime, 
                    updatetime) values(sys_guid(),'����','˽Ӫ',200,'XXXʡXX��XXX��˾','������Ϣ�������޹�˾','�����Ƽ�',sysdate,sysdate);

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
'ģ���';

comment on column Modals.ModalGUID is
'ģ��GUID';

comment on column Modals.ID is
'���';

comment on column Modals.Name is
'����';

comment on column Modals.Caption is
'��������';

comment on column Modals.FileName is
'�ļ���';

comment on column Modals.Functioning is
'����';

comment on column Modals.Flag is
'��־';

comment on column Modals.CREATETIME is
'����ʱ��';

comment on column Modals.USERGUID is
'�û�GUID';

comment on column Modals.USERID is
'�û�ID';

comment on column Modals.OrganizationalGUID is
'��֯����GUID';

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
'�ֵ�';

comment on column TBASE_DICT.DGUID is
'�ֵ�GUID';

comment on column TBASE_DICT.ParentGUID is
'��ID';

comment on column TBASE_DICT.ID is
'���';

comment on column TBASE_DICT.Name is
'����';

comment on column TBASE_DICT.Caption is
'��������';

comment on column TBASE_DICT.CREATETIME is
'����ʱ��';

comment on column TBASE_DICT.UPDATETIME is
'����ʱ��';

comment on column TBASE_DICT.USERGUID is
'�û�GUID';

comment on column TBASE_DICT.USERID is
'�û�ID';

comment on column TBASE_DICT.OrganizationalGUID is
'��֯����GUID';

comment on column TBASE_DICT.Flag is
'��־';

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
'�м���';

comment on column TSYS_Columns.ColID is
'��GUID';

comment on column TSYS_Columns.TabGUID is
'��GUID';

comment on column TSYS_Columns.Name is
'����';

comment on column TSYS_Columns.Caption is
'��������';

comment on column TSYS_Columns.CREATETIME is
'����ʱ��';

comment on column TSYS_Columns.UPDATETIME is
'����ʱ��';

comment on column TSYS_Columns.USERID is
'�û�ID';

comment on column TSYS_Columns.USERGUID is
'�û�GUID';

comment on column TSYS_Columns.OrganizationalGUID is
'��֯����GUID';

comment on column TSYS_Columns.Flag is
'��־';

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
'��Ա��';

comment on column TSYS_Employee.empGUID is
'�û�FGUID';

comment on column TSYS_Employee.OgnGUID is
'����GUID';

comment on column TSYS_Employee.PosGUID is
'��λGUID';

comment on column TSYS_Employee.ID is
'���';

comment on column TSYS_Employee.Caption is
'��������';

comment on column TSYS_Employee.Name is
'����';

comment on column TSYS_Employee.PassWord is
'����';

comment on column TSYS_Employee.isLogin is
'�����½';

comment on column TSYS_Employee.ZZZT is
'��ְ״̬';

comment on column TSYS_Employee.CREATETIME is
'����ʱ��';

comment on column TSYS_Employee.UPDATETIME is
'����ʱ��';

comment on column TSYS_Employee.USERID is
'�û�ID';

comment on column TSYS_Employee.USERGUID is
'�û�GUID';

comment on column TSYS_Employee.OrganizationalGUID is
'��֯����GUID';

comment on column TSYS_Employee.Flag is
'��־';

insert into tsys_employee
  (empguid, ognguid, posguid, id, caption, name, password, islogin, zzzt, createtime, updatetime, userid, userguid, organizationalguid, flag)
values
  (sys_guid(), 'A753205F97944B4BB68C638CDB3A2C8E', '55003E6C81F449129E29B16671DBB82C', '00000', '����Ա','admin','admin',1, 1, sysdate, sysdate, '000000', sys_guid(), sys_guid(), 1);

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
'���ܱ�';

comment on column TSYS_Function.UNCGUID is
'����GUID';

comment on column TSYS_Function.MenuGUID is
'�˵�GUID';

comment on column TSYS_Function.ID is
'���';

comment on column TSYS_Function.Name is
'����';

comment on column TSYS_Function.Caption is
'��������';

comment on column TSYS_Function.CREATETIME is
'����ʱ��';

comment on column TSYS_Function.UPDATETIME is
'����ʱ��';

comment on column TSYS_Function.USERID is
'�û�ID';

comment on column TSYS_Function.USERGUID is
'�û�GUID';

comment on column TSYS_Function.OrganizationalGUID is
'��֯����GUID';

comment on column TSYS_Function.Flag is
'��־';

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
'�˵���';

comment on column TSYS_Menus.MenuGUID is
'�˵�GUID';

comment on column TSYS_Menus.ParentGUID is
'��ID';

comment on column TSYS_Menus.ID is
'���';

comment on column TSYS_Menus.Name is
'����';

comment on column TSYS_Menus.Caption is
'��������';

comment on column TSYS_Menus.OrderNo is
'���';

comment on column TSYS_Menus.AModuleName is
'ģ������';

comment on column TSYS_Menus.Flag is
'��־';

comment on column TSYS_Menus.CREATETIME is
'����ʱ��';

comment on column TSYS_Menus.UPDATETIME is
'����ʱ��';

comment on column TSYS_Menus.USERID is
'�û�ID';

comment on column TSYS_Menus.USERGUID is
'�û�GUID';

comment on column TSYS_Menus.OrganizationalGUID is
'��֯����GUID';

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
'��֯������';

comment on column TSYS_Organizational.OgnGUID is
'����GUID';

comment on column TSYS_Organizational.ParentGUID is
'��ID';

comment on column TSYS_Organizational.ID is
'���';

comment on column TSYS_Organizational.Name is
'����';

comment on column TSYS_Organizational.Caption is
'��������';

comment on column TSYS_Organizational.CREATETIME is
'����ʱ��';

comment on column TSYS_Organizational.UPDATETIME is
'����ʱ��';

comment on column TSYS_Organizational.USERID is
'�û�ID';

comment on column TSYS_Organizational.USERGUID is
'�û�GUID';

comment on column TSYS_Organizational.OrganizationalGUID is
'��֯����GUID';

comment on column TSYS_Organizational.Flag is
'��־';

insert into tsys_organizational
  (ognguid, parentguid, id, name, caption, createtime, updatetime, userid, userguid, organizationalguid, flag)
values
  ('A753205F97944B4BB68C638CDB3A2C8E','7D2BE191289047F0BF57ADA4F7CDF04D','000001', 'office', '�ܾ���칫��', sysDate, sysDate, sys_guid(), sys_guid(), sys_guid(), 1);

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
'��λȨ�ޱ�';

comment on column TSYS_PosPurviews.epmGUID is
'Ȩ�޲˵�GUID';

comment on column TSYS_PosPurviews.PosGUID is
'��λGUID';

comment on column TSYS_PosPurviews.CREATETIME is
'����ʱ��';

comment on column TSYS_PosPurviews.UPDATETIME is
'����ʱ��';

comment on column TSYS_PosPurviews.USERID is
'�û�ID';

comment on column TSYS_PosPurviews.OrganizationalGUID is
'��֯����GUID';

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
'��λ��';

comment on column TSYS_Position.PosGUID is
'��λGUID';

comment on column TSYS_Position.ParentGUID is
'��ID';

comment on column TSYS_Position.Caption is
'��������';

comment on column TSYS_Position.Name is
'����';

comment on column TSYS_Position.CREATETIME is
'����ʱ��';

comment on column TSYS_Position.UPDATETIME is
'����ʱ��';

comment on column TSYS_Position.USERID is
'�û�ID';

comment on column TSYS_Position.USERGUID is
'�û�GUID';

comment on column TSYS_Position.OrganizationalGUID is
'��֯����GUID';

comment on column TSYS_Position.Flag is
'��־';

insert into tsys_position
  (posguid, parentguid, caption, name, createtime, updatetime, userid, userguid, organizationalguid, flag)
values
  ('55003E6C81F449129E29B16671DBB82C','46A67692E7A446558F58BE555F9038FE','��������Ա','����Ա',sysdate, sysdate, sys_guid(), sys_guid(), sys_guid(), 1);

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
'Ȩ�޲˵���';

comment on column TSYS_PurMenus.epmGUID is
'Ȩ�޲˵�GUID';

comment on column TSYS_PurMenus.MenuGUID is
'�˵�GUID';

comment on column TSYS_PurMenus.UNCGUID is
'����GUID';

comment on column TSYS_PurMenus.CREATETIME is
'����ʱ��';

comment on column TSYS_PurMenus.USERGUID is
'�û�GUID';

comment on column TSYS_PurMenus.USERID is
'�û�ID';

comment on column TSYS_PurMenus.OrganizationalGUID is
'��֯����GUID';

comment on column TSYS_PurMenus.Enabled is
'ʹ��';

comment on column TSYS_PurMenus.Visibled is
'��ʾ';

comment on column TSYS_PurMenus.Flag is
'��־';

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
'����';

comment on column TSYS_Tables.TabGUID is
'��GUID';

comment on column TSYS_Tables.Name is
'����';

comment on column TSYS_Tables.Caption is
'��������';

comment on column TSYS_Tables.CREATETIME is
'����ʱ��';

comment on column TSYS_Tables.UPDATETIME is
'����ʱ��';

comment on column TSYS_Tables.USERID is
'�û�ID';

comment on column TSYS_Tables.USERGUID is
'�û�GUID';

comment on column TSYS_Tables.OrganizationalGUID is
'��֯����GUID';

comment on column TSYS_Tables.Flag is
'��־';

