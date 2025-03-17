/*
 * 시퀀스. 자동증가되는값
 * */

-- 시퀀스 사용않는 주문 테이블
CREATE TABLE order_noseq(
	ORDER_idx NUMBER PRIMARY KEY,
	ORDER_nm  varchar(20) NOT NULL,
	ORDER_prd varchar(100)NOT NULL,
	qty		  NUMBER DEFAULT 1
);

-- 시퀀스를 사용하는 주문 테이블
CREATE TABLE order_seq(
	ORDER_idx NUMBER PRIMARY KEY,
	ORDER_nm  varchar(20) NOT NULL,
	ORDER_prd varchar(100)NOT NULL,
	qty		  NUMBER DEFAULT 1
);

COMMIT;

-- 시퀀스생성
CREATE SEQUENCE S_order 
INCREMENT BY 1
START WITH 1;

-- 시퀀스 없는 order_noseq
INSERT INTO ORDER_noseq VALUES (1,'홍길동','망고', 20 );
INSERT INTO ORDER_noseq VALUES (2,'홍길동','망고', 10 );
INSERT INTO ORDER_noseq VALUES (3,'홍길순','블루베리', 22 );

SELECT * FROM order_noseq

-- 시퀀스 쓰면 order_seq 
INSERT INTO ORDER_seq VALUES (S_order.nextval,'홍길동','애플망고',10);
INSERT INTO ORDER_seq VALUES (S_order.nextval,'홍길동','망고',20);
INSERT INTO ORDER_seq VALUES (S_order.nextval,'홍길순','딸기',10);


COMMIT;

SELECT * FROM order_seq;

SELECT S_order.currval FROM dual;
SELECT s_order.nextval FROM dual;

-- 시퀀스 삭제
-- DROP SEQUENCE s_order;

COMMIT;