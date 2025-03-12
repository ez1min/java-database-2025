 --
 
 SELECT concat('Hello','Oracle') 		-- 한행한열만 출력되는 값 = 스칼라(Scalar)값
   FROM dual;
 
 -- *많이 씀
 -- 인덱스가 1부터 시작, 일반 프로그래밍 언어의 배열이 0부터 시작하는 것과의 차이
 -- SUBSTR(변환할 값, 인덱스, 길이 )	- 파인선 substring() 함수와 동일, 
 -- 마이너스(-)인덱스는 뒤에서 위치
 SELECT  substr(email, 1, 2)              --1번줄 부터 길이 2만 
 	   , substr(email, -2, 2)
 	   , email
   FROM employees;
 
 -- 전화번호나 주민번호 자를 때 subsrt()활용
 
 -- INSTR(체크할문자열, 찾는 글자, 시작위치, 몇번째)
 SELECT instr(email, 'A', 1, 1)
 		,email
 FROM employees;
 
 SELECT '010-9999-8888'
 		,instr('010-9999-8888', '-',1,1)             --첫번째 - 4번째 위치
 		,instr('010-9999-8888', '-',1,2)             --두번째 - 9번째 위치
 FROM dual;
 
 -- LPAD(문자열, 자릿수, 채울문자) *많이 씀
 -- 2025-11-23
 -- 2025-3-12 -> 2025-03-12
 
 -- 0000100 규칙인데
 -- 101 -> 0000101 = 0000붙임
 

 SELECT LPAD('100',7,'0')
 	   ,RPAD('ABC',7,'-')
   FROM dual;
 
 -- TRIM() 함수 트리플 == 파이썬 strip()함수와 동일
 -- LTRIM(), RTRIM(), TRIM()
 SELECT  '<<<' || '     Hello Oracle     ' || '>>>'
 		,'<<<' || ltrim('     Hello Oracle     ') || '>>>'
 		,'<<<' || rtrim('     Hello Oracle     ') || '>>>'
 		,'<<<' || trim('     Hello Oracle     ' ) || '>>>'
   FROM dual;
 
 -- REPLACE(), 파이썬에도 동일하게 존재
 SELECT phone_number
 	   ,REPLACE(phone_number,'123','789')
   FROM employees;
 
 /*
  * 숫자함수
  * */
 
 -- ROUND() 반올림 함수 - 파이썬 존재
 -- CEIL() 올림함수, FLOOR()내림함수, TRUNC() 내림함수 소수점
 -- POWER() 파이썬 math.pow(), power(), 2^10 승수계산
 SELECT 786.5345 AS res1
 	   ,round(786.5345) AS res2       -- 소수점없이
 	   ,round(786.5345, 1) AS res3    -- 소수점 1번째 자리 까지
 	   ,round(786.5345, 2) AS res4    -- 소수점 2번째 자리 까지
 	   ,CEIL(786.5345)  AS res4
 	   ,floor(786.5345) AS res5
 	   ,trunc(786.5345, 3) AS res6
 	   ,CEIL(round(786.5345,3)) AS res7
 	   ,MOD(10,3) AS "나머지"
	   ,power(2,10) AS "2의 10승"
 FROM dual;
 
 /*
  * 날짜 함수 , 나라마다 표현방식 다름
  * 2025-03-12 아시아
  * March/12/2025 - 미국, 캐나다
  * 12/March/2025 - 유럽, 인도
  * 포맷팅을 많이함 
  * */
 
 -- 오늘 날짜
 SELECT sysdate -- GMT기준(그리니치시간대) +09 
 	-- AM/PM, HH, HH24, MI, SS, W, Q(분기)
 	  ,TO_CHAR(sysdate, 'YYYY-MM-DD DAY') AS 한국식
 	  ,TO_CHAR(sysdate, 'AM HH24:MI:SS') AS 시간
 	  ,TO_CHAR(sysdate, 'MON/DD/YYYY') AS 미국식
   FROM dual;

 
 -- ADD_MONTH( ) 월을 추가함수
SELECT hire_date,
       TO_CHAR(hire_date, 'YYYY-MM-DD') AS "고용일"
       ,ADD_MONTHS(hire_date, 3) AS "정규직일자"
       ,NEXT_DAY(hire_date, '월요일') AS "돌아오는 월요일"
       ,LAST_DAY(DATE '2025-02-01') AS "달 마지막 날"
FROM employees;

-- GMT+9
SELECT to_char(sysdate + INTERVAL '9' HOUR, 'YYYY-MM-DD HH24:MI:SS') AS 서울시간
  FROM dual;
 
 
/*
 * 형 변환 함수
 * */
-- TO_CHAR()
-- 숫자형을 문자형으로 변환
SELECT 12345 AS 원본,
       TO_CHAR(12345, '99999999') AS "원본+두자리"
       , TO_CHAR(12345, '0999999') AS "원본+두자리0"
       , TO_CHAR(12345, '$99999') AS "통화단위+원본"
       , TO_CHAR(12345, '99999.99') AS "소수점"
       , TO_CHAR(12345, '99,999') AS "천단위쉼표"
       
 -- TO_NUMBER() 문자형된 데이터 숫자로
 SELECT '5.0' * 5
 		,to_number('5.0') AS 숫자형변환
 --     .to number('Hello') -- 숫자로 변경 할 수 없는 상태
   FROM dual;
 
 SELECT '2025-03-12'
 		, TO_date('2025-03-12') + 10
 FROM dual;
 
 /*
  * 일반함수
  * */
 -- NVL(컬링|데이터, 바꿀 값) 널 값을 다른값으로 치환
SELECT commission_pct,
       NVL(commission_pct, 0.0)
 fROM employees;

SELECT nvl(hire_date, sysdate)
  FROM employees;

--NVL2(컬럼|데이터, 널이아닐때 처리 , 널일떄 처리 부분)
SELECT commission_pct,
       NVL2(commission_pct, salary + (salary * commission_pct), salary) AS "최종 급여"
FROM employees;

-- DECODE(A,B,'1','2') A가 B일 경우 1 아니면 2
-- 오라클만 있음

SELECT email, phone_number, job_id
	 , DECODE(job_id,'IT_PROG','개발자만세','나머지') AS 캐치프레이즈
FROM employees;
-- WHERE job_id = 'IT_PROG'

/*
 * CASE 구문, 중요
 * if, elif 중복 구문 구문과 유사
 * */

SELECT *
  FROM employees;

SELECT CASE job_id WHEN 'AD_PRES' THEN '사장'
				   WHEN 'AD_VP'   THEN '부사장'
				   WHEN 'IT_PROG' THEN '프로그래머'
				   WHEN 'SA_MAN'  THEN '영업사원'
				   ELSE '미분류'
		    END AS 직급
		  , employee_id
		  , job_id
	 FROM employees;

/*
 * 정규식(Regula Expression) - 문자열 패턴을 가지고, 동일한 패턴 데이터 추출 사용
 * ^, $, ., *, [], [^] 패턴인식할때 필요한 키워드.
 * */

-- 전화번호가 .로 구분되는 세자리 전화번호만 필터링
-- '[1-9]{6}-[1-9]{7}' 주민번호 정규식 패턴
SELECT * 
  FROM employees
 WHERE REGEXP_LIKE(phone_number, '[1-9]{3}.[1-9]{3}.[1-9]{4}');


-- first_name이 J로 시작하고, 두번째 글자가 a나 o인사람 출력
SELECT * 
  FROM employees
 WHERE REGEXP_LIKE(first_name, '^J(a|o)');


