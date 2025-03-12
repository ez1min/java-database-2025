/* 내장함수
 * */

/* 문자(열)함수 */

-- INITCAL()
SELECT initcap('hello oracle')	AS "result"
  FROM dual;	-- 실제하지 않는 테이블(Oracle만!)
  
-- LOWER() 모든 글자 소문자, UPPER() 모든 글자 대문자로
 SELECT LOWER(first_name) AS "first_name"
 	    ,UPPER(last_name) AS "last_name"
 	    ,first_name AS "Original first_name"
   FROM employees;

-- LENGTH() / LENGTUB() 함수
SELECT LENGTH('Hello oracle')			-- 영어는 글자길이 12
	,   LENGTHB('Hello oracle')			-- 12bytes
	,	LENGTH('반가워요 오라클')		-- 한글 글자길이 8
	,	LENGTHB('반가워요 오라클')		-- 22bytes
	,	ASCII('A')
	,	ASCII('a')
	,	ASCII('가')
	FROM dual;

--CONCAT() == ||와 동일 기능
SELECT CONCAT(CONCAT(first_name, ' '), last_name) AS "full name"
  FROM employees;
