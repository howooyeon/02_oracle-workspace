--실습문제--

--도서관리 프로그램을 만들기 위한 테이블을 만들기

--이때, 제약조건에 이름을 부여할 것

-- 각 컬럼에 주석달기



--1. 출판사들에 대한 데이터를 담기 위한 출판사 테이블(TB_PUBLISHER)
--컬럼: PUB_NO(출판사번호) --기본키(PUBLISHER_PK)

-- PUB_NAME(출판사명) --NOT NULL(PUBLICHSER_NN)

-- PHONE(출판사전화번호) --제약조건 없음

--3개 정도의 샘플 데이터 추가하기

CREATE TABLE TB_PUBLISHER(
 PUB_NO NUMBER CONSTRAINT TB_PUBLISHER PRIMARY KEY,
 PUB_NAME VARCHAR2(20) NOT NULL,
 PHONE VARCHAR2(14)
);

SELECT * FROM TB_PUBLISHER;

INSERT INTO TB_PUBLISHER VALUES (213, '뫄뫄출판사', '02-3333-4444');
INSERT INTO TB_PUBLISHER VALUES (214, '오잉출판사', '02-4444-5555');
INSERT INTO TB_PUBLISHER VALUES (215, '에엥출판사', '02-6666-7777');

DROP TABLE TB_BOOK;
DROP TABLE TB_PUBLISHER;

--2. 도서들에 대한 데이터를 담기 위한 도서 테이블(TB_BOOK)
CREATE TABLE TB_BOOK (
    BK_NO NUMBER CONSTRAINT BOOK_PK PRIMARY KEY,
    BK_TITLE VARCHAR2(50) CONSTRAINT BOOK_NN_TITLE NOT NULL,
    BK_AUTHOR VARCHAR2(20) CONSTRAINT BOOK_NN_AUTHOR NOT NULL,
    BK_PRICE NUMBER,
    BK_STOCK NUMBER DEFAULT 1,
    BK_PUB_NO NUMBER REFERENCES TB_PUBLISHER
);

--5개 정도의 샘플 데이터 추가하기
INSERT INTO TB_BOOK VALUES (1, '제목은 뭐로하지?', '엉드레 버나드', 12000, 20, 213);
INSERT INTO TB_BOOK VALUES (2, '실어증입니다. 일하기 싫어증', '양경수', 15000, 182, 214);
INSERT INTO TB_BOOK VALUES (3, '오은영의 마음수호대', '오은영', 13000, 21, 214);
INSERT INTO TB_BOOK VALUES (4, '도둑맞은 집중력', '요한하리', 18800, 54, 215);
INSERT INTO TB_BOOK VALUES (5, '최선을 다하면 죽는다', '황선우', 13000, 33, 215);

SELECT * FROM TB_BOOK;

--3. 회원에 대한 데이터를 담기 위한 회원 테이블(TB_MEMBER)
CREATE TABLE TB_MEMBER(
 MEMBER_NO NUMBER CONSTRAINT MEMBER_PK PRIMARY KEY,
 MEMBER_ID VARCHAR2(20),
 MEMBER_PWD VARCHAR2(20) CONSTRAINT MEMBER_NN_PWD NOT NULL,
 MEMBER_NAME VARCHAR2(20) CONSTRAINT MEMBER_NN_NAME NOT NULL
);

--컬럼명: MEMBER_NO(회원번호) --기본키(MEMBER_PK)

-- MEMBER_ID(아이디) --중복금지(MEMBER_UQ)
--MEMBER_PWD(비밀번호) NOT NULL(MEMBER_NN_PWD)
--MEMBER_NAME(회원명) NOT NULL(MEMBER_NN_NAME)

--GENDER(성별) 'M' 또는 'F'로 입력되도록 제한(MEMBER_CK_GEN)

--ADDRESS(주소)

--PHONE(연락처)

--STATUS(탈퇴여부) --기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건(MEMBER_CK_STA)

--ENROLL_DATE(가입일) --기본값으로 SYSDATE, NOT NULL 조건(MEMBER_NN_EN)

--5개 정도의 샘플 데이터 추가하기






--4. 도서를 대여한 회원에 대한 데이터를 담기 위한 대여목록 테이블(TB_RENT)

--컬럼:

--RENT_NO(대여번호) --기본키(RENT_PK)

--RENT_MEM_NO(대여회원번호) --외래키(RENT_FK_MEM) TB_MEMBER와 참조하도록

--이때 부모데이터 삭제 시 NULL값이 되도록 옵션 설정

--RENT_BOOK_NO(대여도서번호) --외래키(RENT_FK_BOOK) TB_BOOK와 참조하도록

--이때 부모데이터 삭제 시 NULL값이 되도록 옵션설정

--RENT_DATE(대여일) --기본값 SYSDATE

--샘플데이터 3개정도 추가하기





--2번 도서를 대여한 회원의 이름, 아이디, 대여일, 반납예정일(대여일+7)을 조회하시오.





