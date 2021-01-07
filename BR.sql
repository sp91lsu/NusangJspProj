--------------------------------------------------------
--  파일이 생성됨 - 월요일-11월-09-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BUY_RESERVATION
--------------------------------------------------------
drop table "NUSANGUSER"."BUY_RESERVATION" CASCADE CONSTRAINTS;
  CREATE TABLE "NUSANGUSER"."BUY_RESERVATION" 
   (	"SELLPOSTNO" NUMBER, 
	"USERNO" NUMBER DEFAULT 1, 
	"RESER_PRICE" NUMBER, 
	"STATE" NUMBER, 
	"RESERNO" NUMBER, 
	"REGDATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN" ;
REM INSERTING into NUSANGUSER.BUY_RESERVATION
SET DEFINE OFF;
Insert into NUSANGUSER.BUY_RESERVATION (SELLPOSTNO,USERNO,RESER_PRICE,STATE,RESERNO,REGDATE) values (2,6,120000,0,3,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.BUY_RESERVATION (SELLPOSTNO,USERNO,RESER_PRICE,STATE,RESERNO,REGDATE) values (9,6,25000,0,7,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.BUY_RESERVATION (SELLPOSTNO,USERNO,RESER_PRICE,STATE,RESERNO,REGDATE) values (11,7,500,0,8,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.BUY_RESERVATION (SELLPOSTNO,USERNO,RESER_PRICE,STATE,RESERNO,REGDATE) values (4,6,25000000,1,9,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.BUY_RESERVATION (SELLPOSTNO,USERNO,RESER_PRICE,STATE,RESERNO,REGDATE) values (8,7,3000,0,10,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.BUY_RESERVATION (SELLPOSTNO,USERNO,RESER_PRICE,STATE,RESERNO,REGDATE) values (1,6,23000,1,1,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.BUY_RESERVATION (SELLPOSTNO,USERNO,RESER_PRICE,STATE,RESERNO,REGDATE) values (3,6,34000,0,2,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.BUY_RESERVATION (SELLPOSTNO,USERNO,RESER_PRICE,STATE,RESERNO,REGDATE) values (4,7,200,0,4,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.BUY_RESERVATION (SELLPOSTNO,USERNO,RESER_PRICE,STATE,RESERNO,REGDATE) values (4,2,5000,0,5,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.BUY_RESERVATION (SELLPOSTNO,USERNO,RESER_PRICE,STATE,RESERNO,REGDATE) values (16,7,100000,0,6,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.BUY_RESERVATION (SELLPOSTNO,USERNO,RESER_PRICE,STATE,RESERNO,REGDATE) values (9,2,29000,0,11,to_date('20/11/09','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index SYS_C0012097
--------------------------------------------------------

  CREATE UNIQUE INDEX "NUSANGUSER"."SYS_C0012097" ON "NUSANGUSER"."BUY_RESERVATION" ("RESERNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN" ;
--------------------------------------------------------
--  DDL for Trigger TRI_BUY_RESERVATION_RESERNO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "NUSANGUSER"."TRI_BUY_RESERVATION_RESERNO" BEFORE INSERT ON BUY_RESERVATION
FOR EACH ROW
BEGIN
	SELECT SEQ_BUY_RESERVATION_RESERNO.nextval
	INTO :new.RESERNO
	FROM dual;
END;


/
ALTER TRIGGER "NUSANGUSER"."TRI_BUY_RESERVATION_RESERNO" ENABLE;
--------------------------------------------------------
--  Constraints for Table BUY_RESERVATION
--------------------------------------------------------

  ALTER TABLE "NUSANGUSER"."BUY_RESERVATION" ADD CONSTRAINT "SYS_C0012097" PRIMARY KEY ("RESERNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN"  ENABLE;
  ALTER TABLE "NUSANGUSER"."BUY_RESERVATION" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."BUY_RESERVATION" MODIFY ("RESERNO" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."BUY_RESERVATION" MODIFY ("STATE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."BUY_RESERVATION" MODIFY ("RESER_PRICE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."BUY_RESERVATION" MODIFY ("USERNO" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."BUY_RESERVATION" MODIFY ("SELLPOSTNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BUY_RESERVATION
--------------------------------------------------------

  ALTER TABLE "NUSANGUSER"."BUY_RESERVATION" ADD CONSTRAINT "SYS_C0012146" FOREIGN KEY ("USERNO")
	  REFERENCES "NUSANGUSER"."NUSER" ("USERNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "NUSANGUSER"."BUY_RESERVATION" ADD CONSTRAINT "SYS_C0012154" FOREIGN KEY ("SELLPOSTNO")
	  REFERENCES "NUSANGUSER"."SELLPOST" ("POSTNO") ON DELETE CASCADE ENABLE;
