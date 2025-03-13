/*
 * JOIN
 * */

-- 개념 
-- 정규화되어 나누어진 테이블의 데이터를 한꺼번에 모아 쉽게 출력하기 위한 기법

SELECT *
  FROM EMPLOYEES  e, departments d
 WHERE e.department_id = d.DEPARTMENT_ID;

-- 총 데이터수가 2889개 출력
-- 카테시안 곱

SELECT *
  FROM employees e, departments d;

-- 오라클 방식. 편하게 쿼리를 작성하라고 만든 편법

SELECT *
  FROM employees e , DEPARTMENTS d
 WHERE e.department_id = d.department_id;

-- ANSI 표준 문법
SELECT *
  FROM employees e 
  INNER JOIN DEPARTMENTS d
  ON e.department_id = d.department_id;

-- 필요컬럼만 명세
SELECT e.EMPLOYEE_ID, e.FIRST_NAME || '  ' || e.LAST_NAME AS "full name"
	  ,e.email, e.PHONE_NUMBER
	  ,e.HIRE_DATE, e.JOB_ID 
  FROM EMPLOYEES e, departments d 
WHERE e.DEPARTMENT_ID  = d.DEPARTMENT_ID;

-- 내부조인(등가조인)
SELECT  e.EMPLOYEE_ID, e.FIRST_NAME || '  ' || e.LAST_NAME AS "full name"
	   ,e.email, e.PHONE_NUMBER
	   ,e.HIRE_DATE, e.JOB_ID 
	   ,l.city, l.STATE_PROVINCE,l.STREET_ADDRESS
 FROM  EMPLOYEES e, departments d, locations l
WHERE  e.DEPARTMENT_ID  = d.DEPARTMENT_ID
  AND  l.location_id = d.location_id
  AND  d.department_id = 60;

-- ANSI 표준은 오라클 방식보다 복잡
SELECT e.employee_id, e.first_name || ' ' || e.last_name AS "full_name"
     , e.email, e.phone_number
     , e.hire_date, e.job_id
     , d.DEPARTMENT_ID
     , d.department_name
     , l.city, l.STATE_PROVINCE, l.STREET_ADDRESS
  FROM employees e
 INNER JOIN departments d
    ON e.department_id = d.department_id
 INNER JOIN locations l
    ON l.location_id = d.location_id
 WHERE d.department_id = 60;

-- 외부조인
-- 보통 PK와 FK간의 일치하는 조건의 데이터를 찾는 것 - 내부조인
-- PK와 FK간의 일치하지 않는 조건의 데이터도 찾는 것 - 외부조인
-- 테이블1 OUTER JOIN 테이블2
-- 테이블1번을 기준으로 외부조인 LEFT OUTER JOIN
-- 테이블2번을 기준으로 외부조인 RIGIHT OUTER JOIN


SELECT *
  FROM EMPLOYEES e 
  inner JOIN DEPARTMENTS d
 	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE e.department_id IS NULL;

-- ANSI 표준문법 
-- employee 테이블에는 있는데 department테이블에는 없는 데이터를 같이 출력해라	
SELECT *
  FROM EMPLOYEES e 
 LEFT OUTER JOIN DEPARTMENTS d
 	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE e.department_id IS NULL;

-- department 테이블에는 있는데 employee 테이블에 없는 데이터를 같이 출력해라
SELECT * 
  FROM EMPLOYEES e 
 right OUTER JOIN DEPARTMENTS d
 	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 	
 -- Oracle 문법
 --(+) 만족하지 않는 조건도 더 나오게 한다는 뜻
 -- LEFT OUTER JOIN
SELECT *
  FROM EMPLOYEES e, DEPARTMENTS d  
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID(+)
 
 -- RIGHT OUTER JOIN
 SELECT *
  FROM employees e
 RIGHT OUTER JOIN departments d
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;
 
 -- INNER JOIN INNER를 생략 가능
 -- OUTER JOIN에만 LEFT, RIGHT 존재 하므로 OUTER 생략 가능
 
 -- 셀프 조인: 자기 자신을 두번 사용하는 조인
 
 SELECT   e1.employee_id
		 ,e1.first_name || ' ' || e1.LAST_NAME AS "full_emp_name"
		 ,e1.job_id
		 ,e1.manager_id
		 ,e2.first_name || ' ' || e2.LAST_NAME AS "full_mng_name"
		 ,e2.job_id
  FROM EMPLOYEES e1, EMPLOYEES e2
  WHERE e1.MANAGER_ID  = e2.EMPLOYEE_ID(+)
  ORDER BY e1.manager_id;




