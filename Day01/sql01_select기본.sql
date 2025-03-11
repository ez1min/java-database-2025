/*
 * SQL - DML - SELECT 학습
 */

-- 01. HR.employees 테이블 모든 데이터를 조회하세요.(107건)
SELECT * -- 발음 asterik -> ALL. 모든 컬럼을 다 보여라. 
  FROM employees;

-- 02. HR.employees중 employee_id, first_name, last_name, email, hire_date 출력하라.(107행)
SELECT employee_id, first_name, last_name, email, hire_date
  FROM employees;

-- 03. 02번의 쿼리를 컬렴영을 변경해서 출력하시오. '직원번호','이름','성','이메일','입사일자'로 변경하시오(107행)
SELECT employee_id AS "직원번호"
     , first_name  AS "이름"
     , last_name  AS "성"
     , email  AS "이메일"
     , hire_date AS "입사일자"
  FROM employees;

-- 04. employees에서 job_id가 중복되지 않게 출력하시오.(행)
SELECT Distinct job_id
	FROM employees;

-- 05. employees 테이블의 이름과 성을 붙여서 full_name 이름으로, phone_number 출력(107행)
SELECT first_name  ||  '  '  || last_name  AS "full_name"
     , phone_number 
	FROM employees;
 
 SELECT first_name || last_name || phone_number
 	FROM employees;
 
 -- 06. employees 테이블 직원들 정보를 아리와 나오도록 출력하시오.(107행)
 /*
  * full_name(emoployee_id) - job_id[hire_data]	/ phone_number 하나의 컬럼에
  * Seteve king(100) -AD_PRES[2003-06-17 00:00:)) 515.123.4566
  * ...
  */
SELECT first_name || ' ' || last_name || '(' || employee_id || ') - '
       || job_id  || '[' || hire_date || '] / ' || phone_number AS "total info"
FROM employees;

/*
 * 조건절 - WHERE
 * */

-- 연습. employees 테이블에서 employee_id가 110인 직원을 출력하세요.(1행)
SELECT *
  FROM employees
 WHERE employee_id = 110;

-- first_name 이 John인 직원을 출력 하시오.

SELECT *
  FROM employees 
 WHERE first_name = 'John';

-- hire_date 가 2006-02-12인 직원을 출력하시오.

SELECT *
  FROM employees
 WHERE hire_date = '2006-02-12'; -- 날짜 타입은 문자열처럼 비교하면 됨
 
 -- 데이터타입 숫자형, 문자형, 날짜형 등
 
 /*
  * WHERE 절에 사용하는 연산자
  * ● = : equal. 타 프로그래밍 언어와 달리 = 하나만 씀
  * ● !=, <>: not equal 같지 않다 
  * ● >, >=, <, <= : 크다, 크거나 같다, 작다, 작거나 같다
  * ● BETWEEN a AND b : 특정값이 a와 b사이에 있다 = a이상 b이하에 포함
  * ● IN(a,b,c) : 특정값이 a이거나 b이거나 c중 하나 
  * ● LIKE : SQL에서 문자열 비교시 특화된 연산자
  * ● IS NULL, IS NOT NULL : NULL 값을 검색할 때, NULL 값이 아닌 것을 검색할 때
  * ● a AND b : a와 b 조건을 모두 만족해야 True
  * ● a OR b :a와 b 둘 중 하나라도 만족하면 True
  * ● NOT a : a가 아닌 조건 
  **/
 
 
SELECT *
  FROM employees
 WHERE hire_date != '2006-02-12'; -- 날짜 타입은 문자열처럼 비교하면 됨
 
 
 -- between은 초과 ,미만이 아님, 이상, 이하임!
SELECT *
  FROM employees
 WHERE salary BETWEEN 9000 AND 15000;  -- 날짜 타입은 문자열처럼 비교하면 됨
 -- and와 >= <= 똑같이 구현 가능
 
 SELECT *
  FROM employees
 WHERE salary >= 9000 AND salary <=15000;  -- 날짜 타입은 문자열처럼 비교하면 됨
 
 SELECT *
   FROM employees 
  WHERE first_name in('John','Steven','Neena');
 
  SELECT *
   FROM employees 
  WHERE first_name = 'John'
  	 OR first_name = 'Steven'
     OR first_name = 'Neena';
  
  --NULL 비교
  SELECT *
    FROM employees
   WHERE commission_pct  = NULL;
  
  SELECT *
    FROM employees
   WHERE commission_pct  IS NULL;
    
  SELECT *
    FROM employees
   WHERE commission_pct  IS NOT NULL;
  
  -- LIKE 문자열 패턴으로 검색
 SELECT *
   FROM employees
  WHERE job_id 
