-- ����

-- ������ �� �����ϱ� 
UPDATE EMPLOYEE
SET EMP_NO = '621201-1234567' --621235-1985634
WHERE EMP_ID = '200';

UPDATE EMPLOYEE
SET EMP_NO = '850601-1234567' --856795-1313513
WHERE EMP_ID = '214';

UPDATE EMPLOYEE
SET EMP_NO = '631101-1548654' --631156-1548654
WHERE EMP_ID = '201';

COMMIT;
-- 1. JOB ���̺��� ��� ���� ��ȸ
SELECT *
FROM JOB;

-- 2. JOB ���̺��� ���� �̸� ��ȸ
SELECT JOB_NAME
FROM JOB;

-- 3. DEPARTMENT ���̺��� ��� ���� ��ȸ
SELECT *
FROM DEPARTMENT;

-- 4. EMPLOYEE���̺��� ������, �̸���, ��ȭ��ȣ, ����� ��ȸ
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE
FROM EMPLOYEE;

-- 5. EMPLOYEE���̺��� �����, ��� �̸�, ���� ��ȸ
SELECT HIRE_DATE, EMP_NAME, SALARY
FROM EMPLOYEE;

-- 6. EMPLOYEE���̺��� �̸�, ����, �Ѽ��ɾ�(���ʽ�����), �Ǽ��ɾ�(�Ѽ��ɾ� - (����*���� 3%)) ��ȸ
SELECT EMP_NAME, SALARY * 12, ((SALARY * BONUS) + SALARY), (((SALARY + (SALARY*BONUS))*12) - (SALARY*12*0.03))
FROM EMPLOYEE;

-- 7. EMPLOYEE���̺��� SAL_LEVEL�� S1�� ����� �̸�, ����, �����, ����ó ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE, PHONE
FROM EMPLOYEE
WHERE SAL_LEVEL = 'S1';

-- 8. EMPLOYEE���̺��� �Ǽ��ɾ�(6�� ����)�� 5õ���� �̻��� ����� �̸�, ����, �Ǽ��ɾ�, ����� ��ȸ
SELECT EMP_NAME, SALARY, (((SALARY + (SALARY*BONUS))*12) - (SALARY*12*0.03)) AS "�Ǽ��ɾ�", HIRE_DATE
FROM EMPLOYEE;

-- 9. EMPLOYEE���̺� ������ 4000000�̻��̰� JOB_CODE�� J2�� ����� ��ü ���� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE SALARY >= 4000000 AND JOB_CODE = 'J2';

-- 10. EMPLOYEE���̺� DEPT_CODE�� D9�̰ų� D5�� ��� ��
-- ������� 02�� 1�� 1�Ϻ��� ���� ����� �̸�, �μ��ڵ�, ����� ��ȸ
SELECT EMP_NAME, DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE IN ('D9', 'D5')) AND HIRE_DATE < '02/01/01'; 
 
-- 11. EMPLOYEE���̺� ������� 90/01/01 ~ 01/01/01�� ����� ��ü ������ ��ȸ
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';

-- 12. EMPLOYEE���̺��� �̸� ���� '��'���� ������ ����� �̸� ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%__��';

-- 13. EMPLOYEE���̺��� ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ����� �̸�, ��ȭ��ȣ�� ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

-- 14. EMPLOYEE���̺��� �����ּ� '_'�� ���� 4���̸鼭 DEPT_CODE�� D9 �Ǵ� D6�̰�
--  ������� 90/01/01 ~ 00/12/01�̰�, �޿��� 270�� �̻��� ����� ��ü�� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE (EMAIL LIKE '____$_%' ESCAPE '$') AND (DEPT_CODE = 'D9' OR DEPT_CODE ='D6')
 AND (HIRE_DATE BETWEEN '90/01/01' AND '00/12/01') AND SALARY >= 2700000;
 
-- 15. EMPLOYEE���̺��� ��� ��� ������ �ֹι�ȣ�� �̿��Ͽ� ����, ����, ���� ��ȸ
SELECT EMP_NAME, EMP_ID
FROM EMPLOYEE;
-- WHERE SUBSTR (EMP_ID, 1, 2); 

-- 16. EMPLOYEE���̺��� �����, �ֹι�ȣ ��ȸ (��, �ֹι�ȣ�� ������ϸ� ���̰� �ϰ�, '-'���� ���� '*'�� �ٲٱ�)
SELECT EMP_NAME, EMP_NO, RPAD(SUBSTR(EMP_NO,1 ,8), 14, '*')
FROM EMPLOYEE;

-- 17. EMPLOYEE���̺��� �����, �Ի���-����, ����-�Ի��� ��ȸ
--  (��, �� ��Ī�� �ٹ��ϼ�1, �ٹ��ϼ�2�� �ǵ��� �ϰ� ��� ����(����), ����� �ǵ��� ó��)
SELECT EMP_NAME, ABS(HIRE_DATE - SYSDATE), ABS(SYSDATE - HIRE_DATE)
FROM EMPLOYEE;
-- WHERE DAY_BETWEEN(HIRE_DATE - SYSDATE) HELP...

-- 18. EMPLOYEE���̺��� ����� Ȧ���� �������� ���� ��� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE MOD(EMP_ID, 2) = 1;

-- 19. EMPLOYEE���̺��� �ٹ� ����� 20�� �̻��� ���� ���� ��ȸ


-- 20. EMPLOYEE ���̺��� �����, �޿� ��ȸ (��, �޿��� '\9,000,000' �������� ǥ��)
-- 21. EMPLOYEE���̺��� ���� ��, �μ��ڵ�, �������, ����(��) ��ȸ
-- (��, ��������� �ֹι�ȣ���� �����ؼ� 00�� 00�� 00�Ϸ� ��µǰ� �ϸ�
--  ���̴� �ֹι�ȣ���� ����ؼ� ��¥�����ͷ� ��ȯ�� ���� ���)
-- 22. EMPLOYEE���̺��� �μ��ڵ尡 D5, D6, D9�� ����� ��ȸ�ϵ� D5�� �ѹ���, D6�� ��ȹ��, D9�� �����η� ó��
--  (��, �μ��ڵ� ������������ ����)
-- 23. EMPLOYEE���̺��� ����� 201���� �����, �ֹι�ȣ ���ڸ�, �ֹι�ȣ ���ڸ�, 
--  �ֹι�ȣ ���ڸ��� ���ڸ��� �� ��ȸ
-- 24. EMPLOYEE���̺��� �μ��ڵ尡 D5�� ������ ���ʽ� ���� ���� �� ��ȸ
-- 25. EMPLOYEE���̺��� �������� �Ի��Ϸκ��� �⵵�� ������ �� �⵵�� �Ի� �ο��� ��ȸ
--  ��ü ���� ��, 2001��, 2002��, 2003��, 2004��