--------------------------------------------------------
--  ÆÄÀÏÀÌ »ý¼ºµÊ - ¿ù¿äÀÏ-11¿ù-09-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table POST_PICTURE
--------------------------------------------------------

  CREATE TABLE "NUSANGUSER"."POST_PICTURE" 
   (	"P_1" VARCHAR2(50 BYTE), 
	"P_2" VARCHAR2(50 BYTE), 
	"P_3" VARCHAR2(50 BYTE), 
	"P_4" VARCHAR2(50 BYTE), 
	"P_5" VARCHAR2(50 BYTE), 
	"POST_PICNO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN" ;
REM INSERTING into NUSANGUSER.POST_PICTURE
SET DEFINE OFF;
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('ÇÁ·¹½Ã¿À_°¡Á×.jpg',null,null,null,null,5);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('unnamed1.jpg',null,null,null,null,6);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('21388210313.20191126153155.jpg',null,null,null,null,7);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('aaa1.JPG',null,null,null,null,8);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('Áö¼¡11.JPG','½Ã°è21.JPG',null,null,null,9);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('19071552455.20190504130536.jpg',null,null,null,null,10);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('18ef82d261.jpg',null,null,null,null,11);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('Ç»¸¶·ÕÆÐµù.jpg',null,null,null,null,12);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('unnamed (1).jpg',null,null,null,null,13);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('20201109_102055.png',null,null,null,null,14);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('Áö¼¡12.jpg','aaa1.jpg',null,null,null,15);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('20201109_102723.png',null,null,null,null,16);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('°î¹°½¦ÀÌÅ©3.jpg','°î¹°½¦ÀÌÅ©2.jpg','°î¹°½¦ÀÌÅ©1.jpg',null,null,17);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('aaaaaaaaa4.jpg',null,null,null,null,18);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('Ä«½Ã¿À½Ã°è.jpg',null,null,null,null,19);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('301005355_HG53249.jpg',null,null,null,null,1);
Insert into NUSANGUSER.POST_PICTURE (P_1,P_2,P_3,P_4,P_5,POST_PICNO) values ('Ä¸Ã³21.PNG','Ä¸Ã³3.PNG','¿ì·¹Åº½Ã°è.PNG',null,null,2);
--------------------------------------------------------
--  DDL for Index SYS_C0017244
--------------------------------------------------------

  CREATE UNIQUE INDEX "NUSANGUSER"."SYS_C0017244" ON "NUSANGUSER"."POST_PICTURE" ("POST_PICNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN" ;
--------------------------------------------------------
--  DDL for Trigger TRI_POST_PICTURE_POST_PICNO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "NUSANGUSER"."TRI_POST_PICTURE_POST_PICNO" BEFORE INSERT ON POST_PICTURE
FOR EACH ROW
BEGIN
	SELECT SEQ_POST_PICTURE_POST_PICNO.nextval
	INTO :new.POST_PICNO
	FROM dual;
END;


/
ALTER TRIGGER "NUSANGUSER"."TRI_POST_PICTURE_POST_PICNO" ENABLE;
--------------------------------------------------------
--  Constraints for Table POST_PICTURE
--------------------------------------------------------

  ALTER TABLE "NUSANGUSER"."POST_PICTURE" ADD PRIMARY KEY ("POST_PICNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN"  ENABLE;
  ALTER TABLE "NUSANGUSER"."POST_PICTURE" MODIFY ("POST_PICNO" NOT NULL ENABLE);
