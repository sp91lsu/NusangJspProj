
/*테이블 스페이스 생성*/
CREATE TABLESPACE ADMIN DATAFILE 'C:\oraclexe\app\oracle\oradata\jspProj\jspProj.dbf' SIZE  500M ;

/*유저 생성*/
CREATE USER NUSANGUSER IDENTIFIED BY 1234 DEFAULT TABLESPACE ADMIN TEMPORARY TABLESPACE TEMP;

/*권한 주기*/
GRANT connect, resource, dba TO NUSANGUSER;

