/*
 * VIEW
 * */
-- sysdba로 실행해야 함
GRANT CREATE VIEW TO sampleuser;


--
SELECT * FROM emp2;

-- 뷰 생성 ddl
CREATE OR REPLACE VIEW V_emp2
AS 
	SELECT empno, name, deptno, tel, POSITION, pempno 
	  FROM emp2;

-- 뷰로 select
SELECT *
	FROM v_emp2;
	
-- 뷰로 insert
-- 단 뷰에 속하지 않는 컬럼중 NOT-NULL 조건이 있으면 데이터 삽입 불가
INSERT INTO v_emp2 VALUES (20000219,'Tom Holland', 1004, '051)563-4554','IT Programmer',19960623);

-- deptno 컬럼이 not null 인데 뷰에 없어서 insert 불가
INSERT INTO v_emp2 VALUES (20000220,'Zen Daiya', '051)583-6254','IT Programmer',19960623);

COMMIT;

-- CRUD 중 SELECT만 가능하게 만들려면
CREATE OR REPLACE VIEW V_emp2
AS
	SELECT empno, name, deptno, tel , POSITION, pempno
	  FROM emp2
WITH READ ONLY;

-- 삽입 불가
INSERT INTO v_emp2 VALUES (20000220,'Hugo Sung', 1004, '051)583-6254','IT Programmer',19960623);


-- 복합뷰. 조인등으로 여러 테이블을 합쳐서 보여주는 뷰
-- 복합뷰는 INSERT, UPDATE, DELETE가 거의 불가

CREATE OR REPLACE V_emp3
AS

	SELECT e.EMPNO, e.NAME, e.DEPTNO, d.DNAME
	  FROM emp2 e, dept2 d
	  WHERE e.deptno = d.dcode;
	
-- 조회
	


