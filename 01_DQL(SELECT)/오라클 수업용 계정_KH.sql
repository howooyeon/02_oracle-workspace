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
FROM EMPLOYEE
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









