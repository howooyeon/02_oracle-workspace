-- ����¥�� �ּ� --

/*
������ �ּ�
*/

-- ���� ��� �����鿡 ���ؼ� ��ȸ�ϴ� ��ɹ�
SELECT * FROM DBA_USERS; -- �̰� ������ �������� ���Ա� ������ ���δ�
-- ��ɹ� �ϳ� ����(���� �����ư Ŭ�� ! cntl + enter)

-- �Ϲ� ����� ���� �����ϴ� ����(������ ������ ���������� �� �� ����)
-- [ǥ����] CREATE USER ������ IDENTIFIED BY ��й�ȣ;

CREATE USER kh IDENTIFIED BY kh; -- �������� ��ҹ��� �� ����

-- ���� �߰��غ��� => ����!

-- ������ ������ �Ϲ� ����� �������� �ּ����� ����(������ ����, ����) �ο�
-- [ǥ����] GRANT ����1, ����2, .. TO ������

GRANT RESOURCE, CONNECT TO KH;

CREATE USER kh IDENTIFIED BY kh;
GRANT RESOURCE, CONNECT TO KH;