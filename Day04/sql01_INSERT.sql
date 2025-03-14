/*
 * DML 중 SELECT 이외
 * INSERT, UPDATE, DELETE
 * 
 * */

-- INSERT
SELECT * FROM NEW_TABLE; 

-- INSERT QUERY 기본
INSERT INTO NEW_table (NO, name, jumin, birth, salary)
VALUES (1, '홍길동', '820423-1245346', '1981-04-23', 5000);

-- 테이블 컬럼리스트와 동일한 순서, 동일한 값을 넣을 때
-- 단, 컬럼리스트와 순서도 다르고, 값리스트 갯수 다르면 컬럼리스트 생략 불가!
INSERT INTO new_table
VALUES (2,'홍길순', '830523-2245346', '1983-05-23', 4000);

-- 컬럼리스트 순서, 갯수가 다를 때는 반드시 적어줘야 함. 
INSERT INTO new_table (jumin,name, NO)
VALUES ('850413'-'1345242', '성유고', 3);

INSERT INTO new_table
VALUES (4,'홍길태','850419-1453532',NULL,NULL);

-- 한 테이블에 있는 데이터를 모두 옮기면서 새로운 테이블 생성
-- PK는 복사가 안됨!
CREATE TABLE professor_new 
 AS 
 SELECT * FROM professor;
 
SELECT * FROM PROFESSOR NEW;

-- 만들어진 테이블에 데이터 한꺼번에 옮기기 
INSERT INTO professor_new
SELECT * FROM professor;

-- 새로 만들어진 테이블 Professor_new 데이터를 삽입 테스트
INSERT INTO PROFESSOR_NEW (profno, name,id, POSITION, pay, hiredate)
VALUES (4008, 'Tom Cruise', 'Cruise','instructor', 300, '2025-03-14');

-- PROFESSOR_NEW는 PK가 없기 때문에 같은 값이 들어 감
INSERT INTO PROFESSOR_NEW (profno, name, id, POSITION, pay, hiredate)
VALUES (4008, 'Tom Holland', 'Holland','instructor', 300, '2025-03-14');

-- 대량의 데이터 삽입. 오라클 방식
INSERT ALL
	INTO new_table values(5,'홍길길','810205-1825697','1981-02-05',5000)
	INTO new_table values(6,'홍길평','810205-1825697','1981-02-05',5000)
	INTO new_table values(7,'홍길똥','810205-1825697','1981-02-05',5000)
	INTO new_table values(8,'홍길군','810205-1825697','1981-02-05',5000)
	INTO new_table values(9,'홍길치','810205-1825697','1981-02-05',5000)
SELECT * FROM dual;



SELECT * FROM new_table;