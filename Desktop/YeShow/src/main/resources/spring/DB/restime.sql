-- 예약시간
ALTER TABLE restime
	DROP CONSTRAINT FK_restaurant_TO_restime; -- 식당 업로드 -> 예약시간

-- 예약시간
ALTER TABLE restime
	DROP CONSTRAINT FK_MEMBER_TO_restime; -- 회원 -> 예약시간

-- 예약시간
ALTER TABLE restime
	DROP CONSTRAINT PK_restime; -- 예약시간 기본키

-- 예약시간
DROP TABLE restime;

-- 예약시간
CREATE TABLE restime (
	timenum    NYMBER(8)    NOT NULL, -- 예약시간 번호
	opentime1  NUMBER(8)    NOT NULL, -- 시작시간1
	openmin1   number(8)    NOT NULL, -- 시작분1
	closetime1 NUMBER(8)    NOT NULL, -- 마감시간1
	closemin1  number(8)    NOT NULL, -- 마감분1
	opentime2  NUMBER(8)    NOT NULL, -- 시작시간2
	openmin2   NUMBER(8)    NOT NULL, -- 시간분2
	closetime2 NUMBER(8)    NOT NULL, -- 마감시간2
	closemin2  NUMBER(8)    NOT NULL, -- 마감분2
	resdate    VARCHAR2(10) NOT NULL, -- 날짜
	upnum      NUMBER(8)    NOT NULL, -- 업로드 번호
	idx        NUMBER(8)    NOT NULL  -- 회원번호
);

-- 예약시간 기본키
CREATE UNIQUE INDEX PK_restime
	ON restime ( -- 예약시간
		timenum ASC -- 예약시간 번호
	);

-- 예약시간
ALTER TABLE restime
	ADD
		CONSTRAINT PK_restime -- 예약시간 기본키
		PRIMARY KEY (
			timenum -- 예약시간 번호
		);

-- 예약시간
ALTER TABLE restime
	ADD
		CONSTRAINT FK_restaurant_TO_restime -- 식당 업로드 -> 예약시간
		FOREIGN KEY (
			upnum -- 업로드 번호
		)
		REFERENCES restaurant ( -- 식당 업로드
			upnum -- 업로드 번호
		);

-- 예약시간
ALTER TABLE restime
	ADD
		CONSTRAINT FK_MEMBER_TO_restime -- 회원 -> 예약시간
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);
		

DROP SEQUENCE restime_timenum_SEQ;
		
CREATE SEQUENCE  restime_timenum_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;		