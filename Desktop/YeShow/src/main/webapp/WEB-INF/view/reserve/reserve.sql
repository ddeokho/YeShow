-- 예약확인
ALTER TABLE RESERVE
	DROP CONSTRAINT FK_MEMBER_TO_RESERVE; -- 회원 -> 예약확인

-- 예약확인
ALTER TABLE RESERVE
	DROP CONSTRAINT FK_restaurant_TO_RESERVE; -- 식당 업로드 -> 예약확인

-- 예약확인
ALTER TABLE RESERVE
	DROP CONSTRAINT PK_RESERVE; -- 예약확인 기본키

-- 예약확인
DROP TABLE RESERVE;

-- 예약확인
CREATE TABLE RESERVE (
	num      NUMBER(4)    NOT NULL, -- 예약번호
	idx      NUMBER(8)    NULL,     -- 회원번호
	re_time  VARCHAR2(50) NULL,     -- 예약시간
	re_table NUMBER(3)    NULL,     -- 좌석지정
	upnum    NUMBER(8)    NULL      -- 업로드 번호
);

-- 예약확인 기본키
CREATE UNIQUE INDEX PK_RESERVE
	ON RESERVE ( -- 예약확인
		num ASC -- 예약번호
	);

-- 예약확인
ALTER TABLE RESERVE
	ADD
		CONSTRAINT PK_RESERVE -- 예약확인 기본키
		PRIMARY KEY (
			num -- 예약번호
		);

-- 예약확인
ALTER TABLE RESERVE
	ADD
		CONSTRAINT FK_MEMBER_TO_RESERVE -- 회원 -> 예약확인
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 예약확인
ALTER TABLE RESERVE
	ADD
		CONSTRAINT FK_restaurant_TO_RESERVE -- 식당 업로드 -> 예약확인
		FOREIGN KEY (
			upnum -- 업로드 번호
		)
		REFERENCES restaurant ( -- 식당 업로드
			upnum -- 업로드 번호
		);
		
--시퀸스명	
DROP SEQUENCE RESERVE_NUM_SEQ;

CREATE SEQUENCE RESERVE_NUM_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;