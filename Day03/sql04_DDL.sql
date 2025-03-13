/*
* DDL - 데이터 조작 언어
* CREATE, ALTER, DROP, TRUCATE...
* 객체 생성 , 수정, 삭제, 데이터 초기화
*
*
*/

-- no, name, birth 컬럼의 테이블 new_table을 작성하시오.
-- create table new_table();
CREATE TABLE new_table(
	NO NUMBER(5,0) PRIMARY KEY, -- PK는 지정하는게 기본
	name 	varchar2(20) NOT NULL,
	jumin   char(14),		-- 801225-2563953
	birth DATE 
	
	
);

-- 삭제
DROP TABLE new_table;

-- 기본값을 설정하면서 테이블 생성
CREATE TABLE new_table(
	NO NUMBER(5,0) 			PRIMARY KEY, -- PK는 지정하는게 기본
	name 	varchar2(20)    NOT NULL,
	jumin   char(14),	
	birth   DATE, 
	salary  number(7,0) DEFAULT 0 -- 아무값도 넣지않고 INSERT 하면 NULL을 0으로 대체
);

COMMENT ON  COLUMN new_table.name IS '사원이름';

-- 기본키가 두개인 테이블 생성
CREATE TABLE DOUBLEKEYTBL (
	ID NUMBER(5,0) ,
  CODE CHAR(4) , 
  NAME VARCHAR(20) NOT NULL, 
  JUMIN CHAR(14) UNIQUE ,
  CONSTRAINT PK_DOUBLEKEYTBL PRIMARY KEY(ID, CODE)
  );


-- new_member 부모테이블과 new_board 자식테이블간의 관계가 성립된 테이블을 생성하시오.
CREATE TABLE new_number (
	     idx NUMBER PRIMARY KEY,
	     name varchar2(20) NOT NULL,
	     id varchar(20) NOT NULL,
	     pass varchar2(256)
);


-- new_board 는 new_member의 pk idx를 외래키로 사용.
CREATE TABLE new_board (
    bidx NUMBER PRIMARY KEY,
    title VARCHAR2(125) NOT NULL,
    content CLOB NOT NULL,  -- LONG → CLOB으로 변경
    reg_date DATE DEFAULT SYSDATE,  -- 쉼표 제거 후 DEFAULT 위치 수정
    count NUMBER(6,0) DEFAULT 0,
    mdix NUMBER NOT NULL,
    CONSTRAINT FK_memberidx FOREIGN KEY (mdix) REFERENCES new_number(idx) -- 올바른 외래키 구문
);

-- ALTER 기존 테이블 수정 할때 사용
ALTER TABLE new_table ADD (address varchar2(200));

-- ALTER 기존 테이블에 전화번호 컬럼 추가
-- 이미 데이터가 존재하는 테이블에 NOT NULL 컬럼은 추가불가 !
ALTER TABLE new_table ADD (tel varchar2(20) NOT NULL); -- 금지

-- 컬럼 수정 200->100
ALTER TABLE new_table MODIFY (address varchar2(100));

-- DROP 테이블 삭제
-- purge 휴지통으로 보냄 
DROP TABLE new_table purge;

-- TRUNCATE 테이블 초기화
-- id(자동으로 증가하는) 1,2,3,4,5
TRUNCATE TABLE new_table;


