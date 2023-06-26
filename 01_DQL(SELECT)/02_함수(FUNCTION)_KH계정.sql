/*
    <�Լ� FUNCTION>
    ���޵� �÷����� �о�鿩�� �Լ��� ������ ����� ��ȯ��
    
    - ������ �Լ� : N���� ���� �о�鿩�� N���� ������� ����(���ึ�� �Լ� ���� ��� ��ȯ)
    - �׷� �Լ�   : N���� ���� �о�鿩�� 1���� ������� ����(�׷��� ���� �׷캰�� �Լ� ���� ��� ��ȯ)
    
    >> SELECT ���� ������ �Լ�, �׷��Լ��� �Բ� ����
    ��? ��� ���� ������ �ٸ��� ����
    
    >> �Լ����� ��� �� �� �ִ� ��ġ : SELECT��, WHERE��, ORDER BY��, GROUP BY ��, HAVING ��
*/

/*
    <���� ó�� �Լ�>
    * LENGTH / LENGTHB      => ����� NUMBER Ÿ��
    
    LENGTH(�÷�| '���ڿ���')  : �ش� ���ڿ� ���� ���ڼ� ��ȯ
    LENGTHB(�÷�| '���ڿ���') : �ش� ���ڿ� ���� BYTE�� ��ȯ
    
    '��' , '��', '��' �� ���ڴ� 3BYTE
    ������, ����, Ư�� �� ���ڴ� 1BYTE
*/

SELECT SYSDATE
FROM DUAL; -- ���� ���̺�! ���̺� �� �� ���� �� ���� ��!

SELECT LENGTH('����Ŭ'), LENGTHB('����Ŭ')
FROM DUAL;

SELECT LENGTH('oracle'), LENGTHB('oracle')
FROM DUAL;

SELECT EMP_NAME, LENGTH (EMP_NAME), LENGTHB(EMP_NAME),
       EMAIL, LENGTH(EMAIL), LENGTH(EMAIL)
FROM EMPLOYEE; -- ���ึ�� �� ����ǰ� ����! => ������ �Լ�

/*
    * INSTR
      ���ڿ��κ��� Ư�� ������ ������ġ�� ã�Ƽ� ��ȯ
      
      INSTR(�÷�|'���ڿ�', 'ã�����ϴ� ����', ('ã����ġ�� ���۰�', (����)))      => ������� NUMBER Ÿ��!!
      
      ã����ġ�� ���۰�
      1  : �տ������� ã�ڴ�
      -1 : �ڿ������� ã�ڴ�
*/

SELECT INSTR('AABAACAABBAA','B') FROM DUAL; -- ã�� ��ġ�� ���۰��� 1 �⺻�� => �տ������� ã��, ������ 1 �⺻��
SELECT INSTR('AABAACAABBAA','B', 1) FROM DUAL; -- �տ������� ã�� ��
SELECT INSTR('AABAACAABBAA','B', -1) FROM DUAL; -- �ڿ������� ã�� ��
SELECT INSTR('AABAACAABBAA','B', 1, 2) FROM DUAL;
SELECT INSTR('AABAACAABBAA','B', -1, 3) FROM DUAL;

SELECT EMAIL, INSTR(EMAIL, '_', 1, 1) AS "��ġ", INSTR(EMAIL, '@') AS "@��ġ"
FROM EMPLOYEE;

--------------------------------------------------------------------------------

/*
    * SUBSTR
      ���ڿ����� Ư�� ���ڿ��� �����ؼ� ��ȯ(�ڹٿ��� substring() �޼ҵ�� ����)
      
      SUBSTR(STRING , POSITION, [LENGTH])       => ������� CHARACTER Ÿ��
      - STRING : ����Ÿ���÷� �Ǵ� '���ڿ���'
      - POSITION : ���ڿ��� ������ ���� ��ġ��
      - LENGTH : ������ ���� ���� (������ ������ �ǹ�)
*/

SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 1, 6) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL; -- �ڿ������� 8��° �ڸ�

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) AS "����"
FROM EMPLOYEE;

-- ���� ����� ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
-- WHERE SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) = '4';
WHERE SUBSTR (EMP_NO, 8, 1) IN ('2', '4');

-- ���� ����� ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN (1,3) -- ���������� �ڵ� ����ȯ
ORDER BY 1; -- �⺻������ ��������













