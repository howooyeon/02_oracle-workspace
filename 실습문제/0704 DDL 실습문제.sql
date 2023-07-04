--�ǽ�����--

--�������� ���α׷��� ����� ���� ���̺��� �����

--�̶�, �������ǿ� �̸��� �ο��� ��

-- �� �÷��� �ּ��ޱ�



--1. ���ǻ�鿡 ���� �����͸� ��� ���� ���ǻ� ���̺�(TB_PUBLISHER)
--�÷�: PUB_NO(���ǻ��ȣ) --�⺻Ű(PUBLISHER_PK)

-- PUB_NAME(���ǻ��) --NOT NULL(PUBLICHSER_NN)

-- PHONE(���ǻ���ȭ��ȣ) --�������� ����

--3�� ������ ���� ������ �߰��ϱ�

CREATE TABLE TB_PUBLISHER(
 PUB_NO NUMBER CONSTRAINT TB_PUBLISHER PRIMARY KEY,
 PUB_NAME VARCHAR2(20) NOT NULL,
 PHONE VARCHAR2(14)
);

SELECT * FROM TB_PUBLISHER;

INSERT INTO TB_PUBLISHER VALUES (213, '�������ǻ�', '02-3333-4444');
INSERT INTO TB_PUBLISHER VALUES (214, '�������ǻ�', '02-4444-5555');
INSERT INTO TB_PUBLISHER VALUES (215, '�������ǻ�', '02-6666-7777');

DROP TABLE TB_BOOK;
DROP TABLE TB_PUBLISHER;

--2. �����鿡 ���� �����͸� ��� ���� ���� ���̺�(TB_BOOK)
CREATE TABLE TB_BOOK (
    BK_NO NUMBER CONSTRAINT BOOK_PK PRIMARY KEY,
    BK_TITLE VARCHAR2(50) CONSTRAINT BOOK_NN_TITLE NOT NULL,
    BK_AUTHOR VARCHAR2(20) CONSTRAINT BOOK_NN_AUTHOR NOT NULL,
    BK_PRICE NUMBER,
    BK_STOCK NUMBER DEFAULT 1,
    BK_PUB_NO NUMBER REFERENCES TB_PUBLISHER
);

--5�� ������ ���� ������ �߰��ϱ�
INSERT INTO TB_BOOK VALUES (1, '������ ��������?', '���巹 ������', 12000, 20, 213);
INSERT INTO TB_BOOK VALUES (2, '�Ǿ����Դϴ�. ���ϱ� �Ⱦ���', '����', 15000, 182, 214);
INSERT INTO TB_BOOK VALUES (3, '�������� ������ȣ��', '������', 13000, 21, 214);
INSERT INTO TB_BOOK VALUES (4, '���ϸ��� ���߷�', '�����ϸ�', 18800, 54, 215);
INSERT INTO TB_BOOK VALUES (5, '�ּ��� ���ϸ� �״´�', 'Ȳ����', 13000, 33, 215);

SELECT * FROM TB_BOOK;

--3. ȸ���� ���� �����͸� ��� ���� ȸ�� ���̺�(TB_MEMBER)
CREATE TABLE TB_MEMBER(
 MEMBER_NO NUMBER CONSTRAINT MEMBER_PK PRIMARY KEY,
 MEMBER_ID VARCHAR2(20),
 MEMBER_PWD VARCHAR2(20) CONSTRAINT MEMBER_NN_PWD NOT NULL,
 MEMBER_NAME VARCHAR2(20) CONSTRAINT MEMBER_NN_NAME NOT NULL
);

--�÷���: MEMBER_NO(ȸ����ȣ) --�⺻Ű(MEMBER_PK)

-- MEMBER_ID(���̵�) --�ߺ�����(MEMBER_UQ)
--MEMBER_PWD(��й�ȣ) NOT NULL(MEMBER_NN_PWD)
--MEMBER_NAME(ȸ����) NOT NULL(MEMBER_NN_NAME)

--GENDER(����) 'M' �Ǵ� 'F'�� �Էµǵ��� ����(MEMBER_CK_GEN)

--ADDRESS(�ּ�)

--PHONE(����ó)

--STATUS(Ż�𿩺�) --�⺻������ 'N' �׸��� 'Y' Ȥ�� 'N'���� �Էµǵ��� ��������(MEMBER_CK_STA)

--ENROLL_DATE(������) --�⺻������ SYSDATE, NOT NULL ����(MEMBER_NN_EN)

--5�� ������ ���� ������ �߰��ϱ�






--4. ������ �뿩�� ȸ���� ���� �����͸� ��� ���� �뿩��� ���̺�(TB_RENT)

--�÷�:

--RENT_NO(�뿩��ȣ) --�⺻Ű(RENT_PK)

--RENT_MEM_NO(�뿩ȸ����ȣ) --�ܷ�Ű(RENT_FK_MEM) TB_MEMBER�� �����ϵ���

--�̶� �θ����� ���� �� NULL���� �ǵ��� �ɼ� ����

--RENT_BOOK_NO(�뿩������ȣ) --�ܷ�Ű(RENT_FK_BOOK) TB_BOOK�� �����ϵ���

--�̶� �θ����� ���� �� NULL���� �ǵ��� �ɼǼ���

--RENT_DATE(�뿩��) --�⺻�� SYSDATE

--���õ����� 3������ �߰��ϱ�





--2�� ������ �뿩�� ȸ���� �̸�, ���̵�, �뿩��, �ݳ�������(�뿩��+7)�� ��ȸ�Ͻÿ�.





