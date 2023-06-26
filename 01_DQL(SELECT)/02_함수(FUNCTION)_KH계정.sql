/*
    <함수 FUNCTION>
    전달된 컬럼값을 읽어들여서 함수를 실행한 결과를 반환함
    
    - 단일행 함수 : N개의 값을 읽어들여서 N개의 결과값을 리턴(매행마다 함수 실행 결과 반환)
    - 그룹 함수   : N개의 값을 읽어들여서 1개의 결과값을 리턴(그룹을 지어 그룹별로 함수 실행 결과 반환)
    
    >> SELECT 절에 단일행 함수, 그룹함수를 함께 못함
    왜? 결과 행의 개수가 다르기 때문
    
    >> 함수식을 기술 할 수 있는 위치 : SELECT절, WHERE절, ORDER BY절, GROUP BY 절, HAVING 절
*/

/*
    <문자 처리 함수>
    * LENGTH / LENGTHB      => 결과값 NUMBER 타입
    
    LENGTH(컬럼| '문자열값')  : 해당 문자열 값의 글자수 반환
    LENGTHB(컬럼| '문자열값') : 해당 문자열 값의 BYTE수 반환
    
    '김' , '나', 'ㄱ' 한 글자당 3BYTE
    영문자, 숫자, 특문 한 글자당 1BYTE
*/

SELECT SYSDATE
FROM DUAL; -- 가상 테이블! 테이블 쓸 거 없을 때 쓰는 것!

SELECT LENGTH('오라클'), LENGTHB('오라클')
FROM DUAL;

SELECT LENGTH('oracle'), LENGTHB('oracle')
FROM DUAL;

SELECT EMP_NAME, LENGTH (EMP_NAME), LENGTHB(EMP_NAME),
       EMAIL, LENGTH(EMAIL), LENGTH(EMAIL)
FROM EMPLOYEE; -- 매행마다 다 실행되고 있음! => 단일행 함수

/*
    * INSTR
      문자열로부터 특정 문자의 시작위치를 찾아서 반환
      
      INSTR(컬럼|'문자열', '찾고자하는 문자', ('찾을위치의 시작값', (순번)))      => 결과값은 NUMBER 타입!!
      
      찾을위치의 시작값
      1  : 앞에서부터 찾겠다
      -1 : 뒤에서부터 찾겠다
*/

SELECT INSTR('AABAACAABBAA','B') FROM DUAL; -- 찾을 위치의 시작값은 1 기본값 => 앞에서부터 찾음, 순번도 1 기본값
SELECT INSTR('AABAACAABBAA','B', 1) FROM DUAL; -- 앞에서부터 찾은 거
SELECT INSTR('AABAACAABBAA','B', -1) FROM DUAL; -- 뒤에서부터 찾은 거
SELECT INSTR('AABAACAABBAA','B', 1, 2) FROM DUAL;
SELECT INSTR('AABAACAABBAA','B', -1, 3) FROM DUAL;

SELECT EMAIL, INSTR(EMAIL, '_', 1, 1) AS "위치", INSTR(EMAIL, '@') AS "@위치"
FROM EMPLOYEE;

--------------------------------------------------------------------------------

/*
    * SUBSTR
      문자열에서 특정 문자열을 추출해서 반환(자바에서 substring() 메소드와 유사)
      
      SUBSTR(STRING , POSITION, [LENGTH])       => 결과값이 CHARACTER 타입
      - STRING : 문자타일컬럼 또는 '문자열값'
      - POSITION : 문자열을 추출할 시작 위치값
      - LENGTH : 추출할 문자 개수 (생략시 끝까지 의미)
*/

SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 1, 6) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL; -- 뒤에서부터 8번째 자리

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) AS "성별"
FROM EMPLOYEE;

-- 여자 사원만 조회
SELECT EMP_NAME
FROM EMPLOYEE
-- WHERE SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) = '4';
WHERE SUBSTR (EMP_NO, 8, 1) IN ('2', '4');

-- 남자 사원만 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN (1,3) -- 내부적으로 자동 형변환
ORDER BY 1; -- 기본적으로 오름차순













