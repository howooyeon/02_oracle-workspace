CREATE TABLE TB_USER(
USER_NO NUMBER PRIMARY KEY,
USER_ID VARCHAR(20) UNIQUE NOT NULL,
USER_NAME VARCHAR2(50) NOT NULL,
USER_AGE NUMBER NOT NULL);

CREATE SEQUENCE SEQ_UNO1
START WITH 1
INCREMENT BY 1
NOCACHE;

commit;

SELECT * FROM MEMBER;

UPDATE MEMBER
 SET STATUS = 'Y'
 WHERE USER_NO = 5;
 
 
