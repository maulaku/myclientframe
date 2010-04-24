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
'字典';

COMMENT ON COLUMN TBASE_DICT.DGUID IS
'字典GUID';

COMMENT ON COLUMN TBASE_DICT."PARENTGUID" IS
'父ID';

COMMENT ON COLUMN TBASE_DICT.ID IS
'编号';

COMMENT ON COLUMN TBASE_DICT."NAME" IS
'名称';

COMMENT ON COLUMN TBASE_DICT."CAPTION" IS
'中文名称';

COMMENT ON COLUMN TBASE_DICT.CREATETIME IS
'创建时间';

COMMENT ON COLUMN TBASE_DICT.UPDATETIME IS
'更新时间';

COMMENT ON COLUMN TBASE_DICT.USERGUID IS
'用户GUID';

COMMENT ON COLUMN TBASE_DICT.USERID IS
'用户ID';

COMMENT ON COLUMN TBASE_DICT."ORGANIZATIONALGUID" IS
'组织机构GUID';

COMMENT ON COLUMN TBASE_DICT."FLAG" IS
'标志';

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
'列集合';

COMMENT ON COLUMN "TSYS_COLUMNS"."COLID" IS
'列GUID';

COMMENT ON COLUMN "TSYS_COLUMNS"."TABGUID" IS
'表GUID';

COMMENT ON COLUMN "TSYS_COLUMNS"."NAME" IS
'名称';

COMMENT ON COLUMN "TSYS_COLUMNS"."CAPTION" IS
'中文名称';

COMMENT ON COLUMN "TSYS_COLUMNS".CREATETIME IS
'创建时间';

COMMENT ON COLUMN "TSYS_COLUMNS".UPDATETIME IS
'更新时间';

COMMENT ON COLUMN "TSYS_COLUMNS".USERID IS
'用户ID';

COMMENT ON COLUMN "TSYS_COLUMNS".USERGUID IS
'用户GUID';

COMMENT ON COLUMN "TSYS_COLUMNS"."ORGANIZATIONALGUID" IS
'组织机构GUID';

COMMENT ON COLUMN "TSYS_COLUMNS"."FLAG" IS
'标志';

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
'人员表';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."EMPGUID" IS
'用户FGUID';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."OGNGUID" IS
'机构GUID';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."POSGUID" IS
'岗位GUID';

COMMENT ON COLUMN "TSYS_EMPLOYEE".ID IS
'编号';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."CAPTION" IS
'中文名称';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."NAME" IS
'名称';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."PASSWORD" IS
'口令';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."ISLOGIN" IS
'允许登陆';

COMMENT ON COLUMN "TSYS_EMPLOYEE".ZZZT IS
'在职状态';

COMMENT ON COLUMN "TSYS_EMPLOYEE".CREATETIME IS
'创建时间';

COMMENT ON COLUMN "TSYS_EMPLOYEE".UPDATETIME IS
'更新时间';

COMMENT ON COLUMN "TSYS_EMPLOYEE".USERID IS
'用户ID';

COMMENT ON COLUMN "TSYS_EMPLOYEE".USERGUID IS
'用户GUID';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."ORGANIZATIONALGUID" IS
'组织机构GUID';

COMMENT ON COLUMN "TSYS_EMPLOYEE"."FLAG" IS
'标志';

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
  (SYS_GUID(), 'A753205F97944B4BB68C638CDB3A2C8E', '55003E6C81F449129E29B16671DBB82C', '00000', '管理员','admin','admin',1, 1, SYSDATE, SYSDATE, '000000', SYS_GUID(), SYS_GUID(), 1);

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
'功能表';

COMMENT ON COLUMN "TSYS_FUNCTION".UNCGUID IS
'功能GUID';

COMMENT ON COLUMN "TSYS_FUNCTION"."MENUGUID" IS
'菜单GUID';

COMMENT ON COLUMN "TSYS_FUNCTION".ID IS
'编号';

COMMENT ON COLUMN "TSYS_FUNCTION"."NAME" IS
'名称';

COMMENT ON COLUMN "TSYS_FUNCTION"."CAPTION" IS
'中文名称';

COMMENT ON COLUMN "TSYS_FUNCTION".CREATETIME IS
'创建时间';

COMMENT ON COLUMN "TSYS_FUNCTION".UPDATETIME IS
'更新时间';

COMMENT ON COLUMN "TSYS_FUNCTION".USERID IS
'用户ID';

COMMENT ON COLUMN "TSYS_FUNCTION".USERGUID IS
'用户GUID';

COMMENT ON COLUMN "TSYS_FUNCTION"."ORGANIZATIONALGUID" IS
'组织机构GUID';

COMMENT ON COLUMN "TSYS_FUNCTION"."FLAG" IS
'标志';

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
'菜单表';

COMMENT ON COLUMN "TSYS_MENUS"."MENUGUID" IS
'菜单GUID';

COMMENT ON COLUMN "TSYS_MENUS"."PARENTGUID" IS
'父ID';

COMMENT ON COLUMN "TSYS_MENUS".ID IS
'编号';

COMMENT ON COLUMN "TSYS_MENUS"."NAME" IS
'名称';

COMMENT ON COLUMN "TSYS_MENUS"."CAPTION" IS
'中文名称';

COMMENT ON COLUMN "TSYS_MENUS"."ORDERNO" IS
'序号';

COMMENT ON COLUMN "TSYS_MENUS"."AMODULENAME" IS
'模块名称';

COMMENT ON COLUMN "TSYS_MENUS"."FLAG" IS
'标志';

COMMENT ON COLUMN "TSYS_MENUS".CREATETIME IS
'创建时间';

COMMENT ON COLUMN "TSYS_MENUS".UPDATETIME IS
'更新时间';

COMMENT ON COLUMN "TSYS_MENUS".USERID IS
'用户ID';

COMMENT ON COLUMN "TSYS_MENUS".USERGUID IS
'用户GUID';

COMMENT ON COLUMN "TSYS_MENUS"."ORGANIZATIONALGUID" IS
'组织机构GUID';

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
'组织机构表';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."OGNGUID" IS
'机构GUID';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."PARENTGUID" IS
'父ID';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL".ID IS
'编号';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."NAME" IS
'名称';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."CAPTION" IS
'中文名称';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL".CREATETIME IS
'创建时间';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL".UPDATETIME IS
'更新时间';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL".USERID IS
'用户ID';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL".USERGUID IS
'用户GUID';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."ORGANIZATIONALGUID" IS
'组织机构GUID';

COMMENT ON COLUMN "TSYS_ORGANIZATIONAL"."FLAG" IS
'标志';

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
  ('A753205F97944B4BB68C638CDB3A2C8E','7D2BE191289047F0BF57ADA4F7CDF04D','000001', 'office', '总经理办公室', SYSDATE, SYSDATE, SYS_GUID(), SYS_GUID(), SYS_GUID(), 1);

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
'岗位权限表';

COMMENT ON COLUMN "TSYS_POSPURVIEWS"."EPMGUID" IS
'权限菜单GUID';

COMMENT ON COLUMN "TSYS_POSPURVIEWS"."POSGUID" IS
'岗位GUID';

COMMENT ON COLUMN "TSYS_POSPURVIEWS".CREATETIME IS
'创建时间';

COMMENT ON COLUMN "TSYS_POSPURVIEWS".UPDATETIME IS
'更新时间';

COMMENT ON COLUMN "TSYS_POSPURVIEWS".USERID IS
'用户ID';

COMMENT ON COLUMN "TSYS_POSPURVIEWS"."ORGANIZATIONALGUID" IS
'组织机构GUID';

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
'岗位表';

COMMENT ON COLUMN "TSYS_POSITION"."POSGUID" IS
'岗位GUID';

COMMENT ON COLUMN "TSYS_POSITION"."PARENTGUID" IS
'父ID';

COMMENT ON COLUMN "TSYS_POSITION"."CAPTION" IS
'中文名称';

COMMENT ON COLUMN "TSYS_POSITION"."NAME" IS
'名称';

COMMENT ON COLUMN "TSYS_POSITION".CREATETIME IS
'创建时间';

COMMENT ON COLUMN "TSYS_POSITION".UPDATETIME IS
'更新时间';

COMMENT ON COLUMN "TSYS_POSITION".USERID IS
'用户ID';

COMMENT ON COLUMN "TSYS_POSITION".USERGUID IS
'用户GUID';

COMMENT ON COLUMN "TSYS_POSITION"."ORGANIZATIONALGUID" IS
'组织机构GUID';

COMMENT ON COLUMN "TSYS_POSITION"."FLAG" IS
'标志';

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
  ('55003E6C81F449129E29B16671DBB82C','46A67692E7A446558F58BE555F9038FE','超级管理员','管理员',SYSDATE, SYSDATE, SYS_GUID(), SYS_GUID(), SYS_GUID(), 1);

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
'权限菜单表';

COMMENT ON COLUMN "TSYS_PURMENUS"."EPMGUID" IS
'权限菜单GUID';

COMMENT ON COLUMN "TSYS_PURMENUS"."MENUGUID" IS
'菜单GUID';

COMMENT ON COLUMN "TSYS_PURMENUS".UNCGUID IS
'功能GUID';

COMMENT ON COLUMN "TSYS_PURMENUS".CREATETIME IS
'创建时间';

COMMENT ON COLUMN "TSYS_PURMENUS".USERGUID IS
'用户GUID';

COMMENT ON COLUMN "TSYS_PURMENUS".USERID IS
'用户ID';

COMMENT ON COLUMN "TSYS_PURMENUS"."ORGANIZATIONALGUID" IS
'组织机构GUID';

COMMENT ON COLUMN "TSYS_PURMENUS"."ENABLED" IS
'使用';

COMMENT ON COLUMN "TSYS_PURMENUS"."VISIBLED" IS
'显示';

COMMENT ON COLUMN "TSYS_PURMENUS"."FLAG" IS
'标志';

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
'表集合';

COMMENT ON COLUMN "TSYS_TABLES"."TABGUID" IS
'表GUID';

COMMENT ON COLUMN "TSYS_TABLES"."NAME" IS
'名称';

COMMENT ON COLUMN "TSYS_TABLES"."CAPTION" IS
'中文名称';

COMMENT ON COLUMN "TSYS_TABLES".CREATETIME IS
'创建时间';

COMMENT ON COLUMN "TSYS_TABLES".UPDATETIME IS
'更新时间';

COMMENT ON COLUMN "TSYS_TABLES".USERID IS
'用户ID';

COMMENT ON COLUMN "TSYS_TABLES".USERGUID IS
'用户GUID';

COMMENT ON COLUMN "TSYS_TABLES"."ORGANIZATIONALGUID" IS
'组织机构GUID';

COMMENT ON COLUMN "TSYS_TABLES"."FLAG" IS
'标志';

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
'模块表';

COMMENT ON COLUMN "TSYS_MODALS"."MODALGUID" IS
'模块GUID';

COMMENT ON COLUMN "TSYS_MODALS".ID IS
'编号';

COMMENT ON COLUMN "TSYS_MODALS"."NAME" IS
'名称';

COMMENT ON COLUMN "TSYS_MODALS"."CAPTION" IS
'中文名称';

COMMENT ON COLUMN "TSYS_MODALS"."FILENAME" IS
'文件名';

COMMENT ON COLUMN "TSYS_MODALS"."FUNCTIONING" IS
'功能';

COMMENT ON COLUMN "TSYS_MODALS"."FLAG" IS
'标志';

COMMENT ON COLUMN "TSYS_MODALS".CREATETIME IS
'创建时间';

COMMENT ON COLUMN "TSYS_MODALS".USERGUID IS
'用户GUID';

COMMENT ON COLUMN "TSYS_MODALS".USERID IS
'用户ID';

COMMENT ON COLUMN "TSYS_MODALS"."ORGANIZATIONALGUID" IS
'组织机构GUID';

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
'公司信息';

COMMENT ON COLUMN "TSYS_COMPANY"."COMPANYGUID" IS
'公司GUID';

COMMENT ON COLUMN "TSYS_COMPANY"."INCORPORATOR" IS
'法人代表';

COMMENT ON COLUMN "TSYS_COMPANY"."QUALITY" IS
'公司性质';

COMMENT ON COLUMN "TSYS_COMPANY"."FUNDING" IS
'注册资金';

COMMENT ON COLUMN "TSYS_COMPANY"."ADDRESS" IS
'地址';

COMMENT ON COLUMN "TSYS_COMPANY"."CAPTION" IS
'中文名称';

COMMENT ON COLUMN "TSYS_COMPANY"."NAME" IS
'名称';

COMMENT ON COLUMN "TSYS_COMPANY".CREATETIME IS
'创建时间';

COMMENT ON COLUMN "TSYS_COMPANY".UPDATETIME IS
'更新时间';

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
                    UPDATETIME) VALUES(SYS_GUID(),'张三','私营',200,'XXX省XX市XXX公司','动力信息技术有限公司','动力科技',SYSDATE,SYSDATE);

