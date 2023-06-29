-------------- 저장
-- 계정명 DDL
SELECT * FROM DBA_USERS;
CREATE USER ddl identified by ddl;
GRANT CONNECT, RESOURCE TO ddl;