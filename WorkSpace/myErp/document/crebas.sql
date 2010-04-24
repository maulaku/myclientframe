/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     2010-04-08 23:53:38                          */
/*==============================================================*/


/*==============================================================*/
/* Table: TBASE_DICT                                            */
/*==============================================================*/
CREATE TABLE TBASE_DICT  (
   DGUID                VARCHAR2(32)                    NOT NULL,
   "PARENTGUID"         VARCHAR2(32),
   ID                   VARCHAR2(20),
   "NAME"               VARCHAR2(20),
   "CAPTION"            VARCHAR2(100),
   CREATETIME           DATE                           DEFAULT SYSDATE,
   UPDATETIME           DATE                           DEFAULT SYSDATE,
   USERGUID             VARCHAR2(32),
   USERID               VARCHAR2(32)                   DEFAULT NULL,
   "ORGANIZATIONALGUID" VARCHAR2(32),
   "FLAG"               SMALLINT                       DEFAULT 1,
   "PARAM1"             VARCHAR2(32),
   "PARAM2"             VARCHAR2(32),
   "PARAM3"             VARCHAR2(32),
   "PARAM4"             VARCHAR2(32),
   "PARAM5"             VARCHAR2(32),
   "PARAM6"             VARCHAR2(32),
   "PARAM7"             VARCHAR2(32),
   "PARAM8"             VARCHAR2(32),
   "PARAM9"             VARCHAR2(32),
   "PARAM10"            VARCHAR2(32),
   CONSTRAINT PK_TBASE_DICT PRIMARY KEY (DGUID)
);

COMMENT ON TABLE TBASE_DICT IS
'�ֵ�';

COMMENT ON COLUMN TBASE_DICT.DGUID IS
'�ֵ�GUID';

COMMENT ON COLUMN TBASE_DICT."PARENTGUID" IS
'��ID';

COMMENT ON COLUMN TBASE_DICT.ID IS
'���';

COMMENT ON COLUMN TBASE_DICT."NAME" IS
'����';

COMMENT ON COLUMN TBASE_DICT."CAPTION" IS
'��������';

COMMENT ON COLUMN TBASE_DICT.CREATETIME IS
'����ʱ��';

COMMENT ON COLUMN TBASE_DICT.UPDATETIME IS
'����ʱ��';

COMMENT ON COLUMN TBASE_DICT.USERGUID IS
'�û�GUID';

COMMENT ON COLUMN TBASE_DICT.USERID IS
'�û�ID';

COMMENT ON COLUMN TBASE_DICT."ORGANIZATIONALGUID" IS
'��֯����GUID';

COMMENT ON COLUMN TBASE_DICT."FLAG" IS
'��־';

COMMENT ON COLUMN TBASE_DICT."PARAM1" IS
'param1';

COMMENT ON COLUMN TBASE_DICT."PARAM2" IS
'param2';

COMMENT ON COLUMN TBASE_DICT."PARAM3" IS
'param3';

COMMENT ON COLUMN TBASE_DICT."PARAM4" IS
'param4';

COMMENT ON COLUMN TBASE_DICT."PARAM5" IS
'param5';

COMMENT ON COLUMN TBASE_DICT."PARAM6" IS
'param6';

COMMENT ON COLUMN TBASE_DICT."PARAM7" IS
'param7';

COMMENT ON COLUMN TBASE_DICT."PARAM8" IS
'param8';

COMMENT ON COLUMN TBASE_DICT."PARAM9" IS
'param9';

COMMENT ON COLUMN TBASE_DICT."PARAM10" IS
'param10';

/*==============================================================*/
/* Table: "TSYS_COLUMNS"                                        */
/*==============================================================*/
CREATE TABLE "TSYS_COLUMNS"  (
   "COLID"              VARCHAR2(32)                    NOT NULL,
   "TABGUID"            VARCHAR2(32)                    NOT NULL,
   "NAME"               VARCHAR2(20),
   "CAPTION"            VARCHAR2(100),
   CREATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   UPDATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   USERID               VARCHAR2(32)                   DEFAULT NULL NOT NULL,
   USERGUID             VARCHAR2(32)                    NOT NULL,
   "ORGANIZATIONALGUID" VARCHAR2(32)                    NOT NULL,
   "FLAG"               SMALLINT                       DEFAULT 1,
   CONSTRAINT PK_TSYS_COLUMNS PRIMARY KEY ("COLID")
);

COMMENT ON TABLE "TSYS_COLUMNS" IS
'�м���';

COMMENT ON COLUMN "TSYS_COLUMNS"."COLID" IS
'��GUID';

COMMENT ON COLUMN "TSYS_COLUMNS"."TABGUID" IS
'��GUID';

COMMENT ON COLUMN "TSYS_COLUMNS"."NAME" IS
'����';

COMMENT ON COLUMN "TSYS_COLUMNS"."CAPTION" IS
'��������';

COMMENT ON COLUMN "TSYS_COLUMNS".CREATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_COLUMNS".UPDATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_COLUMNS".USERID IS
'�û�ID';

COMMENT ON COLUMN "TSYS_COLUMNS".USERGUID IS
'�û�GUID';

COMMENT ON COLUMN "TSYS_COLUMNS"."ORGANIZATIONALGUID" IS
'��֯����GUID';

COMMENT ON COLUMN "TSYS_COLUMNS"."FLAG" IS
'��־';

/*==============================================================*/
/* Table: "TSYS_EMPLOYEE"                                       */
/*==============================================================*/
CREATE TABLE "TSYS_EMPLOYEE"  (
   "EMPGUID"            VARCHAR2(32)                    NOT NULL,
   "OGNGUID"            VARCHAR2(32)                    NOT NULL,
   "POSGUID"            VARCHAR2(32)                    NOT NULL,
   ID                   VARCHAR2(20),
   "CAPTION"            VARCHAR2(100),
   "NAME"               VARCHAR2(20)                    NOT NULL,
   "PASSWORD"           VARCHAR2(18),
   "ISLOGIN"            SMALLINT                       DEFAULT 1,
   ZZZT                 SMALLINT                       DEFAULT 1,
   CREATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   UPDATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   USERID               VARCHAR2(32)                   DEFAULT NULL NOT NULL,
   USERGUID             VARCHAR2(32)                    NOT NULL,
   "ORGANIZATIONALGUID" VARCHAR2(32)                    NOT NULL,
   "FLAG"               SMALLINT                       DEFAULT 1,
   "PARAM1"             VARCHAR2(32),
   "PARAM2"             VARCHAR2(32),
   "PARAM3"             VARCHAR2(32),
   "PARAM4"             VARCHAR2(32),
   "PARAM5"             VARCHAR2(32),
   "PARAM6"             VARCHAR2(32),
   "PARAM7"             VARCHAR2(32),
   "PARAM8"             VARCHAR2(32),
   "PARAM9"             VARCHAR2(32),
   "PARAM10"            VARCHAR2(32),
   CONSTRAINT PK_TSYS_EMPLOYEE PRIMARY KEY ("EMPGUID")
);

COMMENT ON TABLE "TSYS_EMPLOYEE" IS
'��Ա��';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."EMPGUID" IS
'�û�FGUID';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."OGNGUID" IS
'����GUID';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."POSGUID" IS
'��λGUID';

COMMENT ON COLUMN "TSYS_EMPLOYEE".ID IS
'���';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."CAPTION" IS
'��������';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."NAME" IS
'����';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."PASSWORD" IS
'����';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."ISLOGIN" IS
'�����½';

COMMENT ON COLUMN "TSYS_EMPLOYEE".ZZZT IS
'��ְ״̬';

COMMENT ON COLUMN "TSYS_EMPLOYEE".CREATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_EMPLOYEE".UPDATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_EMPLOYEE".USERID IS
'�û�ID';

COMMENT ON COLUMN "TSYS_EMPLOYEE".USERGUID IS
'�û�GUID';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."ORGANIZATIONALGUID" IS
'��֯����GUID';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."FLAG" IS
'��־';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."PARAM1" IS
'param1';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."PARAM2" IS
'param2';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."PARAM3" IS
'param3';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."PARAM4" IS
'param4';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."PARAM5" IS
'param5';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."PARAM6" IS
'param6';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."PARAM7" IS
'param7';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."PARAM8" IS
'param8';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."PARAM9" IS
'param9';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."PARAM10" IS
'param10';

INSERT INTO TSYS_EMPLOYEE
  (EMPGUID, OGNGUID, POSGUID, ID, CAPTION, NAME, PASSWORD, ISLOGIN, ZZZT, CREATETIME, UPDATETIME, USERID, USERGUID, ORGANIZATIONALGUID, FLAG)
VALUES
  (SYS_GUID(), 'A753205F97944B4BB68C638CDB3A2C8E', '55003E6C81F449129E29B16671DBB82C', '00000', '����Ա','admin','admin',1, 1, SYSDATE, SYSDATE, '000000', SYS_GUID(), SYS_GUID(), 1);

/*==============================================================*/
/* Table: "TSYS_FUNCTION"                                       */
/*==============================================================*/
CREATE TABLE "TSYS_FUNCTION"  (
   UNCGUID              VARCHAR2(32)                    NOT NULL,
   "MENUGUID"           VARCHAR2(32),
   ID                   VARCHAR2(20),
   "NAME"               VARCHAR2(20),
   "CAPTION"            VARCHAR2(100),
   CREATETIME           DATE                           DEFAULT SYSDATE,
   UPDATETIME           DATE                           DEFAULT SYSDATE,
   USERID               VARCHAR2(32)                   DEFAULT NULL,
   USERGUID             VARCHAR2(32),
   "ORGANIZATIONALGUID" VARCHAR2(32),
   "FLAG"               SMALLINT                       DEFAULT 1,
   "PARAM1"             VARCHAR2(32),
   "PARAM2"             VARCHAR2(32),
   "PARAM3"             VARCHAR2(32),
   "PARAM4"             VARCHAR2(32),
   "PARAM5"             VARCHAR2(32),
   "PARAM6"             VARCHAR2(32),
   "PARAM7"             VARCHAR2(32),
   "PARAM8"             VARCHAR2(32),
   "PARAM9"             VARCHAR2(32),
   "PARAM10"            VARCHAR2(32),
   CONSTRAINT PK_TSYS_FUNCTION PRIMARY KEY (UNCGUID)
);

COMMENT ON TABLE "TSYS_FUNCTION" IS
'���ܱ�';

COMMENT ON COLUMN "TSYS_FUNCTION".UNCGUID IS
'����GUID';

COMMENT ON COLUMN "TSYS_FUNCTION"."MENUGUID" IS
'�˵�GUID';

COMMENT ON COLUMN "TSYS_FUNCTION".ID IS
'���';

COMMENT ON COLUMN "TSYS_FUNCTION"."NAME" IS
'����';

COMMENT ON COLUMN "TSYS_FUNCTION"."CAPTION" IS
'��������';

COMMENT ON COLUMN "TSYS_FUNCTION".CREATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_FUNCTION".UPDATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_FUNCTION".USERID IS
'�û�ID';

COMMENT ON COLUMN "TSYS_FUNCTION".USERGUID IS
'�û�GUID';

COMMENT ON COLUMN "TSYS_FUNCTION"."ORGANIZATIONALGUID" IS
'��֯����GUID';

COMMENT ON COLUMN "TSYS_FUNCTION"."FLAG" IS
'��־';

COMMENT ON COLUMN "TSYS_FUNCTION"."PARAM1" IS
'param1';

COMMENT ON COLUMN "TSYS_FUNCTION"."PARAM2" IS
'param2';

COMMENT ON COLUMN "TSYS_FUNCTION"."PARAM3" IS
'param3';

COMMENT ON COLUMN "TSYS_FUNCTION"."PARAM4" IS
'param4';

COMMENT ON COLUMN "TSYS_FUNCTION"."PARAM5" IS
'param5';

COMMENT ON COLUMN "TSYS_FUNCTION"."PARAM6" IS
'param6';

COMMENT ON COLUMN "TSYS_FUNCTION"."PARAM7" IS
'param7';

COMMENT ON COLUMN "TSYS_FUNCTION"."PARAM8" IS
'param8';

COMMENT ON COLUMN "TSYS_FUNCTION"."PARAM9" IS
'param9';

COMMENT ON COLUMN "TSYS_FUNCTION"."PARAM10" IS
'param10';

/*==============================================================*/
/* Table: "TSYS_MENUS"                                          */
/*==============================================================*/
CREATE TABLE "TSYS_MENUS"  (
   "MENUGUID"           VARCHAR2(32)                    NOT NULL,
   "PARENTGUID"         VARCHAR2(32)                    NOT NULL,
   ID                   VARCHAR2(20),
   "NAME"               VARCHAR2(20),
   "CAPTION"            VARCHAR2(100),
   "ORDERNO"            SMALLINT,
   "AMODULENAME"        VARCHAR2(30),
   "FLAG"               SMALLINT                       DEFAULT 1,
   CREATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   UPDATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   USERID               VARCHAR2(32)                   DEFAULT NULL NOT NULL,
   USERGUID             VARCHAR2(32)                    NOT NULL,
   "ORGANIZATIONALGUID" VARCHAR2(32)                    NOT NULL,
   "PARAM1"             VARCHAR2(32),
   "PARAM2"             VARCHAR2(32),
   "PARAM3"             VARCHAR2(32),
   "PARAM4"             VARCHAR2(32),
   "PARAM5"             VARCHAR2(32),
   "PARAM6"             VARCHAR2(32),
   "PARAM7"             VARCHAR2(32),
   "PARAM8"             VARCHAR2(32),
   "PARAM9"             VARCHAR2(32),
   "PARAM10"            VARCHAR2(32),
   CONSTRAINT PK_TSYS_MENUS PRIMARY KEY ("MENUGUID")
);

COMMENT ON TABLE "TSYS_MENUS" IS
'�˵���';

COMMENT ON COLUMN "TSYS_MENUS"."MENUGUID" IS
'�˵�GUID';

COMMENT ON COLUMN "TSYS_MENUS"."PARENTGUID" IS
'��ID';

COMMENT ON COLUMN "TSYS_MENUS".ID IS
'���';

COMMENT ON COLUMN "TSYS_MENUS"."NAME" IS
'����';

COMMENT ON COLUMN "TSYS_MENUS"."CAPTION" IS
'��������';

COMMENT ON COLUMN "TSYS_MENUS"."ORDERNO" IS
'���';

COMMENT ON COLUMN "TSYS_MENUS"."AMODULENAME" IS
'ģ������';

COMMENT ON COLUMN "TSYS_MENUS"."FLAG" IS
'��־';

COMMENT ON COLUMN "TSYS_MENUS".CREATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_MENUS".UPDATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_MENUS".USERID IS
'�û�ID';

COMMENT ON COLUMN "TSYS_MENUS".USERGUID IS
'�û�GUID';

COMMENT ON COLUMN "TSYS_MENUS"."ORGANIZATIONALGUID" IS
'��֯����GUID';

COMMENT ON COLUMN "TSYS_MENUS"."PARAM1" IS
'param1';

COMMENT ON COLUMN "TSYS_MENUS"."PARAM2" IS
'param2';

COMMENT ON COLUMN "TSYS_MENUS"."PARAM3" IS
'param3';

COMMENT ON COLUMN "TSYS_MENUS"."PARAM4" IS
'param4';

COMMENT ON COLUMN "TSYS_MENUS"."PARAM5" IS
'param5';

COMMENT ON COLUMN "TSYS_MENUS"."PARAM6" IS
'param6';

COMMENT ON COLUMN "TSYS_MENUS"."PARAM7" IS
'param7';

COMMENT ON COLUMN "TSYS_MENUS"."PARAM8" IS
'param8';

COMMENT ON COLUMN "TSYS_MENUS"."PARAM9" IS
'param9';

COMMENT ON COLUMN "TSYS_MENUS"."PARAM10" IS
'param10';

/*==============================================================*/
/* Table: "TSYS_ORGANIZATIONAL"                                 */
/*==============================================================*/
CREATE TABLE "TSYS_ORGANIZATIONAL"  (
   "OGNGUID"            VARCHAR2(32)                    NOT NULL,
   "PARENTGUID"         VARCHAR2(32),
   ID                   VARCHAR2(20),
   "NAME"               VARCHAR2(20),
   "CAPTION"            VARCHAR2(100),
   CREATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   UPDATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   USERID               VARCHAR2(32)                   DEFAULT NULL NOT NULL,
   USERGUID             VARCHAR2(32)                    NOT NULL,
   "ORGANIZATIONALGUID" VARCHAR2(32)                    NOT NULL,
   "FLAG"               SMALLINT                       DEFAULT 1,
   "PARAM1"             VARCHAR2(32),
   "PARAM2"             VARCHAR2(32),
   "PARAM3"             VARCHAR2(32),
   "PARAM4"             VARCHAR2(32),
   "PARAM5"             VARCHAR2(32),
   "PARAM6"             VARCHAR2(32),
   "PARAM7"             VARCHAR2(32),
   "PARAM8"             VARCHAR2(32),
   "PARAM9"             VARCHAR2(32),
   "PARAM10"            VARCHAR2(32),
   CONSTRAINT PK_TSYS_ORGANIZATIONAL PRIMARY KEY ("OGNGUID")
);

COMMENT ON TABLE "TSYS_ORGANIZATIONAL" IS
'��֯������';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."OGNGUID" IS
'����GUID';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."PARENTGUID" IS
'��ID';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL".ID IS
'���';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."NAME" IS
'����';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."CAPTION" IS
'��������';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL".CREATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL".UPDATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL".USERID IS
'�û�ID';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL".USERGUID IS
'�û�GUID';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."ORGANIZATIONALGUID" IS
'��֯����GUID';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."FLAG" IS
'��־';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."PARAM1" IS
'param1';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."PARAM2" IS
'param2';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."PARAM3" IS
'param3';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."PARAM4" IS
'param4';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."PARAM5" IS
'param5';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."PARAM6" IS
'param6';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."PARAM7" IS
'param7';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."PARAM8" IS
'param8';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."PARAM9" IS
'param9';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."PARAM10" IS
'param10';

INSERT INTO TSYS_ORGANIZATIONAL
  (OGNGUID, PARENTGUID, ID, NAME, CAPTION, CREATETIME, UPDATETIME, USERID, USERGUID, ORGANIZATIONALGUID, FLAG)
VALUES
  ('A753205F97944B4BB68C638CDB3A2C8E','7D2BE191289047F0BF57ADA4F7CDF04D','000001', 'office', '�ܾ���칫��', SYSDATE, SYSDATE, SYS_GUID(), SYS_GUID(), SYS_GUID(), 1);

/*==============================================================*/
/* Table: "TSYS_POSPURVIEWS"                                    */
/*==============================================================*/
CREATE TABLE "TSYS_POSPURVIEWS"  (
   "EPMGUID"            VARCHAR2(32)                    NOT NULL,
   "POSGUID"            VARCHAR2(32)                    NOT NULL,
   CREATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   UPDATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   USERID               VARCHAR2(32)                   DEFAULT NULL NOT NULL,
   "ORGANIZATIONALGUID" VARCHAR2(32)                    NOT NULL
);

COMMENT ON TABLE "TSYS_POSPURVIEWS" IS
'��λȨ�ޱ�';

COMMENT ON COLUMN "TSYS_POSPURVIEWS"."EPMGUID" IS
'Ȩ�޲˵�GUID';

COMMENT ON COLUMN "TSYS_POSPURVIEWS"."POSGUID" IS
'��λGUID';

COMMENT ON COLUMN "TSYS_POSPURVIEWS".CREATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_POSPURVIEWS".UPDATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_POSPURVIEWS".USERID IS
'�û�ID';

COMMENT ON COLUMN "TSYS_POSPURVIEWS"."ORGANIZATIONALGUID" IS
'��֯����GUID';

/*==============================================================*/
/* Table: "TSYS_POSITION"                                       */
/*==============================================================*/
--
CREATE TABLE "TSYS_POSITION"  (
   "POSGUID"            VARCHAR2(32)                    NOT NULL,
   "PARENTGUID"         VARCHAR2(32),
   "CAPTION"            VARCHAR2(100),
   "NAME"               VARCHAR2(20),
   CREATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   UPDATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   USERID               VARCHAR2(32)                   DEFAULT NULL NOT NULL,
   USERGUID             VARCHAR2(32)                    NOT NULL,
   "ORGANIZATIONALGUID" VARCHAR2(32)                    NOT NULL,
   "FLAG"               SMALLINT                       DEFAULT 1,
   "PARAM1"             VARCHAR2(32),
   "PARAM2"             VARCHAR2(32),
   "PARAM3"             VARCHAR2(32),
   "PARAM4"             VARCHAR2(32),
   "PARAM5"             VARCHAR2(32),
   "PARAM6"             VARCHAR2(32),
   "PARAM7"             VARCHAR2(32),
   "PARAM8"             VARCHAR2(32),
   "PARAM9"             VARCHAR2(32),
   "PARAM10"            VARCHAR2(32),
   CONSTRAINT PK_TSYS_POSITION PRIMARY KEY ("POSGUID")
);

COMMENT ON TABLE "TSYS_POSITION" IS
'��λ��';

COMMENT ON COLUMN "TSYS_POSITION"."POSGUID" IS
'��λGUID';

COMMENT ON COLUMN "TSYS_POSITION"."PARENTGUID" IS
'��ID';

COMMENT ON COLUMN "TSYS_POSITION"."CAPTION" IS
'��������';

COMMENT ON COLUMN "TSYS_POSITION"."NAME" IS
'����';

COMMENT ON COLUMN "TSYS_POSITION".CREATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_POSITION".UPDATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_POSITION".USERID IS
'�û�ID';

COMMENT ON COLUMN "TSYS_POSITION".USERGUID IS
'�û�GUID';

COMMENT ON COLUMN "TSYS_POSITION"."ORGANIZATIONALGUID" IS
'��֯����GUID';

COMMENT ON COLUMN "TSYS_POSITION"."FLAG" IS
'��־';

COMMENT ON COLUMN "TSYS_POSITION"."PARAM1" IS
'param1';

COMMENT ON COLUMN "TSYS_POSITION"."PARAM2" IS
'param2';

COMMENT ON COLUMN "TSYS_POSITION"."PARAM3" IS
'param3';

COMMENT ON COLUMN "TSYS_POSITION"."PARAM4" IS
'param4';

COMMENT ON COLUMN "TSYS_POSITION"."PARAM5" IS
'param5';

COMMENT ON COLUMN "TSYS_POSITION"."PARAM6" IS
'param6';

COMMENT ON COLUMN "TSYS_POSITION"."PARAM7" IS
'param7';

COMMENT ON COLUMN "TSYS_POSITION"."PARAM8" IS
'param8';

COMMENT ON COLUMN "TSYS_POSITION"."PARAM9" IS
'param9';

COMMENT ON COLUMN "TSYS_POSITION"."PARAM10" IS
'param10';

INSERT INTO TSYS_POSITION
  (POSGUID, PARENTGUID, CAPTION, NAME, CREATETIME, UPDATETIME, USERID, USERGUID, ORGANIZATIONALGUID, FLAG)
VALUES
  ('55003E6C81F449129E29B16671DBB82C','46A67692E7A446558F58BE555F9038FE','��������Ա','����Ա',SYSDATE, SYSDATE, SYS_GUID(), SYS_GUID(), SYS_GUID(), 1);

/*==============================================================*/
/* Table: "TSYS_PURMENUS"                                       */
/*==============================================================*/
CREATE TABLE "TSYS_PURMENUS"  (
   "EPMGUID"            VARCHAR2(32)                    NOT NULL,
   "MENUGUID"           VARCHAR2(32),
   UNCGUID              VARCHAR2(32),
   CREATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   USERGUID             VARCHAR2(32)                    NOT NULL,
   USERID               VARCHAR2(32)                   DEFAULT NULL NOT NULL,
   "ORGANIZATIONALGUID" VARCHAR2(32)                    NOT NULL,
   "ENABLED"            SMALLINT,
   "VISIBLED"           SMALLINT,
   "FLAG"               SMALLINT                       DEFAULT 1,
   CONSTRAINT PK_TSYS_PURMENUS PRIMARY KEY ("EPMGUID")
);

COMMENT ON TABLE "TSYS_PURMENUS" IS
'Ȩ�޲˵���';

COMMENT ON COLUMN "TSYS_PURMENUS"."EPMGUID" IS
'Ȩ�޲˵�GUID';

COMMENT ON COLUMN "TSYS_PURMENUS"."MENUGUID" IS
'�˵�GUID';

COMMENT ON COLUMN "TSYS_PURMENUS".UNCGUID IS
'����GUID';

COMMENT ON COLUMN "TSYS_PURMENUS".CREATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_PURMENUS".USERGUID IS
'�û�GUID';

COMMENT ON COLUMN "TSYS_PURMENUS".USERID IS
'�û�ID';

COMMENT ON COLUMN "TSYS_PURMENUS"."ORGANIZATIONALGUID" IS
'��֯����GUID';

COMMENT ON COLUMN "TSYS_PURMENUS"."ENABLED" IS
'ʹ��';

COMMENT ON COLUMN "TSYS_PURMENUS"."VISIBLED" IS
'��ʾ';

COMMENT ON COLUMN "TSYS_PURMENUS"."FLAG" IS
'��־';

/*==============================================================*/
/* Table: "TSYS_TABLES"                                         */
/*==============================================================*/
CREATE TABLE "TSYS_TABLES"  (
   "TABGUID"            VARCHAR2(32)                    NOT NULL,
   "NAME"               VARCHAR2(20),
   "CAPTION"            VARCHAR2(100),
   CREATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   UPDATETIME           DATE                           DEFAULT SYSDATE NOT NULL,
   USERID               VARCHAR2(32)                   DEFAULT NULL NOT NULL,
   USERGUID             VARCHAR2(32)                    NOT NULL,
   "ORGANIZATIONALGUID" VARCHAR2(32)                    NOT NULL,
   "FLAG"               SMALLINT                       DEFAULT 1,
   CONSTRAINT PK_TSYS_TABLES PRIMARY KEY ("TABGUID")
);

COMMENT ON TABLE "TSYS_TABLES" IS
'����';

COMMENT ON COLUMN "TSYS_TABLES"."TABGUID" IS
'��GUID';

COMMENT ON COLUMN "TSYS_TABLES"."NAME" IS
'����';

COMMENT ON COLUMN "TSYS_TABLES"."CAPTION" IS
'��������';

COMMENT ON COLUMN "TSYS_TABLES".CREATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_TABLES".UPDATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_TABLES".USERID IS
'�û�ID';

COMMENT ON COLUMN "TSYS_TABLES".USERGUID IS
'�û�GUID';

COMMENT ON COLUMN "TSYS_TABLES"."ORGANIZATIONALGUID" IS
'��֯����GUID';

COMMENT ON COLUMN "TSYS_TABLES"."FLAG" IS
'��־';

/*==============================================================*/
/* Table: "TSYS_MODALS"                                         */
/*==============================================================*/
CREATE TABLE "TSYS_MODALS"  (
   "MODALGUID"          VARCHAR2(80)                    NOT NULL,
   ID                   VARCHAR2(20),
   "NAME"               VARCHAR2(20),
   "CAPTION"            VARCHAR2(100),
   "FILENAME"           VARCHAR2(100),
   "FUNCTIONING"        BLOB,
   "FLAG"               SMALLINT                       DEFAULT 1,
   CREATETIME           DATE                           DEFAULT SYSDATE,
   USERGUID             VARCHAR2(32),
   USERID               VARCHAR2(32)                   DEFAULT NULL,
   "ORGANIZATIONALGUID" VARCHAR2(32),
   "PARAM1"             VARCHAR2(32),
   "PARAM2"             VARCHAR2(32),
   "PARAM3"             VARCHAR2(32),
   "PARAM4"             VARCHAR2(32),
   "PARAM5"             VARCHAR2(32),
   "PARAM6"             VARCHAR2(32),
   "PARAM7"             VARCHAR2(32),
   "PARAM8"             VARCHAR2(32),
   "PARAM9"             VARCHAR2(32),
   "PARAM10"            VARCHAR2(32),
   CONSTRAINT PK_TSYS_MODALS PRIMARY KEY ("MODALGUID")
);

COMMENT ON TABLE "TSYS_MODALS" IS
'ģ���';

COMMENT ON COLUMN "TSYS_MODALS"."MODALGUID" IS
'ģ��GUID';

COMMENT ON COLUMN "TSYS_MODALS".ID IS
'���';

COMMENT ON COLUMN "TSYS_MODALS"."NAME" IS
'����';

COMMENT ON COLUMN "TSYS_MODALS"."CAPTION" IS
'��������';

COMMENT ON COLUMN "TSYS_MODALS"."FILENAME" IS
'�ļ���';

COMMENT ON COLUMN "TSYS_MODALS"."FUNCTIONING" IS
'����';

COMMENT ON COLUMN "TSYS_MODALS"."FLAG" IS
'��־';

COMMENT ON COLUMN "TSYS_MODALS".CREATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_MODALS".USERGUID IS
'�û�GUID';

COMMENT ON COLUMN "TSYS_MODALS".USERID IS
'�û�ID';

COMMENT ON COLUMN "TSYS_MODALS"."ORGANIZATIONALGUID" IS
'��֯����GUID';

COMMENT ON COLUMN "TSYS_MODALS"."PARAM1" IS
'param1';

COMMENT ON COLUMN "TSYS_MODALS"."PARAM2" IS
'param2';

COMMENT ON COLUMN "TSYS_MODALS"."PARAM3" IS
'param3';

COMMENT ON COLUMN "TSYS_MODALS"."PARAM4" IS
'param4';

COMMENT ON COLUMN "TSYS_MODALS"."PARAM5" IS
'param5';

COMMENT ON COLUMN "TSYS_MODALS"."PARAM6" IS
'param6';

COMMENT ON COLUMN "TSYS_MODALS"."PARAM7" IS
'param7';

COMMENT ON COLUMN "TSYS_MODALS"."PARAM8" IS
'param8';

COMMENT ON COLUMN "TSYS_MODALS"."PARAM9" IS
'param9';

COMMENT ON COLUMN "TSYS_MODALS"."PARAM10" IS
'param10';

/*==============================================================*/
/* Table: "TSYS_COMPANY"                                        */
/*==============================================================*/
CREATE TABLE "TSYS_COMPANY"  (
   "COMPANYGUID"        VARCHAR2(32)                    NOT NULL,
   "INCORPORATOR"       VARCHAR2(20),
   "QUALITY"            VARCHAR2(20),
   "FUNDING"            NUMBER(20),
   "ADDRESS"            VARCHAR2(100),
   "CAPTION"            VARCHAR2(100),
   "NAME"               VARCHAR2(20),
   CREATETIME           DATE                           DEFAULT SYSDATE,
   UPDATETIME           DATE                           DEFAULT SYSDATE,
   "PARAM1"             VARCHAR2(32),
   "PARAM2"             VARCHAR2(32),
   "PARAM3"             VARCHAR2(32),
   "PARAM4"             VARCHAR2(32),
   "PARAM5"             VARCHAR2(32),
   "PARAM6"             VARCHAR2(32),
   "PARAM7"             VARCHAR2(32),
   "PARAM8"             VARCHAR2(32),
   "PARAM9"             VARCHAR2(32),
   "PARAM10"            VARCHAR2(32),
   CONSTRAINT PK_TSYS_COMPANY PRIMARY KEY ("COMPANYGUID")
);

COMMENT ON TABLE "TSYS_COMPANY" IS
'��˾��Ϣ';

COMMENT ON COLUMN "TSYS_COMPANY"."COMPANYGUID" IS
'��˾GUID';

COMMENT ON COLUMN "TSYS_COMPANY"."INCORPORATOR" IS
'���˴���';

COMMENT ON COLUMN "TSYS_COMPANY"."QUALITY" IS
'��˾����';

COMMENT ON COLUMN "TSYS_COMPANY"."FUNDING" IS
'ע���ʽ�';

COMMENT ON COLUMN "TSYS_COMPANY"."ADDRESS" IS
'��ַ';

COMMENT ON COLUMN "TSYS_COMPANY"."CAPTION" IS
'��������';

COMMENT ON COLUMN "TSYS_COMPANY"."NAME" IS
'����';

COMMENT ON COLUMN "TSYS_COMPANY".CREATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_COMPANY".UPDATETIME IS
'����ʱ��';

COMMENT ON COLUMN "TSYS_COMPANY"."PARAM1" IS
'param1';

COMMENT ON COLUMN "TSYS_COMPANY"."PARAM2" IS
'param2';

COMMENT ON COLUMN "TSYS_COMPANY"."PARAM3" IS
'param3';

COMMENT ON COLUMN "TSYS_COMPANY"."PARAM4" IS
'param4';

COMMENT ON COLUMN "TSYS_COMPANY"."PARAM5" IS
'param5';

COMMENT ON COLUMN "TSYS_COMPANY"."PARAM6" IS
'param6';

COMMENT ON COLUMN "TSYS_COMPANY"."PARAM7" IS
'param7';

COMMENT ON COLUMN "TSYS_COMPANY"."PARAM8" IS
'param8';

COMMENT ON COLUMN "TSYS_COMPANY"."PARAM9" IS
'param9';

COMMENT ON COLUMN "TSYS_COMPANY"."PARAM10" IS
'param10';

INSERT INTO TSYS_COMPANY(COMPANYGUID, 
                    INCORPORATOR, 
                    QUALITY, 
                    FUNDING, 
                    ADDRESS, 
                    CAPTION, 
                    NAME, 
                    CREATETIME, 
                    UPDATETIME) VALUES(SYS_GUID(),'����','˽Ӫ',200,'XXXʡXX��XXX��˾','������Ϣ�������޹�˾','�����Ƽ�',SYSDATE,SYSDATE);

