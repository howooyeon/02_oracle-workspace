/*

<SELECT>
�����͸� �ʱ�ȭ �� �� ���Ǵ� ����

>> RESULT���� ���� ��ȸ�� �����(��, ��ȸ�� ����� ������ �ǹ�)

    [ǥ����]
    SELECT ��ȸ�ϰ��� �ϴ� �÷�1, �÷�2, .....
    FROM ���̺��;
    
    * �ݵ�� �����ϴ� �÷����� ����Ѵ�!! ���� �÷� ���� ������!
    

*/

--EMPLOYEE ���̺��� ��� �÷� ��ȸ (*)
--SELECT EMP ID, EMP_NAME
SELECT *
FROM EMPLOYEE;

--EMPLOYEE ���̺��� ���, �̸�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

-- JOB ���̺��� ��� �÷� ��ȸ
SELECT *
FROM JOB;

------------------------�ǽ�����-----------------------
-- 1. JOB ���̺��� ���޸� ��ȸ

SELECT JOB_NAME
FROM JOB;

-- 2. DEPARTMENT ���̺��� ��� �÷� ��ȸ

SELECT *
FROM DEPARTMENT;

-- 3. DEPARTMENT ���̺��� �μ��ڵ�, �μ��� ��ȸ

SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT;

-- 4. EMPLOYEE ���̺��� �����, �̸���, ��ȭ��ȣ, �Ի���, �޿� ��ȸ

SELECT EMP_ID, EMAIL, PHONE, HIRE_DATE, SALARY
FROM EMPLOYEE;

/*
    <�÷����� ���� �������>
    SELECT�� �÷��� �ۼ� �κп�  ������� ��� ����(�̶�, �������� ��� ��ȸ)
*/
--EMPLOYEE ���̺��� �����, ����� ����(�޿� * 12) ��ȸ
SELECT EMP_NAME, SALARY * 12
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �����, �޿�, ���ʽ� ��ȸ
SELECT EMP_NAME, SALARY, BONUS
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �����, �޿�, ���ʽ�, ����, ���ʽ� ���Ե� ���� ��ȸ((SALARY)+ BONUS* SALARY) *12
SELECT EMP_NAME, SALARY, BONUS
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �����, �޿�, ���ʽ�, ����, ���ʽ� ���Ե� ���� ��ȸ((SALARY)+ BONUS* SALARY) *12
SELECT EMP_NAME, SALARY, BONUS, SALARY * 12, ((SALARY+ BONUS* SALARY) *12)
FROM EMPLOYEE;

--> ������� ���� �� NULL ���� ������ ��� ��� ������ ����� ������ ������ NULL

-- EMPLOYEE ���̺��� �����, �Ի���
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE;

-- EMPLOYEE�� ���, �Ի���, �ٹ��ϼ�(���ó�¥ - �Ի���)
-- DATE ���ĳ����� ���� ����!
-- * ���ó�¥ : SYSDATE
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
FROM EMPLOYEE;

-- DATE - DATE : ������� �� ������ ����!
-- ��, ���� �������� ������ DATE ���� ��/��/��/��/��/�� ������ �ð����������� ������ �ϱ� ����
-- �Լ������ϸ� ����� ��� Ȯ�� ���� => ���߿� ���!

-----------------------------------------------------------
/*
   <�÷��� ��Ī �����ϱ�> 
   ��������� �ϰ� �Ǹ� �÷Ÿ� ��������... �̶� �÷������� ��Ī �ο��ؼ� ����ϰ� ������
   
    [ǥ����]
    �÷��� ��Ī / �÷��� AS ��Ī/ �÷��� "��Ī" / �÷��� AS "��Ī"
    
    AS ���̵� �Ⱥ��̵� �ο��ϰ��� �ϴ� ���� ���� Ȥ�� Ư������ �� ������ ��� ����� �ֵ���ǥ�� �������
   
*/

SELECT EMP_NAME �����, SALARY AS �޿�, SALARY * 12 AS "����(��)", (SALARY + SALARY * BONUS) *12 AS "�� �ҵ� (���ʽ�����)"
FROM EMPLOYEE;

-------------------------------------------------------------------

/*
    <���ͷ�>
    ���Ƿ� ������ ���ڿ�('')
    SELECT ���� ���ͷ��� �����ϸ� ��ġ ���̺�� �����ϴ� ������ó�� ��ȸ ����
    ��ȸ�� RESULT SET�� ��� �࿡ �ݺ������� ���� ���
    
*/

-- EMPLOYEE ���̺��� ���, �����, �޿� ��ȸ
SELECT EMP_NO, EMP_NAME, SALARY, '��' AS "����"
FROM EMPLOYEE;

/*
    <���� ������ : || >
    ���� �÷������� ��ġ �ϳ��� �÷��� ��ó�� �����ϰų�, �÷����� ���ͷ��� ������ �� ����
    System.out.println("num�� �� : " + num);
    
*/

-- ���, �̸�, �޿��� �ϳ��� Į������ ��ȸ
SELECT EMP_NO || EMP_NAME || SALARY
FROM EMPLOYEE;

-- �÷����� ���ͷ� �� ����
-- XXX�� ������ XXX�� �Դϴ�. => �÷Ÿ� ��Ī : �޿�����

SELECT EMP_NAME || '�� ������ ', SALARY || ' �Դϴ�.' AS "�޿�����"
FROM EMPLOYEE;

---------------------------------------------------------------

/*
    <DISTINCT>
    �÷��� �ߺ��� ������ �ѹ����� ǥ���ϰ��� �� �� ���
*/
-- ���� �츮 ȸ�翡 � ������ ������� �����ϴ��� �ñ���.

SELECT JOB_CODE
FROM EMPLOYEE; -- ����� 23���� ������ ���δ� ��ȸ�� ��

-- EMPLOYEE�� �����ڵ�(�ߺ�����) ��ȸ
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE; -- �ߺ� ���ŵż� 7�ุ ��ȸ

-- ������� � �μ��� �����ִ��� �ñ��ϴ�.
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE; -- NULL : ���� �μ���ġ �ȵ� ���.

-- ���� ���� : DISTINCT�� SELECT ������ �� �� ���� ��� ����
/* �������� 
SELECT DISTINCT JOB_CODE, DISTINCT DEPT_CODE
FROM EMPLOYEE
*/

SELECT DISTINCT JOB_CODE,DEPT_CODE
FROM EMPLOYEE;
-- (JOB_CODE, DEPT_CODE)������ ��� �ߺ� �Ǻ�

------------------------------------------------------

/*
    <WHERE ��>
    ��ȸ�ϰ��� �ϴ� ���̺�κ��� Ư�� ���ǿ� �����ϴ� �����͸��� ��ȸ�ϰ��� �� �� ���
    �̶� WHERE���� ���ǽ��� �����ϰ� ��
    ���ǽĿ����� �پ��� �����ڵ� ��� ����!
    
    [ǥ����]
    SELECT �÷�1, �÷�2, ....
    FROM ���̺��
    WHERE ���ǽ�;
    
    [�񱳿�����]
    >, <, >=, <=      -> ��Һ�
    =                 -> �����
    !=, ^=, <>        -> �������� ������ ��
    
*/

-- EMPLOYEE���� �μ��ڵ尡 'D9'�� ����鸸 ��ȸ(�̶�, ��� Į�� ��ȸ)
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

-- EMPLOYEE���� �μ��ڵ尡 'D1'�� ������� �����, �޿�, �μ��ڵ常 ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

-- EMPLOYEE���� �μ��ڵ尡 'D1'�� �ƴ� ������� ���, �����, �μ��ڵ� ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
-- WHERE DEPT_CODE != 'D1';
-- WHERE DEPT_CODE ^= 'D1';
WHERE DEPT_CODE <> 'D1';

-- �޿� 400���� �̻��� ������� �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 4000000;

-- EMPLOYEE���� ������(EMT_YN �÷����� 'N')�� ������� ���, �̸�, �Ի���
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'N';

-- 1. �޿��� 300���� �̻��� ������� �����, �޿�, �Ի���, ����(���ʽ� ������) ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE, SALARY *12 AS "����(���ʽ� ������)"
FROM EMPLOYEE
WHERE SALARY >= 3000000;

-- 2. ������ 5000���� �̻��� ������� �����, �޿�, ����, �μ��ڵ� ��ȸ
SELECT EMP_NAME, SALARY, SALARY*12 AS "����", DEPT_CODE
FROM EMPLOYEE
WHERE SALARY * 12 >= 50000000; -- WHERE �������� SELECT������ ���� ��Ī ��� �Ұ�!!

-- ���� ���� ����
-- FROM�� -> WHERE�� -> SELECT��

-- 3. �����ڵ�'J3'�� �ƴ� ������� ���, �����, �����ڵ�, ��翩�� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE, ENT_YN
FROM EMPLOYEE
WHERE JOB_CODE ^= 'J3';

-- �μ��ڵ尡 'D9' �̸鼭 �޿��� 500���� �̻��� ������� ���, �����, �޿�, �μ��ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9' AND SALARY >= 5000000;

-- �μ��ڵ尡 'D6'�̰ų� �޿��� 300���� �̻��� ������� �����, �μ��ڵ�, �޿���ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR SALARY >= 3000000;

-- �޿��� 350���� �̻� 600���� ���ϸ� �޴� ������� �����, ���, �޿� ��ȸ
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
-- WHERE 3500000 <= SALARY <= 6000000; �����߻�!! �ڹٶ� ����������!
-- WHERE 3500000 <= SALARY AND SALARY <= 6000000;
WHERE SALARY >= 3500000 AND SALARY <= 6000000; -- �Ϲ������δ� �� ������!!
------------------------------------------------------------------------
/*

    <BETWEEN AND>
    ���ǽĿ��� ���Ǵ� ����
    �� �̻� �� ������ ������ ���� ������ ������ �� ���Ǵ� ������
    
    [ǥ����]
    �񱳴���÷� BETWEEN A(��) AND B(��2)
    => �ش� �÷����� A(��1) �̻��̰� B(��2) ������ ���

*/

SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;

-- ���� ���� ���� ���� ����� ��ȸ�ϰ� �ʹٸ�? 350�̸� 600 �ʰ�

SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
-- WHERE SALARY < 3500000 OR SALARY > 6000000;
-- WHERE NOT SALARY BETWEEN 3500000 AND 6000000;
WHERE SALARY NOT BETWEEN 3500000 AND 6000000;
-- NOT : ������������ => �ڹٿ����� !
-- �÷��� �� �Ǵ� BETWEEN �տ� ���� ����!

-- �Ի��� '90/01/01' ~ '01/01/01'
SELECT *
FROM EMPLOYEE
-- WHERE HIRE_DATE >= '90/01/01' AND HIRE_DATE <= '01/01/01'; -- DATE ������ ��Һ񱳰���
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';

/*
    <LIKE>
    ���ϰ��� �ϴ� �÷��� ���� ������ Ư�� ���Ͽ� ������ ��� ��ȸ
    
    (ǥ����)
    �񱳴���÷� LIKE 'Ư������'
    
    - Ư������ ���ý� '%', '_'�� ���ϵ� ī��� ����� �� ����
    
    >> '%' : 0���� �̻�
    EX) �񱳴���÷� LIKE '����%'       => �񱳴���� �÷����� ���ڷ� "����" �Ǵ� �� ��ȸ
    
*/

-- ����� �� ���� ������ ������� �����, �޿�, �Ի��� ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%';