-- ���� ���� ����


/*
    <JOIN>
    �� �� �̻��� ���̺��� �����͸� ��ȸ�ϰ��� �� �� ���Ǵ� ����
    ��ȸ ����� �ϳ��� �����(RESULT SET)�� ����
    
    ������ �����ͺ��̽��� �ּ����� �����ͷ� ������ ���̺� �����͸� ��� ���� (�ߺ� �ּ�ȭ�ϱ� ���� �ִ��� �ɰ��� ������)
    
    -- � ����� � �μ��� �����ִ��� �ñ���! �ڵ帻��.. �̸�����//
    
    => ������ �����ͺ��̽����� SQL���� �̿��� ���̺��� "����"�� �δ� ���
       ( ������ �� ��ȸ�� �ؿ��°� �ƴ϶� �� ���̺� ������ν��� �����͸� ��Ī�ؼ� ��ȸ���Ѿ���!!! )
       
            JOIN ũ�� "����Ŭ ���뱸��"�� "ANSI ����" (ANSI == �̱�����ǥ����ȸ) <= �ƽ�ũ�ڵ�ǥ ����� ��ü
                                        [JOIN ��� ����]
                                        
            ����Ŭ ���뱸��                       |                  ANSI ����
      --------------------------------------------------------------------------------------------
              � ����                           |   ���� ����( [INNER] JOIN ) => JOIN USING / ON
            [EQUAL JOIN]                         |   �ڿ� ����( NATUAL JOIN) => JOIN USING
      --------------------------------------------------------------------------------------------
                ��������                          |   ���� �ܺ����� ( LEFT OUTER JOIN )
             (LEFT OUTER)                        |   ������ �ܺ� ���� (RIGHT OUTER JOIN)
             (RIGHT OUTER)                       |   ��ü �ܺ� ���� (FULL OUTER JOIN)
      ---------------------------------------------------------------------------------------------
            ��ü���� (SELF JOIN)                  | JOIN ON
            �� ����(NON EQUAL JOIN)           |
      ---------------------------------------------------------------------------------------------
      
*/

-- ��ü ������� ���, �����, �μ��ڵ�, �μ��� ��ȸ�ϰ��� �� �� 
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE;

SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT;

-- ��ü ������� ���, �����, �����ڵ�, ���޸� ��ȸ�ϰ��� �� ��
SELECT EMP_ID, EMP_NAME, JOB_CODE
FROM EMPLOYEE;

SELECT JOB_CODE, JOB_NAME
FROM JOB;

/*
    1. ����� (EQUAL JOIN) / �������� (INNER JOIN)
       �����ϰ��� �ϴ� �÷��� ���� ��ġ�ϴ� ��鸸 ���εż� ��ȸ (== ��ġ�ϴ� ���� ���� ���� ��ȸ���� ����)
        
    
*/

-- >> ����Ŭ ���뱸��
--     FROM���� ��ȸ�ϰ��� �ϴ� ���̺���� ���� (, �����ڷ�)
--      WHERE���� ��Ī��ų �÷�(�����)�� ���� ������ ������

-- 1) ������ �� �÷����� �ٸ� ���(EMPLOYEE : DEPT_CODE, DEPARTMENT : DEPT_ID)
-- 1) ���, �����, �μ��ڵ�, �μ����� ���� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;
-- ��ġ�ϴ� ���� ���� ���� ��ȸ���� ���ܵ� �� Ȯ�� ����
-- DEPT_CODE �� NULL�� ��� ��ȸ X, DEPT_ID�� D3, D4, D7 ��ȸ X

-- 2) ������ �� �÷����� ���� ���(EMPLOYEE : JOB_CODE, JOB : JOB_CODE)
-- ���, �����, �����ڵ�, ���޸�
SELECT EMP_ID, EMP_NAME, JOB_CODE
FROM EMPLOYEE, JOB
WHERE JOB_CODE = JOB_CODE;
-- ambigously : �ָ���, ��ȣ��

-- 1) �ذ���
SELECT EMP_ID, EMP_NAME, EMPLOYEE.JOB_CODE, JOB_NAME
FROM EMPLOYEE, JOB
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE;

-- 2) �ذ��� 2. ���̺� ��Ī�� �ο��ؼ� �̿��ϴ� ���
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;



-- >> ANSI ����
-- FROM���� ������ �Ǵ� ���̺��� �ϳ� ����� ��
-- JOIN���� ���� ��ȸ�ϰ��� �ϴ� ���̺� ��� + ��Ī��ų �÷��� ���� ���ǵ� ���
-- JOIN USING, JOIN ON

-- 1) ������ �� �÷����� �ٸ� ��� (EMPLOYEE : DEPT_CODE, DEPARTMENT : DEPT_ID)
--     ������ JOIN ON �������θ� ��밡��!!
--     ���, �����, �μ��ڵ�, �μ���
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- 2) ������ �� �÷����� ���� ��� (E : JOB_CODE, J:JOB_CODE)
--    JOIN ON, JOIN USING ���� ��� ����!
--    ���, �����, �����ڵ�, ���޸�
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB ON (JOB_CODE = JOB_CODE);

-- �ذ��� 1) ���̺�� �Ǵ� ��Ī�� �̿��ؼ� �ϴ� ���
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, J.JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON (E.JOB_CODE = J.JOB_CODE);

-- �ذ��� 2) JOIN USING ���� ����ϴ� ��� (�� �÷����� ��ġ�� ���� ��� ����)
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);

-----[ ������� ]------
-- �ڿ�����(NATUAL JOIN) : �� ���̺��� ������ �÷��� �� ���� ������ ���
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
NATURAL JOIN JOB;

-- �߰����� ���ǵ� ��� ���� ����
-- ������ �븮�� ����� �̸�, ���޸�, �޿� ��ȸ
-- >> ����Ŭ ���� ����
SELECT EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE
AND J.JOB_NAME = '�븮';

-- >> ANSI ����
SELECT EMP_NAME, JOB_NAME, SALARY --4
FROM EMPLOYEE --1
JOIN JOB USING(JOB_CODE) --2
WHERE JOB_NAME = '�븮'; --3

----------------------------------�ǽ�����---------------------------------------
-- 1. �μ��� �λ�������� ������� ���, �̸�, ���ʽ� ��ȸ
-- >> ����Ŭ ���� ����
SELECT EMP_ID, EMP_NAME, BONUS
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID 
AND DEPT_TITLE = '�λ������';

-- >> ANSI ����
SELECT EMP_ID, EMP_NAME, BONUS
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID) -- �޶� ON ����
WHERE DEPT_TITLE = '�λ������'; 

--2. DEPARTMENT�� LOCATION�� �����ؼ� ��ü �μ��� �μ��ڵ�, �μ���, �����ڵ�, ������ ��ȸ
-- >> ����Ŭ ���� ����
SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID, LOCAL_NAME
FROM DEPARTMENT, LOCATION
WHERE LOCATION_ID = LOCAL_CODE;

-- >> ANSI ����

-- 3. ���ʽ��� �޴� ������� ���, �����, ���ʽ�, �μ��� ��ȸ
-- >> ����Ŭ ���� ����
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
AND BONUS IS NOT NULL;

-- >> ANSI ����
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE BONUS IS NOT NULL;

-- 4. �μ��� �ѹ��ΰ� �ƴ� ������� �����, �޿�, �μ��� ��ȸ
-- >> ����Ŭ ���� ����
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
AND DEPT_TITLE != '�ѹ���';

-- >> ANSI ����
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE != '�ѹ���';

-- ���� ���� DEPT_CODE�� NULL�� ���� ������ ���� ����

--------------------------------------------------------------------------------
/*
    2. ���� ���� / �ܺ����� ( OUTER JOIN )
    �� ���̺� ���� JOIN�� ��ġ���� �ʴ� �൵ ���Խ��Ѽ� ��ȸ ����
    ��, �ݵ�� LEFT / RIGHT �����ؾߵ�!! (������ �Ǵ� ���̺� ����)
*/

-- �����, �μ���, �޿�, ����
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY * 12
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
-- �μ� ��ġ�� �ȵ� ��� 2�� ���� ������ ��ȸ X
-- �μ��� ������ ����� ���� �μ� ���� ��쵵 ��ȸ X

-- 1) LEFT (OUTER) JOIN : �� ���̺� �� ���� ����� ���̺� �������� JOIN
-- >> ANSI ����
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY * 12
FROM EMPLOYEE -- EMPLOYEE�� �ִ°� ������ �� ������ ����
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
-- �μ���ġ�� ���� �ʾҴ� 2���� ��� ������ ��ȸ ��

-- >> ����Ŭ ���� ����
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY * 12
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+); -- �������� ����� �ϴ� ���̺��� �ݴ��� �÷� �ڿ� (+) ���̱�

-- 2) RIGHT [OUTER] JOIN : �� ���̺� �� ������ ����� ���̺��� �������� JOIN
-->> ANSI ����
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY * 12
FROM EMPLOYEE
RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- >> ����Ŭ ���� ����
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY * 12
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID;

-- 3) FULL [OUTER] JOIN : �� ���̺��� ���� ��� ���� ��ȸ�� �� ���� (��, ����Ŭ ���� �������δ� �ȵ�)
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY * 12
FROM EMPLOYEE
FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

/*
    3. �� ����(NON EQUAL JOIN) => ��� �׳� �����
    ��Ī��ų �÷��� ���� ���� �ۼ��� '=(��ȣ)'�� ������� �ʴ� ���ι�
    ANSI �������δ� JOIN ON���θ� ��� ����
*/

SELECT EMP_NAME, SALARY, SAL_LEVEL
FROM EMPLOYEE;

SELECT * FROM SAL_GRADE;

-- �����, �޿�, �ִ� ���� �ѵ�
-- >> ����Ŭ ����
SELECT EMP_NAME, SALARY, MAX_SAL
FROM EMPLOYEE, SAL_GRADE
-- WHERE SALARY >= MIN_SAL AND SALARY <= MAX_SAL; -- ��� ���� �� ����
WHERE SALARY BETWEEN MIN_SAL AND MAX_SAL;

-- >> ANSI ����
SELECT EMP_NAME, SALARY, MAX_SAL
FROM EMPLOYEE
JOIN SAL_GRADE ON (SALARY BETWEEN MIN_SAL AND MAX_SAL);

--------------------------------------------------------------------------------

/*
    4. ��ü ���� ( SELF JOIN )
    ���� ���̺��� �ٽ� �� �� ��ȸ�ϴ� ���
*/

SELECT * FROM EMPLOYEE;

-- ��ü ����� ���, �����, ����μ��ڵ�       => EMPLOYEE E
--      ����� ���, �����, ����μ��ڵ�      => EMPLOYEE M

-- >> ����Ŭ ���� ����
SELECT E.EMP_ID AS "��� ���", E.EMP_NAME AS "�����", E.DEPT_CODE AS "����μ��ڵ�", 
       M.EMP_ID AS "��� ���" , M.EMP_NAME AS "�����", M.DEPT_CODE AS "����μ��ڵ�"
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_ID = M.EMP_ID;


-- >> ANSI ���� ����
SELECT E.EMP_ID AS "��� ���", E.EMP_NAME AS "�����", E.DEPT_CODE AS "����μ��ڵ�", 
       M.EMP_ID AS "��� ���" , M.EMP_NAME AS "�����", M.DEPT_CODE AS "����μ��ڵ�"
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON (E.MANAGER_ID = M.EMP_ID);
-- ������� ����� ������ �ϰ� ������ LEFT JOIN

--------------------------------------------------------------------------------
/*
    <���� JOIN>
    2�� �̻��� ���̺��� ������ JOIN �� ��
*/

-- ���, �����, �μ���, ���޸� ��ȸ

SELECT * FROM EMPLOYEE;     -- DEPT_CODE, JOB_CODE
SELECT * FROM DEPARTMENT;   -- DEPT_ID
SELECT * FROM JOB;          --            JOB_CODE

-- >> ����Ŭ ���� ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E, DEPARTMENT, JOB J
WHERE DEPT_CODE = DEPT_ID
AND E.JOB_CODE = J.JOB_CODE;

-- >> ANSI ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE);

-- ���, �����, �μ���, ������
SELECT * FROM EMPLOYEE;     -- DEPT_CODE
SELECT * FROM DEPARTMENT;   -- DEPT_ID   LOCATION_ID
SELECT * FROM LOCATION;     --           LOCAL_CODE

-- >> ����Ŭ ���� ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE, DEPARTMENT, LOCATION
WHERE DEPT_CODE = DEPT_ID
AND LOCATION_ID = LOCAL_CODE;

-- >> ANSI
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

------------------------------�ǽ�����-----------------------------------------------
-- 1. ���, �����, �μ���, ������, ������ ��ȸ(EMP, DEP, LOC, NAT ����)

SELECT * FROM EMPLOYEE;     -- DEPT_CODE
SELECT * FROM DEPARTMENT;   -- DEPT_ID      LOCATION_ID
SELECT * FROM LOCATION;     --              LOCAL_CODE      NATIONAL_CODE
SELECT * FROM NATIONAL;     --                              NATIONAL_CODE
-- >> ����Ŭ ���뱸��

SELECT EMP_ID, EMP_NAME, DEPT_CODE, LOCAL_NAME, NATIONAL_NAME
FROM EMPLOYEE E, DEPARTMENT D, LOCATION L, NATIONAL N
WHERE E.DEPT_CODE = D.DEPT_ID
AND D.LOCATION_ID = L.LOCAL_CODE
AND L.NATIONAL_CODE = N.NATIONAL_CODE;

-- >> ANSI
SELECT EMP_ID, EMP_NAME, DEPT_CODE, LOCAL_NAME, NATIONAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E. DEPT_CODE = D. DEPT_ID
JOIN LOCATION L ON D.LOCATION_ID = L.LOCAL_CODE
JOIN NATIONAL USING (NATIONAL_CODE);

-- 2. ���, �����, �μ���, ���޸�, ������, ������, �ش� �޿���޿��� ���� �� �ִ� �ִ� �ݾ� ��ȸ
SELECT * FROM EMPLOYEE;     -- DEPT_CODE
SELECT * FROM DEPARTMENT;   -- DEPT_TITLE      LOCATION_ID
SELECT * FROM LOCATION;     --              LOCAL_CODE      NATIONAL_CODE
SELECT * FROM JOB;          -- JOB_CODE
SELECT * FROM NATIONAL; 

-- >> ����Ŭ ���뱸��
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME, LOCAL_NAME, NATIONAL_NAME, MAX_SAL
FROM EMPLOYEE E, DEPARTMENT D, JOB J, LOCATION L, NATIONAL N, SAL_GRADE S
WHERE E.DEPT_CODE = D.DEPT_ID
AND E.DEPT_CODE = D.DEPT_ID
AND NATIONLAL_CODE = N.
JOIN LOCATION ON LOCATION_ID = LOCAL_CODE;

-- >> ANSI
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME, LOCAL_NAME, NATIONAL_NAME, MAX_SAL
FROM EMPLOYEE E
JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT.ID)
JOIN JOB J USING(JOB_CODE)
JOIN LOCATION L ON(D.LOCTAION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING (NATIONAL_CODE)  ..???
JOIN SAL_GRADE S USING(SAL_LEVEL);















