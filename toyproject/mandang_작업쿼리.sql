-- madang 로그인

-- 조회
SELECT * FROM Students;

-- 더미데이터
INSERT INTO Students (std_id, std_name, std_mobile, std_regyear)
VALUES (seq_student.nextval, '홍길동', '010-9999-8888', 1997);
INSERT INTO Students (std_id, std_name, std_mobile, std_regyear)
VALUES (seq_student.nextval, '홍길순', '010-8888-7777', 2000);

COMMIT;