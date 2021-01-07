--------------------------------------------------------
--  파일이 생성됨 - 월요일-11월-09-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PAYMENT_MARKET
--------------------------------------------------------
drop table "NUSANGUSER"."PAYMENT_MARKET" CASCADE CONSTRAINTS;
  CREATE TABLE "NUSANGUSER"."PAYMENT_MARKET" 
   (	"PH_MARKETNO" NUMBER, 
	"PAYMENTTYPE" VARCHAR2(10 BYTE), 
	"STATE" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"USERNO" NUMBER DEFAULT 1, 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"IMP_UID" VARCHAR2(500 BYTE), 
	"PRICE" NUMBER, 
	"POSTNO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN" ;
REM INSERTING into NUSANGUSER.PAYMENT_MARKET
SET DEFINE OFF;
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (3,'card',1,'게시글 등록 ',2,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,3);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (4,'card',1,'게시글 등록 ',1,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,4);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (5,'card',1,'게시글 등록 ',6,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,5);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (6,'card',1,'게시글 등록 ',2,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,6);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (7,'card',1,'게시글 등록 ',2,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,7);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (8,'card',1,'게시글 등록 ',6,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,8);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (9,'card',1,'게시글 등록 ',1,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,9);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (10,'card',0,'게시글 삭제',2,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,7);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (11,'card',0,'게시글 삭제',2,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,6);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (12,'card',1,'게시글 등록 ',7,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,10);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (13,'card',1,'게시글 등록 ',1,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,11);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (14,'card',1,'게시글 등록 ',6,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,12);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (15,'card',1,'게시글 등록 ',2,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,13);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (16,'card',1,'게시글 등록 ',6,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,14);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (17,'card',1,'게시글 등록 ',7,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,15);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (18,'card',1,'게시글 등록 ',2,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,16);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (19,'card',1,'게시글 등록 ',2,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,17);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (1,'card',1,'게시글 등록 ',1,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,1);
Insert into NUSANGUSER.PAYMENT_MARKET (PH_MARKETNO,PAYMENTTYPE,STATE,NAME,USERNO,REGDATE,IMP_UID,PRICE,POSTNO) values (2,'card',1,'게시글 등록 ',5,to_date('20/11/09','RR/MM/DD'),'uiduidtest',100,2);
--------------------------------------------------------
--  DDL for Index SYS_C0010188
--------------------------------------------------------

  CREATE UNIQUE INDEX "NUSANGUSER"."SYS_C0010188" ON "NUSANGUSER"."PAYMENT_MARKET" ("PH_MARKETNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN" ;
--------------------------------------------------------
--  DDL for Trigger TRI_PAYMENT_MARKET_PH_MARKETNO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "NUSANGUSER"."TRI_PAYMENT_MARKET_PH_MARKETNO" BEFORE INSERT ON PAYMENT_MARKET
FOR EACH ROW
BEGIN
	SELECT SEQ_PAYMENT_MARKET_PH_MARKETNO.nextval
	INTO :new.PH_MARKETNO
	FROM dual;
END;


/
ALTER TRIGGER "NUSANGUSER"."TRI_PAYMENT_MARKET_PH_MARKETNO" ENABLE;
--------------------------------------------------------
--  Constraints for Table PAYMENT_MARKET
--------------------------------------------------------

  ALTER TABLE "NUSANGUSER"."PAYMENT_MARKET" ADD CONSTRAINT "SYS_C0010188" PRIMARY KEY ("PH_MARKETNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ADMIN"  ENABLE;
  ALTER TABLE "NUSANGUSER"."PAYMENT_MARKET" MODIFY ("POSTNO" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."PAYMENT_MARKET" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."PAYMENT_MARKET" MODIFY ("IMP_UID" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."PAYMENT_MARKET" MODIFY ("REGDATE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."PAYMENT_MARKET" MODIFY ("USERNO" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."PAYMENT_MARKET" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."PAYMENT_MARKET" MODIFY ("STATE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."PAYMENT_MARKET" MODIFY ("PAYMENTTYPE" NOT NULL ENABLE);
  ALTER TABLE "NUSANGUSER"."PAYMENT_MARKET" MODIFY ("PH_MARKETNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table PAYMENT_MARKET
--------------------------------------------------------

  ALTER TABLE "NUSANGUSER"."PAYMENT_MARKET" ADD CONSTRAINT "SYS_C0010233" FOREIGN KEY ("USERNO")
	  REFERENCES "NUSANGUSER"."NUSER" ("USERNO") ON DELETE CASCADE ENABLE;
