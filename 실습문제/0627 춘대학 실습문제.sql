-- �ϴ� ����

-- �ϱ�ȴ�...�Ф�

SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_STUDENT;
SELECT * FROM TB_CLASS;
SELECT * FROM TB_CLASS_PROFESSOR;
SELECT * FROM TB_PROFESSOR;
SELECT * FROM TB_GRADE;

-- 1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭"0���� ǥ���ϵ��� �Ѵ�.
SELECT DEPARTMENT_NAME,CATEGORY
FROM TB_DEPARTMENT;


-- 2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ����Ѵ�.
SELECT DEPARTMENT_NAME||'�� ������' , CAPACITY||'�� �Դϴ�.'
FROM TB_DEPARTMENT;

-- 3. "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û�� ���Դ�.
-- �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�� ������ ����)
SELECT *
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '001' AND ABSENCE_YN = 'Y' AND SUBSTR(STUDENT_SSN, 8, 1) IN('2','4');


-- 4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� ����. �� ����ڵ���
-- �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.
-- A513079, A513090, A513091, A513110, A513119
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NO DESC;


-- 5. ���������� 20 �� �̻� 30 �� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;


-- 6. �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�. �׷� ��
-- ������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;


-- 7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� ����. 
-- ��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�.
SELECT *
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;

-- 8. ������û�� �Ϸ��� ����. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ�
-- ������� � �������� �����ȣ�� ��ȸ�غ��ÿ�.
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;


-- 9. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.
SELECT CATEGORY
FROM TB_DEPARTMENT
GROUP BY CATEGORY;


-- 10. 02 �й� ���� �����ڵ��� ������ ������� ����. ������ ������� ������ ��������
-- �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�.
SELECT *
FROM TB_STUDENT
WHERE STUDENT_ADDRESS LIKE '%����%' AND TO_CHAR(ENTRANCE_DATE , 'YY') = '02' AND ABSENCE_YN = 'N';

-- 1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ����
-- ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.( ��, ����� "�й�", "�̸�", "���г⵵" ��
-- ǥ�õǵ��� ����.)
SELECT STUDENT_NO, STUDENT_NAME, TO_CHAR(ENTRANCE_DATE, 'RRRR-MM-DD')
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY 3;


-- 2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� ����. �� ������
-- �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����. (* �̶� �ùٸ��� �ۼ��� SQL 
-- ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE PROFESSOR_NAME LIKE '____%' OR PROFESSOR_NAME NOT LIKE '___%';


-- 3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
-- ��, �̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�. (��, ���� ��
-- 2000�� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� ����. ���̴� ���������� ����Ѵ�.)

-- 4. �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��� �����?�̸�? �� �������� ����. (���� 2 ���� ���� ������ ���ٰ� �����Ͻÿ�)
SELECT SUBSTR (PROFESSOR_NAME, 2) AS "�̸�"
FROM TB_PROFESSOR; --?


-- 5. �� ������б��� ����� �����ڸ� ���Ϸ��� �Ѵ�. ��� ã�Ƴ� ���ΰ�?  
-- �̶�, 19 �쿡 �����ϸ� ����� ���� ���� ������ ���ִ�.
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) - LPAD(SUBSTR(STUDENT_SSN, 1, 2), 4, '19') >= 20;


-- 6. 2020 �� ũ���������� ���� �����ΰ�?
SELECT TO_CHAR(TO_DATE(20201225), 'DAY') AS "2020�� ũ��������" FROM DUAL;

-- 7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ��ұ�?
-- �� TO_DATE('99/10/11','RR/MM/DD'), TO_DATE('49/10/11','RR/MM/DD')�� ���� �� �� �� �� �� ���� �ǹ��ұ�?
SELECT TO_DATE('99/10/11','YY/MM/DD') FROM DUAL; -- 2099/10/11
SELECT TO_DATE('49/10/11','YY/MM/DD') FROM DUAL; -- 2049/10/11
SELECT TO_DATE('99/10/11','RR/MM/DD') FROM DUAL; -- 1999/10/11
SELECT TO_DATE('49/10/11','RR/MM/DD') FROM DUAL; -- 2046/10/11


-- 8. �� ������б��� 2000 �⵵ ���� �����ڵ��� �й��� A �� �����ϰ� �Ǿ��ִ�. 2000 �⵵
-- ���� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE ENTRANCE_DATE <= '2000/01/01';


-- 9. �й��� A517178 �� �ѾƸ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��,
-- �̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� �� �ڸ������� ǥ���Ѵ�.
SELECT TRUNC (AVG(POINT), 1) AS "����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';


-- 10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� �������
-- ��µǵ��� �Ͻÿ�.
SELECT DEPARTMENT_NO AS "�а���ȣ", CAPACITY AS "�л���(��)"
FROM TB_DEPARTMENT;

-- 11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ� �˾Ƴ��� SQL ���� �ۼ��Ͻÿ�.
SELECT COUNT(STUDENT_NO) AS "COUNT(*)"
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;


-- 12. �й��� A112113 �� ���� �л��� �⵵ �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��, 
-- �̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ�
-- �Ҽ��� ���� �� �ڸ������� ǥ���Ѵ�.

SELECT SUBSTR(TERM_NO, 1, 4) �⵵, ROUND(AVG(POINT),1) AS "�⵵ �� ����"                  
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO, 1, 4) -- �̰� ����� ¤�� �Ѿ��
ORDER BY 1;


-- 13. �а� �� ���л� ���� �ľ��ϰ��� �Ѵ�. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT DEPARTMENT_NO, COUNT(DECODE(ABSENCE_YN, 'Y', 'Y')) "���л� ��" 
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;


-- 14. �� ���б��� �ٴϴ� ��������(��٣���) �л����� �̸��� ã���� �Ѵ�. � SQL ������ ����ϸ� �����ϰڴ°�?
SELECT STUDENT_NAME AS "��������", COUNT (*) AS "��ģ �̸� ��"
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1;


-- 15. �й��� A112113 �� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ����, ��
-- ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ� ǥ���Ѵ�.)

-- ROLLUP �Լ� ã�Ƽ� ��� ���ִ�...

SELECT STUDENT_NO �й�, STUDENT_NAME �̸�, DEPARTMENT_NAME "�а� �̸�", 
ROUND(AVG(POINT), 8) ���� FROM TB_STUDENT 
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO) 
JOIN TB_GRADE USING(STUDENT_NO)
WHERE ABSENCE_YN = 'N' 
GROUP BY STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME 
HAVING ROUND(AVG(POINT), 8) >= 4.0 ORDER BY STUDENT_NO;


-- 1. �л� �̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�,
-- ������ �̸����� �������� ǥ���ϵ��� �Ѵ�.
SELECT STUDENT_NAME AS "�л� �̸�", STUDENT_ADDRESS AS "�ּ���"
FROM TB_STUDENT
ORDER BY 1;

-- 2. �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�.
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;

-- 3. �ּ����� �������� ��⵵�� �л��� �� 1900 ��� �й��� ���� �л����� �̸��� �й�, 
-- �ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�. ��, ���������� "�л��̸�", "�й�", "������ �ּ�" �� ��µǵ��� ����.
SELECT STUDENT_NAME AS "�л��̸�", STUDENT_NO AS "�й�", STUDENT_ADDRESS AS "������ �ּ�"
FROM TB_STUDENT
WHERE (STUDENT_ADDRESS LIKE '%����%' OR STUDENT_ADDRESS LIKE '%���%') AND SUBSTR(STUDENT_NO, 1, 1) = '9'
ORDER BY 1;

-- 4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL ������
-- �ۼ��Ͻÿ�. (���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�Ƴ����� ����)
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = '005'
ORDER BY PROFESSOR_SSN;


-- 5. 2004 �� 2 �б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� �Ѵ�. 
-- ������ ���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������ �ۼ��غ��ÿ�.
SELECT STUDENT_NO, POINT
FROM TB_GRADE
WHERE TERM_NO = '200402' AND CLASS_NO = 'C3118100'
ORDER BY POINT DESC, STUDENT_NO ASC;

-- 6. �л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
ORDER BY 2;

-- 7. �� ������б��� ���� �̸��� ������ �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO);

-- 8. ���� ���� �̸��� ã������ �Ѵ�. ���� �̸��� ���� �̸��� ����ϴ� SQL �����ۼ��Ͻÿ�.
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS C, TB_CLASS_PROFESSOR CP, TB_PROFESSOR P
WHERE CP.PROFESSOR_NO = P.PROFESSOR_NO
AND CP.CLASS_NO = C.CLASS_NO;


-- 9. 8 ���� ��� �� ���ι���ȸ�� �迭�� ���� ������ ���� �̸��� ã������ �Ѵ�. �̿� �ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS C, TB_CLASS_PROFESSOR CP, TB_PROFESSOR P, TB_DEPARTMENT D
WHERE CP.PROFESSOR_NO = P.PROFESSOR_NO
AND CP.CLASS_NO = C.CLASS_NO
AND C.DEPARTMENT_NO = D.DEPARTMENT_NO
AND CATEGORY = '�ι���ȸ';

-- 10. �������а��� �л����� ������ ���Ϸ��� �Ѵ�. �����а� �л����� "�й�", "�л� �̸�", 
-- "��ü ����"�� ����ϴ� SQL ������ �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ� ǥ���Ѵ�.)
SELECT STUDENT_NO, STUDENT_NAME, ROUND(AVG(POINT), 1)
FROM TB_STUDENT
JOIN TB_GRADE USING (STUDENT_NO)
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '�����а�'
GROUP BY STUDENT_NO, STUDENT_NAME
ORDER BY 1;

-- 11. �й��� A313047 �� �л��� �б��� ������ ���� �ʴ�. ���� �������� ������ �����ϱ� ����
-- �а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�. �̶� ����� SQL ����
-- �ۼ��Ͻÿ�. ��, �������� ?�а��̸�?, ?�л��̸�?, ?���������̸�?���� ��µǵ��� �Ѵ�.
SELECT DEPARTMENT_NAME AS �а��̸�, STUDENT_NAME AS �л��̸�, PROFESSOR_NAME AS "���������̸�"
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_PROFESSOR USING ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
WHERE STUDENT_NO = 'A313047';


-- 12. 2007 �⵵�� '�ΰ������' ������ ������ �л��� ã�� �л��̸��� ���� �б⸦ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NAME, TERM_NO
FROM TB_STUDENT
JOIN TB_GRADE USING (STUDENT_NO)
JOIN TB_CLASS USING (CLASS_NO)
WHERE TERM_NO LIKE ('2007%') AND CLASS_NAME = '�ΰ������';


-- 13. ��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã��
-- �� ���� �̸��� �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
LEFT JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
WHERE CATEGORY = '��ü��' AND PROFESSOR_NO IS NULL;


-- 14. �� ������б� ���ݾƾ��а� �л����� ���������� �Խ��ϰ��� �Ѵ�.
-- �л� �̸��� ���� ���� �̸��� ã�� ���� ���� ������ ���� �л��� ��� "�������� ������"����
-- ǥ���ϵ��� �ϴ� SQL ���� �ۼ��Ͻÿ�. ��, �������� ?�л��̸�?, ?��������?�� ǥ���ϸ� ���й� �л��� ���� ǥ�õǵ��� �Ѵ�.

SELECT STUDENT_NAME �л��̸�, 
NVL(PROFESSOR_NAME, '�������� ������') �������� FROM TB_STUDENT 
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO) 
LEFT JOIN TB_PROFESSOR ON(COACH_PROFESSOR_NO = PROFESSOR_NO) 
WHERE DEPARTMENT_NAME = '���ݾƾ��а�' ORDER BY STUDENT_NO;


-- 15. ���л��� �ƴ� �л� �� ������ 4.0 �̻��� �л��� ã�� �� �л��� �й�, �̸�, �а�
-- �̸�, ������ ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME, ROUND((AVG(POINT)),6)
FROM TB_STUDENT
JOIN TB_CLASS USING (DEPARTMENT_NO)
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_GRADE USING (STUDENT_NO)
WHERE ABSENCE_YN = 'N'
GROUP BY STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
HAVING AVG(POINT) >= 4.0
ORDER BY 1;

-- 16. ȯ�������а� ����������� ���� �� ������ �ľ��� �� �ִ� SQL ���� �ۼ��Ͻÿ�.
SELECT CLASS_NO, CLASS_NAME, ROUND(AVG(POINT), 6)
FROM TB_CLASS
JOIN TB_GRADE USING (CLASS_NO)
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = 'ȯ�������а�' AND (CLASS_TYPE LIKE ('%����%'))
GROUP BY CLASS_NO, CLASS_NAME
ORDER BY 1;

-- 17. �� ������б��� �ٴϰ� �ִ� �ְ��� �л��� ���� �� �л����� �̸��� �ּҸ� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NAME, STUDENT_ADDRESS 
FROM TB_STUDENT 
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                        FROM TB_STUDENT 
                        WHERE STUDENT_NAME = '�ְ���');

-- 18. ������а����� �� ������ ���� ���� �л��� �̸��� �й��� ǥ���ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME
FROM (SELECT STUDENT_NO, STUDENT_NAME
    FROM TB_STUDENT 
    JOIN TB_DEPARTMENT USING(DEPARTMENT_NO) 
    JOIN TB_GRADE USING(STUDENT_NO) 
    WHERE DEPARTMENT_NAME = '������а�' 
    GROUP BY STUDENT_NO, STUDENT_NAME 
    ORDER BY AVG(POINT) DESC)
WHERE ROWNUM = 1;

-- 19. �� ������б��� "ȯ�������а�"�� ���� ���� �迭 �а����� �а� �� ���� ���� ������
-- �ľ��ϱ� ���� ������ SQL ���� ã�Ƴ��ÿ�. ��, �������� "�迭 �а���", 
-- "��������"���� ǥ�õǵ��� �ϰ�, ������ �Ҽ��� �� �ڸ������� �ݿø��Ͽ� ǥ�õǵ��� �Ѵ�.
SELECT DEPARTMENT_NAME, ROUND(AVG(POINT), 1) AS "��������"
FROM TB_DEPARTMENT
JOIN TB_CLASS USING (DEPARTMENT_NO)
JOIN TB_GRADE USING(CLASS_NO) 
WHERE CATEGORY = (SELECT CATEGORY
                    FROM TB_DEPARTMENT 
                    WHERE DEPARTMENT_NAME = 'ȯ�������а�')
AND CLASS_TYPE LIKE '����%' 
GROUP BY DEPARTMENT_NAME ORDER BY DEPARTMENT_NAME;

-- 1. �迭 ������ ������ ī�װ� ���̺��� ������� �Ѵ�. ������ ���� ���̺��� �ۼ��Ͻÿ�.
CREATE TABLE TB_CATEGORY(
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);

-- 2. ���� ������ ������ ���̺��� ������� �Ѵ�. ������ ���� ���̺��� �ۼ��Ͻÿ�.
CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR2(5) PRIMARY KEY,
    NAME VARCHAR2(10)
);

-- 3. TB_CATAGORY ���̺��� NAME �÷��� PRIMARY KEY �� �����Ͻÿ�.
-- (KEY �̸��� �������� �ʾƵ� ������. ���� KEY �̸� �����ϰ��� �Ѵٸ� �̸��� ������ �˾Ƽ� ������ �̸��� ����Ѵ�.)
ALTER TABLE TB_CATEGORY ADD PRIMARY KEY(NAME);

-- 4. TB_CLASS_TYPE ���̺��� NAME �÷��� NULL ���� ���� �ʵ��� �Ӽ��� �����Ͻÿ�.
ALTER TABLE TB_CLASS_TYPE MODIFY NAME NOT NULL;

-- 5. �� ���̺��� �÷� ���� NO �� ���� ���� Ÿ���� �����ϸ鼭 ũ��� 10 ����,
-- �÷����� NAME �� ���� ���������� ���� Ÿ���� �����ϸ鼭 ũ�� 20 ���� �����Ͻÿ�.
ALTER TABLE TB_CLASS_TYPE MODIFY NO VARCHAR2(10);
ALTER TABLE TB_CATEGORY MODIFY NAME VARCHAR2(20); -- �ΰ� ��ġ��?

-- 6. �� ���̺��� NO �÷��� NAME �÷��� �̸��� �� �� TB_ �� ������ ���̺� �̸��� �տ����� ���·� �����Ѵ�. (ex. CATEGORY_NAME)
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NO TO CLASS_TYPE_NO;
ALTER TABLE TB_CATEGORY RENAME COLUMN NAME TO CATEGORY_NAME;

-- 7. TB_CATEGORY ���̺�� TB_CLASS_TYPE ���̺��� PRIMARY KEY �̸��� ������ ���� �����Ͻÿ�.
-- Primary Key �� �̸��� ?PK_ + �÷��̸�?���� �����Ͻÿ�. (ex. PK_CATEGORY_NAME )
ALTER TABLE TB_CATEGORY RENAME CONSTRAINT SYS_C007181 TO PK_CATEGORY_NAME;

ALTER TABLE TB_CLASS_TYPE RENAME CONSTRAINT SYS_C007180 TO PK_CLASS_TYPE_NO;

-- 8. ������ ���� INSERT ���� ��������.
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('�ڿ�����','Y');
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('��ü��','Y');
INSERT INTO TB_CATEGORY VALUES ('�ι���ȸ','Y');
COMMIT;

-- 9.TB_DEPARTMENT�� CATEGORY �÷��� TB_CATEGORY ���̺��� CATEGORY_NAME �÷��� �θ� ������ �����ϵ��� FOREIGN KEY�� �����Ͻÿ�. 
-- �� �� KEY �̸��� FK_���̺��̸�_�÷��̸����� �����Ѵ�. (ex. FK_DEPARTMENT_CATEGORY )

ALTER TABLE TB_DEPARTMENT
ADD CONSTRAINT FK_DEPARTMENT_CATEGORY FOREIGN KEY (CATEGORY)
REFERENCES TB_CATEGORY;

--?,,, �ٽ� ����












