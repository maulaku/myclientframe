--������ռ� MyErp
/*
��ʼ��Ϣ
���ݿⲿ��: ȫ�� orcl   orcl/orcl;[�û��������];
�����ռ�: myerp
�û���: sys/sys[�����û�]  developer/developer[������Ա];
*/


CREATE SMALLFILE TABLESPACE "MYERP" DATAFILE 'C:\ORACLE\PRODUCT\10.2.0\ORADATA\ORCL\myerp' SIZE 100M AUTOEXTEND ON NEXT 1000K MAXSIZE UNLIMITED LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;

--�����û��� DEVELOPER / DEVELOPER
CREATE USER "DEVELOPER" PROFILE "DEFAULT" IDENTIFIED BY "developer" DEFAULT TABLESPACE "MYERP" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;
--�����ɫȨ��
GRANT "CONNECT" TO "DEVELOPER";
GRANT "DBA" TO "DEVELOPER";
GRANT "RESOURCE" TO "DEVELOPER";

--��½ DEVELOPER
connect developer/developer@orcl;
--�����û���ʽ��½
--connect sys/sys@orcl as sysdba;
