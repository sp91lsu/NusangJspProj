
/* Drop Triggers */

DROP TRIGGER TRI_BUY_RESERVATION_RESERNO;
DROP TRIGGER TRI_NUSER_USERNO;
DROP TRIGGER TRI_PAYMENT_MARKET_PH_MARKETNO;
DROP TRIGGER TRI_PAYMENT_USER_PH_USERNO;
DROP TRIGGER TRI_REPLY_REPLYNO;
DROP TRIGGER TRI_SELLPOST_POSTNO;
DROP TRIGGER TRI_WATCHLIST_WATCHLISTNO;



/* Drop Tables */

DROP TABLE BUY_RESERVATION CASCADE CONSTRAINTS;
DROP TABLE NUSANGUSER.PAYMENT_MARKET CASCADE CONSTRAINTS;
DROP TABLE NUSANGUSER.PAYMENT_USER CASCADE CONSTRAINTS;
DROP TABLE NUSANGUSER.REPLY CASCADE CONSTRAINTS;
DROP TABLE NUSANGUSER.WATCHLIST CASCADE CONSTRAINTS;
DROP TABLE NUSANGUSER.SELLPOST CASCADE CONSTRAINTS;
DROP TABLE NUSANGUSER.NUSER CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_BUY_RESERVATION_RESERNO;
DROP SEQUENCE NUSANGUSER.SEQ_NUSER_USERNO;
DROP SEQUENCE NUSANGUSER.SEQ_PAYMENT_MARKET_PH_MARKETNO;
DROP SEQUENCE NUSANGUSER.SEQ_PAYMENT_USER_PH_USERNO;
DROP SEQUENCE NUSANGUSER.SEQ_REPLY_REPLYNO;
DROP SEQUENCE NUSANGUSER.SEQ_SELLPOST_POSTNO;
DROP SEQUENCE NUSANGUSER.SEQ_WATCHLIST_WATCHLISTNO;




/* Create Sequences */

CREATE SEQUENCE SEQ_BUY_RESERVATION_RESERNO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE NUSANGUSER.SEQ_NUSER_USERNO INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 1 CACHE 20;
CREATE SEQUENCE NUSANGUSER.SEQ_PAYMENT_MARKET_PH_MARKETNO INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 1 CACHE 20;
CREATE SEQUENCE NUSANGUSER.SEQ_PAYMENT_USER_PH_USERNO INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 1 CACHE 20;
CREATE SEQUENCE NUSANGUSER.SEQ_REPLY_REPLYNO INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 1 CACHE 20;
CREATE SEQUENCE NUSANGUSER.SEQ_SELLPOST_POSTNO INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 1 CACHE 20;
CREATE SEQUENCE NUSANGUSER.SEQ_WATCHLIST_WATCHLISTNO INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999 START WITH 1 CACHE 20;



/* Create Tables */

CREATE TABLE BUY_RESERVATION
(
	SELLPOSTNO number NOT NULL,
	USERNO number DEFAULT 1   NOT NULL,
	RESER_PRICE long NOT NULL,
	STATE nchar(20) NOT NULL,
	RESERNO number NOT NULL,
	REGDATE date NOT NULL,
	PRIMARY KEY (RESERNO)
);


CREATE TABLE NUSANGUSER.NUSER
(
	USERNO number DEFAULT 1   NOT NULL,
	USERID varchar2(50) NOT NULL UNIQUE,
	USERNAME varchar2(50) NOT NULL,
	PASSWORD varchar2(50) NOT NULL,
	ROLE varchar2(20) DEFAULT '''''''ROLE_USER'''' '' ' NOT NULL,
	LOGINTYPE varchar2(10 char) NOT NULL,
	EMAIL varchar2(50 char) NOT NULL,
	REGDATE date DEFAULT SYSDATE  NOT NULL,
	PICTURE blob,
	LATITUDE number,
	LONGTITUDE number,
	CONSTRAINT SYS_C009884 PRIMARY KEY (USERNO)
);


CREATE TABLE NUSANGUSER.PAYMENT_MARKET
(
	PH_MARKETNO number NOT NULL,
	PAYMENTTYPE varchar2(10 char) NOT NULL,
	STATE number NOT NULL,
	NAME nchar(10) NOT NULL,
	USERNO number DEFAULT 1   NOT NULL,
	REGDATE date DEFAULT SYSDATE,
	IMPORT_UUID nchar(20) NOT NULL,
	CONSTRAINT SYS_C0010188 PRIMARY KEY (PH_MARKETNO)
);


CREATE TABLE NUSANGUSER.PAYMENT_USER
(
	PH_USERNO number NOT NULL,
	PRODUCTNAME nchar(20) NOT NULL,
	PRICE long NOT NULL,
	USERNO number DEFAULT 1   NOT NULL,
	SELLSTATE nchar(10) NOT NULL,
	REGDATE date NOT NULL,
	BUSINESS_PARTNER number DEFAULT 1   NOT NULL,
	CONSTRAINT SYS_C0010196 PRIMARY KEY (PH_USERNO)
);


CREATE TABLE NUSANGUSER.REPLY
(
	REPLYNO number NOT NULL,
	USERNO number DEFAULT 1   NOT NULL,
	POSTNO number NOT NULL,
	TEXTBODY char(50 char) NOT NULL,
	REGDATE date DEFAULT SYSDATE  NOT NULL,
	STATE number DEFAULT 1  NOT NULL,
	CHILD_LEPLYNO number,
	CONSTRAINT SYS_C0010203 PRIMARY KEY (REPLYNO)
);


CREATE TABLE NUSANGUSER.SELLPOST
(
	POSTNO number NOT NULL,
	PICTURE blob NOT NULL,
	TITLE nchar(20) NOT NULL,
	BODYTEXT clob NOT NULL,
	LATITUDE number,
	LONGTITUDE number,
	PRICE long NOT NULL,
	PRODUCTNAME varchar2(20 char) NOT NULL,
	USERNO number DEFAULT 1   NOT NULL,
	REGDATE date DEFAULT SYSDATE  NOT NULL,
	CATEGORY nchar(20) NOT NULL,
	SELLSTATE nchar(10) NOT NULL,
	VIEWCNT number NOT NULL,
	VISIBLE number DEFAULT 1,
	CONSTRAINT SYS_C0010215 PRIMARY KEY (POSTNO)
);


CREATE TABLE NUSANGUSER.WATCHLIST
(
	USERNO number DEFAULT 1   NOT NULL,
	POSTNO number NOT NULL,
	WATCHLISTNO number NOT NULL,
	CONSTRAINT SYS_C0010219 PRIMARY KEY (WATCHLISTNO)
);



/* Create Foreign Keys */

ALTER TABLE BUY_RESERVATION
	ADD FOREIGN KEY (USERNO)
	REFERENCES NUSANGUSER.NUSER (USERNO)
;


ALTER TABLE NUSANGUSER.PAYMENT_MARKET
	ADD CONSTRAINT SYS_C0010233 FOREIGN KEY (USERNO)
	REFERENCES NUSANGUSER.NUSER (USERNO)
;


ALTER TABLE NUSANGUSER.PAYMENT_USER
	ADD CONSTRAINT SYS_C0010234 FOREIGN KEY (USERNO)
	REFERENCES NUSANGUSER.NUSER (USERNO)
;


ALTER TABLE NUSANGUSER.PAYMENT_USER
	ADD FOREIGN KEY (BUSINESS_PARTNER)
	REFERENCES NUSANGUSER.NUSER (USERNO)
;


ALTER TABLE NUSANGUSER.REPLY
	ADD CONSTRAINT SYS_C0010235 FOREIGN KEY (USERNO)
	REFERENCES NUSANGUSER.NUSER (USERNO)
;


ALTER TABLE NUSANGUSER.SELLPOST
	ADD CONSTRAINT SYS_C0010236 FOREIGN KEY (USERNO)
	REFERENCES NUSANGUSER.NUSER (USERNO)
;


ALTER TABLE NUSANGUSER.WATCHLIST
	ADD CONSTRAINT SYS_C0010237 FOREIGN KEY (USERNO)
	REFERENCES NUSANGUSER.NUSER (USERNO)
;


ALTER TABLE NUSANGUSER.REPLY
	ADD FOREIGN KEY (CHILD_LEPLYNO)
	REFERENCES NUSANGUSER.REPLY (REPLYNO)
;


ALTER TABLE BUY_RESERVATION
	ADD FOREIGN KEY (SELLPOSTNO)
	REFERENCES NUSANGUSER.SELLPOST (POSTNO)
;


ALTER TABLE NUSANGUSER.REPLY
	ADD CONSTRAINT SYS_C0010231 FOREIGN KEY (POSTNO)
	REFERENCES NUSANGUSER.SELLPOST (POSTNO)
;


ALTER TABLE NUSANGUSER.WATCHLIST
	ADD CONSTRAINT SYS_C0010232 FOREIGN KEY (POSTNO)
	REFERENCES NUSANGUSER.SELLPOST (POSTNO)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_BUY_RESERVATION_RESERNO BEFORE INSERT ON BUY_RESERVATION
FOR EACH ROW
BEGIN
	SELECT SEQ_BUY_RESERVATION_RESERNO.nextval
	INTO :new.RESERNO
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_NUSER_USERNO BEFORE INSERT ON NUSER
FOR EACH ROW
BEGIN
	SELECT SEQ_NUSER_USERNO.nextval
	INTO :new.USERNO
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_PAYMENT_MARKET_PH_MARKETNO BEFORE INSERT ON PAYMENT_MARKET
FOR EACH ROW
BEGIN
	SELECT SEQ_PAYMENT_MARKET_PH_MARKETNO.nextval
	INTO :new.PH_MARKETNO
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_PAYMENT_USER_PH_USERNO BEFORE INSERT ON PAYMENT_USER
FOR EACH ROW
BEGIN
	SELECT SEQ_PAYMENT_USER_PH_USERNO.nextval
	INTO :new.PH_USERNO
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_REPLY_REPLYNO BEFORE INSERT ON REPLY
FOR EACH ROW
BEGIN
	SELECT SEQ_REPLY_REPLYNO.nextval
	INTO :new.REPLYNO
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_SELLPOST_POSTNO BEFORE INSERT ON SELLPOST
FOR EACH ROW
BEGIN
	SELECT SEQ_SELLPOST_POSTNO.nextval
	INTO :new.POSTNO
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_WATCHLIST_WATCHLISTNO BEFORE INSERT ON WATCHLIST
FOR EACH ROW
BEGIN
	SELECT SEQ_WATCHLIST_WATCHLISTNO.nextval
	INTO :new.WATCHLISTNO
	FROM dual;
END;

/




