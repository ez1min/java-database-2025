/*
 * 서브쿼리
 * */

SELECT * FROM student;

SELECT * FROM DEPARTMENT;

-- 단일행 서브쿼리 = <> > >= < <= 로 비교
-- join으로 두 테이블 검색
SELECT s.name, d.DNAME
  FROM student s, department d
  WHERE s.DEPTNO1 = d.DEPTNO
   AND s.DEPTNO1  = 103;

-- Anthony Hopkins 학생과 같은 학과에 다니는 학생을 모두 조회
SELECT s.name, d.DNAME
  FROM student s, department d
  WHERE s.DEPTNO1 = d.DEPTNO
   AND s.DEPTNO1  = (SELECT deptno1
   					  FROM student
   					  WHERE name = 'Anthony Hopkins'); -- 학생 이름 따라 학과번호 변경 가능
   					  
 -- where절 서브쿼리에서 = 로 비교할 때 주의점
 -- where절 서브쿼리는 다중행이 되면 안됨
SELECT s.name, d.DNAME
  FROM student s, department d
 WHERE s.deptno1  = d.deptno
   AND s.deptno1  = (SELECT deptno1
					   FROM student);
 
 -- 특정 교수의 입사일 보다 뒤에 입사한 교수들의 정보 출력
 SELECT *
   FROM professor;
 
 SELECT *
   FROM department;
 
 -- 조인되는 커리부터 생성
 -- 맥 라이언교수 입사 일자
 SELECT p.name AS "PROF_NAME"
 	  , p.hiredate
 	  , d.dname AS "DEPT_NAME"
   FROM PROFESSOR p,  DEPARTMENT d 
  WHERE p.DEPTNO = d.DEPTNO
    AND p.hiredate > (SELECT hiredate
   						 FROM PROFESSOR
 					    WHERE name = 'Meg Ryan');			
 
 
 SELECT hiredate
   FROM professor
  WHERE name = 'Meg Ryan'; 
 
 COMMIT;
 
 -- 다중행 서브쿼리
 -- IN 서브쿼리 결과와 같은 값. 여러개(OR와 동일)
 -- EXISTS 서브쿼리의 값이 있는 경우 메인 쿼리
 -- >ANY 서브쿼리의 결과 중 최소값을 반환해서 수행
 -- <ANY 서브쿼리 결과 중 최대값을 반환
 -- <ALL 서브쿼리 결과 중 최소값을 반환
 -- >ALL
 
 -- 지역이 pohang main office 인 부서코드에 해당하는 직원들의 사번, 이름 , 부서번호 출력
 
 SELECT dcode
 FROM dept2
 WHERE area = 'Pohang Main Office';
 
 SELECT empno, name, deptno
   FROM emp2
  WHERE deptno IN (SELECT dcode)
 					 FROM dept2
 				    WHERE area ='Pohang Main Office';
 
 
--
 
 
 -- 서브쿼리 MIin 함수 최고값 스칼라에서 비교 연산
 SELECT name, POSITION
 	   , TO_char (pay,$777,888,888) AS "SALARY"
 	   FROM emp2
 	   WHERE pay > (SELECT min(pay)
 	   		        FROM emp2
 	   		        WHERE POSITION = 'Section head');
 
 name,POSITION
 , TO char_(pay, '$999,999,999')
 
 
 -- 다중 컬럼 서브쿼리, 파이썬 튜플과 동일
 -- 1~4햑난 중 몸무게 가장 많이 나가는 학생 출력(4행)
 SELECT grade ,name ,height ,weight
   FROM student
  WHERE (grade, weight) IN (SELECT grade, max(weight)
 							  FROM student
 							 GROUP BY grade);
  
SELECT grade, max(weight)
  FROM student
  GROUP BY grade;
 
-- 교수 테이블과 학과 department 테이블을 조회하여 학과별로 입사일이 가장 오래된 교수의 
-- 교수번호, 이름, 학과명을 출력 . 입사일 순으로 오름차순

SELECT p.profno AS "교수번호"
	 , p.name   AS "교수명"
	 , d.dname  AS "학과명"
	 , TO_char(p.hiredate, 'YYYY-MM-DD') AS "입사일"
  FROM PROFESSOR p , department d
 WHERE p.deptno = d.deptno
  AND (p.deptno, p.hiredate) IN (SELECT deptno, min(hiredate)
  								   FROM PROFESSOR
  								  WHERE deptno IS NOT NULL
  								GROUP BY deptno)
ORDER BY p.HIREDATE ASC;


SELECT deptno, min(hiredate)
  FROM PROFESSOR
 WHERE deptno IS NOT NULL
 GROUP BY deptno;

--
SELECT b.POSITION ,avg(b.pay)
  FROM emp2 b
 GROUP BY b.POSITION;

SELECT avg(b.pay)
  FROM emp2 b;

-- 상호연관쿼리로 작성
SELECT a.name, a.POSITION, a.pay
 FROM emp2 a
 WHERE a.pay >= (SELECT avg(b.pay)
 				  FROM emp2 b
 				 WHERE b.POSITION = a.POSITION);

COMMIT;

-- 여기까지, where절 서브쿼리
 SELECT *
   FROM emp2 e;

-- 조인은 건수가 많아도 한번만 실행
SELECT e.empno, e.name, e.deptno, d.DNAME AS "부서명"
  FROM emp2 e, dept2 d
 WHERE e.DEPTNO  = d.DCODE -- 조인
 
 -- 조인없이 스칼라 서브쿼리로 해결
 -- 조인으로 되는 값을 서브쿼리로 쓰면 성능에 악영향을 끼침
 -- 조인은 키끼리 비교, 밑은 where절에 걸린 것을 하나씩 비교
 SELECT e.empno, e.name, e.deptno
 	  , (SELECT dname FROM dept2 where dcode = e.deptno) AS "부서명"
 	  , (SELECT area FROM dept2 where dcode = e.deptno) AS "지역"
   FROM emp2 e;
 
 
 -- 여기까지 스칼라(select절) 서브쿼리
 
 -- from절 서브쿼리
 
SELECT *
  FROM emp2;
  
  
 SELECT  e.empno, e.name, e.birthday
 	   , deptno, emp_type, tel
   FROM emp2 e;
 
 -- from절에 소괄호 내에 서브쿼리를 작성하는 방식
 SELECT es.empno, es.name
 FROM (SELECT empno, name, birthday
 		    , deptno, emp_type, tel
		 FROM emp2) es
		 
SELECT grpP.deptno, grpP.paySum
  FROM (SELECT deptno, sum(pay) AS paySum
  FROM emp2
  GROUP BY deptno) grpP;

		 
SELECT deptno, sum(pay)
  FROM emp2
GROUP BY deptno;



-- 각 부서별 평균 연봉
SELECT grpP.deptno, grpP.payAvg
  FROM (SELECT deptno, avg(pay) AS payAvg
  FROM emp2
  GROUP BY deptno) grpP;

-- emp2와 위에서 구한 값을 조인해서 평균연봉보다 얼마나 차이 나는지

SELECT  e.name, e.empno, e.POSITION, e.pay, g.PAYAVG 
	  , (e.pay - g.PAYAVG ) AS 평균연봉차액
  FROM emp2 e, (SELECT deptno, avg(pay) AS payAvg
    			  FROM emp2
    			 GROUP BY deptno) g
  WHERE e.DEPTNO  = g.deptno;

-- with 절로 가상테이블 형태 서브쿼리
WITH g1 AS
(
	SELECT deptno, avg(pay) AS payavg
	  FROM emp2
	 GROUP BY deptno
)
--
SELECT  e.name, e.empno, e.POSITION, e.deptno, e.pay, g1.payavg
	  , (e.pay - g1.payavg) AS "평균연봉차액"
  FROM emp2 e, g1
 WHERE e.DEPTNO  = g1.deptno;

-- 위 2개 차이 없음 결과 같음

-- where절 서브쿼리 > from절 서브쿼리 > select절 서브쿼리(사용자정의함수로 대체)


-- 서브쿼리 사용 시 NULL값 처리

INSERT INTO emp2 (empno, name, birthday, deptno, emp_type, tel)
VALUES (202000219, 'Ray Osmond','1988-03-22', '999', 'Intern', '02)909-2345');
COMMIT;

SELECT * FROM emp2;

-- 각 직원의 부서명을 같이 출력하라.
-- NULL은 출력을 안하는게 좋음
SELECT name, deptno, nvl((SELECT dname FROM dept2 WHERE dcode=emp2.deptno), '부서명없음') AS "부서명"
  FROM emp2
ORDER BY deptno;

-- 위의 쿼리 조인으로 변경 가능
SELECT e.name, e.deptno, nvl(d.dname, '부서명 없음') AS "부서명"
  FROM emp2 e, dept2 d
 WHERE e.DEPTNO = d.dcode(+)
ORDER BY deptno, name;

COMMIT;