--------------------------------------------------------
--  ������ ������ - ������-11��-09-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table NUSER
--------------------------------------------------------
drop table "NUSANGUSER"."NUSER" CASCADE CONSTRAINTS;
  CREATE TABLE "NUSANGUSER"."NUSER" 
   (	"USERNO" NUMBER DEFAULT 1, 
	"USERID" VARCHAR2(50 CHAR), 
	"USERNAME" VARCHAR2(50 CHAR), 
	"PASSWORD" VARCHAR2(50 BYTE), 
	"ROLE" VARCHAR2(30 BYTE), 
	"LOGINTYPE" VARCHAR2(10 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"PICTURE" VARCHAR2(500 CHAR) DEFAULT 'profile.png', 
	"LOCATIONNO" NUMBER, 
	"VIEW_DISTANCE" NUMBER DEFAULT 5, 
	"NICKNAME" VARCHAR2(60 BYTE), 
	"STAR_CNT" NUMBER, 
	"EVALUATION_CNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN" ;
REM INSERTING into NUSANGUSER.NUSER
SET DEFINE OFF;
Insert into NUSANGUSER.NUSER (USERNO,USERID,USERNAME,PASSWORD,ROLE,LOGINTYPE,EMAIL,REGDATE,PICTURE,LOCATIONNO,VIEW_DISTANCE,NICKNAME,STAR_CNT,EVALUATION_CNT) values (7,'test1234','�׽�Ʈ���̵�','asdfsadf1!','ROLE_USER','NORMAL','zzangkyo10@naver.com',to_date('20/11/09','RR/MM/DD'),'profile.png',16,10,'�׽�Ʈ���̵�',null,0);
Insert into NUSANGUSER.NUSER (USERNO,USERID,USERNAME,PASSWORD,ROLE,LOGINTYPE,EMAIL,REGDATE,PICTURE,LOCATIONNO,VIEW_DISTANCE,NICKNAME,STAR_CNT,EVALUATION_CNT) values (4,'yjw9303@naver.com_52198747','������','Nusang','ROLE_USER','NAVER','yjw9303@naver.com',to_date('20/11/09','RR/MM/DD'),'profile.png',2,5,'������',null,0);
Insert into NUSANGUSER.NUSER (USERNO,USERID,USERNAME,PASSWORD,ROLE,LOGINTYPE,EMAIL,REGDATE,PICTURE,LOCATIONNO,VIEW_DISTANCE,NICKNAME,STAR_CNT,EVALUATION_CNT) values (5,'kakao_1507017697','���̽�ȯ','Nusang','ROLE_USER','KAKAO','tmdghks7836@naver.com',to_date('20/11/09','RR/MM/DD'),'profile.png',10,10,'���̽�ȯ',null,0);
Insert into NUSANGUSER.NUSER (USERNO,USERID,USERNAME,PASSWORD,ROLE,LOGINTYPE,EMAIL,REGDATE,PICTURE,LOCATIONNO,VIEW_DISTANCE,NICKNAME,STAR_CNT,EVALUATION_CNT) values (6,'sp91lsu@nate.com_42355716','�̼���','Nusang','ROLE_USER','NAVER','sp91lsu@nate.com',to_date('20/11/09','RR/MM/DD'),'profile.png',6,10,'�̼���',null,0);
Insert into NUSANGUSER.NUSER (USERNO,USERID,USERNAME,PASSWORD,ROLE,LOGINTYPE,EMAIL,REGDATE,PICTURE,LOCATIONNO,VIEW_DISTANCE,NICKNAME,STAR_CNT,EVALUATION_CNT) values (1,'kakao_1511014618','������','Nusang','ROLE_USER','KAKAO','yjw9303@naver.com',to_date('20/11/09','RR/MM/DD'),'profile.png',1,10,'������',null,0);
Insert into NUSANGUSER.NUSER (USERNO,USERID,USERNAME,PASSWORD,ROLE,LOGINTYPE,EMAIL,REGDATE,PICTURE,LOCATIONNO,VIEW_DISTANCE,NICKNAME,STAR_CNT,EVALUATION_CNT) values (2,'kakao_1513998454','�ڼ���','Nusang','ROLE_USER','KAKAO','pppsh720@naver.com',to_date('20/11/09','RR/MM/DD'),'sun3.jpg',4,10,'�Ǹſ�ġ',null,0);
Insert into NUSANGUSER.NUSER (USERNO,USERID,USERNAME,PASSWORD,ROLE,LOGINTYPE,EMAIL,REGDATE,PICTURE,LOCATIONNO,VIEW_DISTANCE,NICKNAME,STAR_CNT,EVALUATION_CNT) values (3,'pppsh720@naver.com_66810510','�ڼ���','Nusang','ROLE_USER','NAVER','pppsh720@naver.com',to_date('20/11/09','RR/MM/DD'),'profile.png',null,5,'�ڼ���',null,0);
--------------------------------------------------------
--  DDL for Index SYS_C009884
--------------------------------------------------------

  CREATE UNIQUE INDEX "NUSANGUSER"."SYS_C009884" ON "NUSANGUSER"."NUSER" ("USERNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN" ;
--------------------------------------------------------
--  DDL for Index SYS_C0017265
--------------------------------------------------------

  CREATE UNIQUE INDEX "NUSANGUSER"."SYS_C0017265" ON "NUSANGUSER"."NUSER" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN" ;
--------------------------------------------------------
--  DDL for Trigger TRI_NUSER_USERNO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "NUSANGUSER"."TRI_NUSER_USERNO" BEFORE INSERT ON NUSER
FOR EACH ROW
BEGIN
	SELECT SEQ_NUSER_USERNO.nextval
	INTO :new.USERNO
	FROM dual;
END;


/
ALTER TRIGGER "NUSANGUSER"."TRI_NUSER_USERNO" ENABLE;
--------------------------------------------------------
--  Constraints for Table NUSER
--------------------------------------------------------

  ALTER TABLE "NUSANGUSER"."NUSER" ADD UNIQUE ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN"  ENABLE;
  ALTER TABLE "NUSANGUSER"."NUSER" ADD CONSTRAINT "SYS_C009884" PRIMARY KEY ("USERNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN"  ENABLE;
  ALTER TABLE "NUSANGUSER"."NUSER" MODIFY ("EVALUATION_CNT" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."NUSER" MODIFY ("NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."NUSER" MODIFY ("VIEW_DISTANCE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."NUSER" MODIFY ("PICTURE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."NUSER" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."NUSER" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."NUSER" MODIFY ("LOGINTYPE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."NUSER" MODIFY ("ROLE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."NUSER" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."NUSER" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."NUSER" MODIFY ("USERID" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."NUSER" MODIFY ("USERNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table NUSER
--------------------------------------------------------

  ALTER TABLE "NUSANGUSER"."NUSER" ADD FOREIGN KEY ("LOCATIONNO")
	  REFERENCES "NUSANGUSER"."LOCATION" ("LOCATIONNO") ON DELETE CASCADE ENABLE;
