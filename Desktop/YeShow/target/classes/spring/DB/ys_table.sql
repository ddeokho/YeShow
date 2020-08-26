-- 테이블 정보
ALTER TABLE ys_table
	DROP CONSTRAINT FK_restaurant_TO_ys_table; -- 식당 업로드 -> 테이블 정보

-- 테이블 정보
ALTER TABLE ys_table
	DROP CONSTRAINT FK_MEMBER_TO_ys_table; -- 회원 -> 테이블 정보

-- 테이블 정보
ALTER TABLE ys_table
	DROP CONSTRAINT PK_ys_table; -- 테이블 정보 기본키

-- 테이블 정보
DROP TABLE ys_table;

-- 테이블 정보
CREATE TABLE ys_table (
	tablenum   number(8)    NOT NULL, -- 테이블 번호
	tableuser  NUMBER(8)    NOT NULL, -- 테이블 인원수
	opentime1  VARCHAR2(30) NOT NULL, -- 시작시간1
	closetime1 VARCHAR2(30) NOT NULL, -- 마감시간1
	opentime2  VARCHAR2(30) NULL,     -- 시작시간2
	closetime2 VARCHAR2(30) NULL,     -- 마감시간2
	upnum      NUMBER(8)    NOT NULL, -- 업로드 번호
	idx        NUMBER(8)    NOT NULL  -- 회원번호
);

-- 테이블 정보 기본키
CREATE UNIQUE INDEX PK_ys_table
	ON ys_table ( -- 테이블 정보
		tablenum ASC -- 테이블 번호
	);

-- 테이블 정보
ALTER TABLE ys_table
	ADD
		CONSTRAINT PK_ys_table -- 테이블 정보 기본키
		PRIMARY KEY (
			tablenum -- 테이블 번호
		);

-- 테이블 정보
ALTER TABLE ys_table
	ADD
		CONSTRAINT FK_restaurant_TO_ys_table -- 식당 업로드 -> 테이블 정보
		FOREIGN KEY (
			upnum -- 업로드 번호
		)
		REFERENCES restaurant ( -- 식당 업로드
			upnum -- 업로드 번호
		);

-- 테이블 정보
ALTER TABLE ys_table
	ADD
		CONSTRAINT FK_MEMBER_TO_ys_table -- 회원 -> 테이블 정보
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);
		
DROP SEQUENCE ys_table_tablenum_SEQ;
		
CREATE SEQUENCE  ys_table_tablenum_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;