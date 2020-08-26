-- 예약확인
ALTER TABLE RESERVE
	DROP CONSTRAINT FK_MEMBER_TO_RESERVE; -- 회원 -> 예약확인

-- 예약확인
ALTER TABLE RESERVE
	DROP CONSTRAINT FK_restaurant_TO_RESERVE; -- 식당 업로드 -> 예약확인

-- 예약확인
ALTER TABLE RESERVE
	DROP CONSTRAINT FK_ys_table_TO_RESERVE; -- 테이블 정보 -> 예약확인

-- 예약확인
ALTER TABLE RESERVE
	DROP CONSTRAINT PK_RESERVE; -- 예약확인 기본키

-- 예약확인
DROP TABLE RESERVE;

-- 예약확인
CREATE TABLE RESERVE (
	num        NUMBER(8)    NOT NULL, -- 예약번호
	idx        NUMBER(8)    NULL,     -- 회원번호
	re_resuser VARCHAR2(50) NULL,     -- 예약자이름
	re_restime VARCHAR2(50) NULL,     -- 예약시간
	re_resname VARCHAR2(50) NULL,     -- 식당이름
	upnum      NUMBER(8)    NULL,     -- 업로드 번호
	tablenum   number(8)    NULL,     -- 테이블 번호
	resdate    VARCHAR2(50) NULL      -- 예약날짜
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
		);

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

-- 예약확인
ALTER TABLE RESERVE
	ADD
		CONSTRAINT FK_ys_table_TO_RESERVE -- 테이블 정보 -> 예약확인
		FOREIGN KEY (
			tablenum -- 테이블 번호
		)
		REFERENCES ys_table ( -- 테이블 정보
			tablenum -- 테이블 번호
		);
		
		
DROP SEQUENCE reserve_num_SEQ;
		
CREATE SEQUENCE reserve_num_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;