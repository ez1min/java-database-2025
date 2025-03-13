--SELECT *
--FROM employees;


-- 1
--SELECT commission_pct
--       ,round(MAX(salary + NVL(commission_pct, 0))) AS "max"
--       ,round(min(salary + nvl(commission_pct, 0))) AS "min"
--       ,round(avg(salary + nvl(commission_pct, 0)),1) AS "avg"
--FROM employees
--WHERE ROWNUM = 1
--GROUP BY commission_pct;

--SELECT *
--FROM emp;
--
--SELECT sal,comm
--       ,round(MAX(sal + NVL(comm, 0))) AS "max"
--       ,round(min(sal + nvl(comm, 0))) AS "min"
--       ,round(avg(sal + nvl(comm, 0)),1) AS "avg"
--   FROM emp
--GROUP BY sal,comm


--1
SELECT 
    ROUND(MAX(sal + NVL(comm, 0))) AS "max",
    ROUND(MIN(sal + NVL(comm, 0))) AS "min",
    ROUND(AVG(sal + NVL(comm, 0)),1) AS "avg"
FROM emp;


--2
SELECT *
FROM student;

SELECT birthday
	
FROM student;
