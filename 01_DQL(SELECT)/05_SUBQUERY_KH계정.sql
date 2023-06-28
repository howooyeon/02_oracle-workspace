/*
    * 서브쿼리 (SUBQUERY)
    - 하나의 SQL문 안에 포함된 또 다른 SELECT문
    - 메인 SQL문을 위해 보조 역할을 하는 쿼리문
    
*/

-- 간단 서브쿼리 예시1
-- 노옹철 사원과 같은 부서에 속한 사원들 조회하고 싶음!!

-- 1) 먼저 노옹철 사원의 부서코드 조회
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '노옹철'; --D9

-- 2) 부서코드가 D9인 사원들 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

-- > 위의 2단계를 하나의 쿼리문
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '노옹철');

-- 간단 서브쿼리 예시2
-- 전 직원의 평균급여보다 더 많은 급여를 받는 사원들의 사번, 이름, 직급코드, 급여 조회

-- 1) 전 직원의 평균 급여 조회
SELECT AVG(SALARY)
FROM EMPLOYEE; -- 대략 3047663원인걸 알아냄!!

-- 2) 급여가 3047663원 이상인 사원들조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3047663;

-- 위의 2단계를 하나의 쿼리문으로!!
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG (SALARY)
                        FROM EMPLOYEE);
                    
--------------------------------------------------------------------------------
/*
    * 서브쿼리의 구분
    서브쿼리 수행한 결과값이 몇 행 몇 열이냐에 따라서 분류됨
    
    - 단일행 서브쿼리 : 서브쿼리의 조회 결과값의 개수가 오로지 1개 일 때(한 행 한 열)
    - 다중행 서브쿼리 : 서브쿼리의 조회 결과값이 여러행 일 때 (여러행 한열) => 동명이인 노옹철 2명일 때
    - 다중열 서브쿼리 : 서브쿼리의 조회 결과값이 한 행이지만 컬럼이 여러개일 때 (한 행 여러 열)
    - 다중행 서브퀄 서브쿼리 : 서브쿼리 조회 결과값이 여러행 여러컬럼일 때 (여러행 여러열)
    
    >> 서브쿼리 종류가 뭐냐에 따라서 서브쿼리 앞에 붙는 연산자가 달라짐!
    
*/

/*
    1. 단일행 서브쿼리(SINGLE ROW SUBQUERRY)
    서브쿼리의 조회 결과값의 개수 가 오로지 1개일 때 (한행 한열)
    일반 비교 연산자 사용 가능
    =,!=, ^=, <>, >, <. >=, ...
    
*/
    
-- 1) 전직원의 평균급여보다 급여를 더 적게 받는 사원들의 사원명, 직급코드, 급여 조회
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY < (SELECT AVG(SALARY)
                FROM EMPLOYEE);
                
-- 2) 최저 급여를 받는 사원의 사번, 이름, 급여, 입사일
SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE
-- FROM EMPLOYEE = 전 직원들 중 최저 급여;
WHERE SALARY = (SELECT MIN(SALARY))     
                FROM EMPLOYEE); ///???
                
                
-- 3) 노옹철 사원의 급여보다 더 많은 사람들의 사번, 이름, 부서코드, 급여 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
--WHERE SALARY > 노옹철 사원의 급여
  WHERE SALARY > (SELECT SALARY
                    FROM EMPLOYEE
                    WHERE EMP_NAME ='노옹철');
                    
                    

                    
-- >> 오라클 전용 문구
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
AND SALARY > (SELECT SALARY
                FROM EMPLOYEE
                WHERE EMP_NAME = '노옹철'); 

-- >> ANSI 구문
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE SALARY > (SELECT SALARY
                FROM EMPLOYEE
                WHERE EMP_NAME = '노옹철');
                
                
-- 4) 부서별 급여합이 가장 큰 부서의 부서코드, 급여 합 조회
-- 4_1) 먼저 부서별 급여합 중에서도 가장 큰 값 하나만 조회
SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 4_2) 부서별 급여합이 177000000원인 부서 조회(부서코드, 급여합)
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                        GROUP BY DEPT_CODE); -- 이게 메인
                        
-- 위의 두 단계를 하나의 쿼리문으로!
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = 17700000;

                        
-- 직접해보기
-- 전지연 사원과 같은 부서원들의 사번, 사원명, 전화번호, 입사일, 부서명
-- 단, 전지연은 제외
-- >> 오라클 전용 구문
SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
AND DEPT_CODE = (SELECT DEPT_CODE
                FROM EMPLOYEE
                WHERE EMP_NAME = '전지연')
AND EMP_NAME != '전지연';

SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '전지연';

-- >> ANSI 구문
SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_CODE = (SELECT DEPT_CODE
                FROM EMPLOYEE
                WHERE EMP_NAME = '전지연')
AND EMP_NAME != '전지연'; 


--------------------------------------------------------------------------------
/*
    2. 다중행 서브쿼리(MULTI ROW SUBQUERY)
    서브쿼리를 수행한 결과값이 여러 행일 때 (컬럼(열)은 한개)
    
    - IN 서브쿼리 : 여러개의 결과값 중에서 한개라도 일치하는 값이 있다면
    
    - > ANY 서브쿼리 : 여러개의 결과값 중에서 "한개라도" 클 경우 (여러개의 결과값 중에서 가장 작은값 보다 클 경우)
    - < ANY 서브쿼리 : 여러개의 결과값 중에서 "한개라도" 작을 경우(여러개의 결과값 중에서 가장 큰 값 보다 작은 경우)
    
    비교대상 > ANY(값1, 값2, 값3)
    비교대상 > 값1 OR 비교대상 > 값2 OR 비교대상 > 값3
    
    - > ALL 서브쿼리 : 여러개의 "모든" 결과값들보다 클 경우
    - < ALL 서브쿼리 : 여러개의 "모든" 결과값들보다 작을 경우
    
    비교대상 > ALL (값1, 값2, 값3)
    비교대상 > 값1 AND 비교대상 > 값2 AND 비교대상 > 값3
*/

-- 1) 유재식 또는 윤은해 사원과 같은 직급인 사원들의 사번, 사원명, 직급코드, 급여
-- 1_1) 유재식 또는 윤은해 사원이 어떤 직급인지 조회
SELECT JOB_CODE
FROM EMPLOYEE
WHERE EMP_NAME IN ('유재식', '윤은해'); -- J3, J7

-- 1_2) J3, J7인 직급의 사원들 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN ('J3', 'J7'); -- 이게 메인

-- 위의 두 단계를 하나의 쿼리로
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN (SELECT JOB_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME IN ('유재식', '윤은해')); -- = 이라고 쓰면 에러남!! 여러행으로 조회됐기 때문!
                    -- 만약에 결과값이 여러개 나올 것 같으면 그냥 IN으로 가자

-- 사원 => 대리 => 과장 => 차장 => 부장.....
-- 2) 대리 직급임에도 불구하고 과장 직급 급여들 중 최소 급여보다 많이 받는 직원 조회 (사번, 이름, 직급, 급여)

-- 2_1) 먼저 과장 직급인 사원들의 급여 조회
SELECT SALARY
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE
AND J.JOB_NAME = '과장'; -- 2200000 2200000 37600000

--2_2) 직급이 대리이면서 급여값이 위의 목록들 값 중에 하나라도 큰 사원
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '대리'
AND SALARY > ANY (2200000, 2200000, 3760000);

-- 위의 두 단계를 하나의 쿼리문으로 작성
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '대리'
AND SALARY > ANY (SELECT SALARY
                    FROM EMPLOYEE E, JOB J
                    WHERE E.JOB_CODE = J.JOB_CODE
                    AND J.JOB_NAME = '과장');
                    
-- 단일행 서브쿼리로도 가능!!
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '대리'
AND SALARY > (SELECT MIN(SALARY)
                FROM EMPLOYEE E, JOB J
                WHERE E.JOB_CODE = J.JOB_CODE
                AND J.JOB_NAME = '과장');
                
-- 3) 과장 직급임에도 불구하고 차장직급인 사원들의 모든 급여보다도 더 많이 받는 사원들의 사번, 이름, 직급명, 급여 조회
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME = '과장'
--AND SALARY> (차장 직급인 애들의 급여들)
AND SALARY> ALL (SELECT SALARY
                FROM EMPLOYEE
                JOIN JOB USING(JOB_CODE)
                WHERE JOB_NAME = '차장');
--------------------------------------------------------------------------------                

/*
    3. 다중열 서브쿼리
    결과값은 한 행이지만 나열된 컬럼수가 여러개일 경우
*/               

-- 1) 하이유 사원과 같은 부서코드, 같은 직급코드에 해당하는 사원들 조회(사원명, 부서코드, 직급코드, 입사일자)
-- 단일행 서브쿼리 ** 2개의 서브쿼리로 작성할 것!

SELECT JOB_CODE
FROM EMPLOYEE
WHERE EMP_NAME IN ('하이유');  -- J5

SELECT EMP_NAME, DEPT_CODE, JOB_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE JOB_CODE IN ('J5');

-- 위의 두 단계를 하나의 쿼리로
SELECT EMP_NAME, JOB_CODE, DEPT_CODE, JOB_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE JOB_CODE IN (SELECT JOB_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME IN ('하이유'));
                    
                    
-->> 다중열 서브쿼리로!
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) = (SELECT DEPT_CODE, JOB_CODE
                                FROM EMPLOYEE)
                                WHERE EMP_NAME = '하이유'); -- 순서 중요함! 개수 맞춰야함
                                
-- 박나라 사원과 같은 직급코드, 같은 사수를 가지고 있는 사원들의 사번, 사원명, 직급코드, 사수사번 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, MANAGER_ID
FROM EMPLOYEE
WHERE (JOB_CODE, MANAGER_ID) IN (SELECT JOB_CODE, MANAGER_ID
                                    FROM EMPLOYEE
                                    WHERE EMP_NAME = '박나라');
                                
--------------------------------------------------------------------------------
/*
    4. 다중행 다중열 서브쿼리
    서브쿼리 조회 결과값이 여러행 여러열인 경우
*/

-- 1) 각 직급별로 최소급여를 받는 사원 조회(사번, 사원명, 직급코드, 급여)
-- >> 각 직급별 최소급여 조회
SELECT JOB_CODE, MIN(SALARY) --3
FROM EMPLOYEE -- 1
GROUP BY JOB_CODE; --2

SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE = 'J2' AND SALARY = 3700000
OR      JOB_CODE = 'J7' AND SALARY = 1300000;

-- 서브쿼리를 적용해서 해보자!!
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (SELECT JOB_CODE, MIN(SALARY)
                             FROM EMPLOYEE
                             GROUP BY JOB_CODE);

-- 2) 각 부서별 최고 급여를 받는 사원들의 사번, 사원명, 부서 코드, 급여
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE, SALARY) IN (SELECT DEPT_CODE, MAX(SALARY)
                                FROM EMPLOYEE
                                GROUP BY DEPT_CODE); ---??
--------------------------------------------------------------------------------
/*
    5. 인라인 뷰(INLINE - VIEW)
    서브쿼리를 수행한 결과를 마치 테이블처럼 사용!
    
*/

-- 사원들의 사번, 이름, 보너스 포함 연봉 (별칭부여 : 연봉), 부서코드 조회 => 보너스 포함 연봉이 절대 NULL이 안나오게
-- 단, 보너스 포함 연봉이 3000만원 이상인 사원들만 조회
SELECT EMP_NO, EMP_NAME, (SALARY + SALARY * NVL(BONUS, 0)) * 12 AS "연봉", DEPT_CODE --3
FROM EMPLOYEE -- 1
WHERE (SALARY + SALARY * NVL(BONUS, 0)) * 12 >= 30000000 --2
                
SELECT EMP_NO, EMP_NAME, (SALARY + SALARY * NVL(BONUS, 0)) * 12 AS "연봉", DEPT_CODE --3
FROM EMPLOYEE;
-- 이걸 마치 존재하는 테이블인거 마냥 사용할 수 있음!! 그게 인라인뷰

SELECT EMP_NO, EMP_NAME, 연봉, DEPT_CODE -- MANAGER_ID 이건 오류남!!
FROM (SELECT EMP_NO, EMP_NAME, (SALARY + SALARY * NVL(BONUS, 0)) * 12 AS "연봉", DEPT_CODE --3
FROM EMPLOYEE) --1
WHERE 연봉 >= 30000000;




