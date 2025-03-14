/*
 * UPDATE/DELETE
 * 데이터 변경 삭제
 * */


-- 삭제
SELECT count(*) FROM professor_new;

SELECT *FROM professor_new;

DELETE FROM PROFESSOR_NEW 
	WHERE profno = 1001;

DELETE FROM professor_new; -- TRUNCATE와 동일하나 테이블 초기화는 없음

INSERT INTO PROFESSOR_NEW 
SELECT * FROM PROFESSOR_NEW;



UPDATE professor_new SET
	ID = 'SusanS'
   ,PAY = 350
WHERE PROFNO = 4002;




/*
 * 트랜젝션, COMMIT, ROLLBACK
 * */
SET TRANACTION READ WRITE; --안써도 무방



UPDATE professor_new SET
	ID = 'SusanS'
   ,PAY = 350

SELECT * FROM professor_new;

ROLLBACK;
COMMIT;

