--------------------------------------------------------
--  파일이 생성됨 - 월요일-11월-09-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table WATCHLIST
--------------------------------------------------------
drop table "NUSANGUSER"."WATCHLIST" CASCADE CONSTRAINTS;
  CREATE TABLE "NUSANGUSER"."WATCHLIST" 
   (	"USERNO" NUMBER DEFAULT 1, 
	"POSTNO" NUMBER, 
	"WATCHLISTNO" NUMBER, 
	"REGDATE" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN" ;
REM INSERTING into NUSANGUSER.WATCHLIST
SET DEFINE OFF;
Insert into NUSANGUSER.WATCHLIST (USERNO,POSTNO,WATCHLISTNO,REGDATE) values (6,2,1,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.WATCHLIST (USERNO,POSTNO,WATCHLISTNO,REGDATE) values (6,3,2,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.WATCHLIST (USERNO,POSTNO,WATCHLISTNO,REGDATE) values (6,9,14,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.WATCHLIST (USERNO,POSTNO,WATCHLISTNO,REGDATE) values (6,1,4,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.WATCHLIST (USERNO,POSTNO,WATCHLISTNO,REGDATE) values (7,5,5,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.WATCHLIST (USERNO,POSTNO,WATCHLISTNO,REGDATE) values (2,1,13,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.WATCHLIST (USERNO,POSTNO,WATCHLISTNO,REGDATE) values (7,16,15,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.WATCHLIST (USERNO,POSTNO,WATCHLISTNO,REGDATE) values (7,8,7,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.WATCHLIST (USERNO,POSTNO,WATCHLISTNO,REGDATE) values (7,2,8,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.WATCHLIST (USERNO,POSTNO,WATCHLISTNO,REGDATE) values (1,15,9,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.WATCHLIST (USERNO,POSTNO,WATCHLISTNO,REGDATE) values (1,5,11,to_date('20/11/09','RR/MM/DD'));
Insert into NUSANGUSER.WATCHLIST (USERNO,POSTNO,WATCHLISTNO,REGDATE) values (2,5,12,to_date('20/11/09','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index SYS_C0010219
--------------------------------------------------------

  CREATE UNIQUE INDEX "NUSANGUSER"."SYS_C0010219" ON "NUSANGUSER"."WATCHLIST" ("WATCHLISTNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN" ;
--------------------------------------------------------
--  DDL for Trigger TRI_WATCHLIST_WATCHLISTNO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "NUSANGUSER"."TRI_WATCHLIST_WATCHLISTNO" BEFORE INSERT ON WATCHLIST
FOR EACH ROW
BEGIN
	SELECT SEQ_WATCHLIST_WATCHLISTNO.nextval
	INTO :new.WATCHLISTNO
	FROM dual;
END;


/
ALTER TRIGGER "NUSANGUSER"."TRI_WATCHLIST_WATCHLISTNO" ENABLE;
--------------------------------------------------------
--  Constraints for Table WATCHLIST
--------------------------------------------------------

  ALTER TABLE "NUSANGUSER"."WATCHLIST" ADD CONSTRAINT "SYS_C0010219" PRIMARY KEY ("WATCHLISTNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN"  ENABLE;
  ALTER TABLE "NUSANGUSER"."WATCHLIST" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."WATCHLIST" MODIFY ("WATCHLISTNO" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."WATCHLIST" MODIFY ("POSTNO" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."WATCHLIST" MODIFY ("USERNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table WATCHLIST
--------------------------------------------------------

  ALTER TABLE "NUSANGUSER"."WATCHLIST" ADD CONSTRAINT "SYS_C0010232" FOREIGN KEY ("POSTNO")
	  REFERENCES "NUSANGUSER"."SELLPOST" ("POSTNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "NUSANGUSER"."WATCHLIST" ADD CONSTRAINT "SYS_C0010237" FOREIGN KEY ("USERNO")
	  REFERENCES "NUSANGUSER"."NUSER" ("USERNO") ON DELETE CASCADE ENABLE;
