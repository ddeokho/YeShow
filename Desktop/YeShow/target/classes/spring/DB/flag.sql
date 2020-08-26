-- 패널티 플래그
ALTER TABLE flag
	DROP CONSTRAINT FK_MEMBER_TO_flag; -- 회원 -> 패널티 플래그

-- 패널티 플래그
ALTER TABLE flag
	DROP CONSTRAINT FK_RESERVE_TO_flag; -- 예약확인 -> 패널티 플래그

-- 패널티 플래그
ALTER TABLE flag
	DROP CONSTRAINT PK_flag; -- 패널티 플래그 기본키

-- 패널티 플래그
DROP TABLE flag;

-- 패널티 플래그
CREATE TABLE flag (
	flagnum NUMBER(8) NOT NULL, -- 플래그 넘버
	flag    NUMBER(8) NULL,     -- 플래그
	idx     NUMBER(8) NOT NULL, -- 회원번호
	num     NUMBER(8) NOT NULL  -- 예약번호
);

-- 패널티 플래그 기본키
CREATE UNIQUE INDEX PK_flag
	ON flag ( -- 패널티 플래그
		flagnum ASC -- 플래그 넘버
	);

-- 패널티 플래그
ALTER TABLE flag
	ADD
		CONSTRAINT PK_flag -- 패널티 플래그 기본키
		PRIMARY KEY (
			flagnum -- 플래그 넘버
		);

-- 패널티 플래그
ALTER TABLE flag
	ADD
		CONSTRAINT FK_MEMBER_TO_flag -- 회원 -> 패널티 플래그
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);

-- 패널티 플래그
ALTER TABLE flag
	ADD
		CONSTRAINT FK_RESERVE_TO_flag -- 예약확인 -> 패널티 플래그
		FOREIGN KEY (
			num -- 예약번호
		)
		REFERENCES RESERVE ( -- 예약확인
			num -- 예약번호
		);
		
		
DROP SEQUENCE flag_flagnum_SEQ;
		
CREATE SEQUENCE flag_flagnum_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;