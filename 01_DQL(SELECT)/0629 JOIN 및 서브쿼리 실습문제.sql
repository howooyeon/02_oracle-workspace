--KH_��������
--1. 70��� ��(1970~1979) �� �����̸鼭 ������ ����� �̸��� �ֹι�ȣ, �μ� ��, ���� ��ȸ
SELECT EMP_NAME, EMP_NO, DEPT_TITLE, JOB_NAME
FROM (SELECT EMP_NAME,EMP_NO, DEPT_TITLE, JOB_NAME
        FROM EMPLOYEE, DEPARTMENT, JOB
        WHERE SUBSTR(EMP_NO, 1, 2) BETWEEN 70 AND 79
        WHERE SUBSTR(EMP_NO, 8, 1) IN (2, 4)
        AND SUBSTR(EMP_NAME, 1, 1) IN '��')
JOIN EMPLOYEE USING (JOB_CODE);


--2. ���� �� ���� ������ ��� �ڵ�, ��� ��, ����, �μ� ��, ���� �� ��ȸ
SELECT EMP_ID, EMP_NAME, SYSDATE - 
FROM EMPLOYEE

--3. �̸��� �������� ���� ����� ��� �ڵ�, ��� ��, ���� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE) 
WHERE EMP_NAME LIKE '%��%';

--4. �μ��ڵ尡 D5�̰ų� D6�� ����� ��� ��, ���� ��, �μ� �ڵ�, �μ� �� ��ȸ
SELECT EMP_NAME, JOB_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_CODE IN ('D5', 'D6');

--5. ���ʽ��� �޴� ����� ��� ��, �μ� ��, ���� �� ��ȸ
SELECT EMP_NAME, BONUS, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE)
WHERE BONUS IS NOT NULL;

--6. ��� ��, ���� ��, �μ� ��, ���� �� ��ȸ
SELECT EMP_NAME, JOB_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE);

--7. �ѱ��̳� �Ϻ����� �ٹ� ���� ����� ��� ��, �μ� ��, ���� ��, ���� �� ��ȸ
SELECT EMP_NAME, DEPT_TITLE, LOCAL_NAME, NATIONAL_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON (DEPT_CODE = DEPT_ID)
JOIN JOB USING(JOB_CODE)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE)
WHERE NATIONAL_NAME IN('�ѱ�', '�Ϻ�');

--8. �� ����� ���� �μ����� ���ϴ� ����� �̸� ��ȸ
SELECT EMP_NAME, DEPT_ID
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGE = M.DEPARTMENT;

--9. ���ʽ��� ���� ���� �ڵ尡 J4�̰ų� J7�� ����� �̸�, ���� ��, �޿� ��ȸ(NVL �̿�)
--10. ���ʽ� ������ ������ ���� 5���� ���, �̸�, �μ� ��, ����, �Ի���, ���� ��ȸ


--11. �μ� �� �޿� �հ谡 ��ü �޿� �� ���� 20%���� ���� �μ��� �μ� ��, �μ� �� �޿� �հ� ��ȸ
--11-1. JOIN�� HAVING ���
--11-2. �ζ��� �� ���

--12. �μ� ��� �μ� �� �޿� �հ� ��ȸ
SELECT DEPT_TITLE, SUM(SALARY)
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
GROUP BY DEPT_TITLE;

SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;