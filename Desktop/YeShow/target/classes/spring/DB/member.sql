-- 회원
ALTER TABLE MEMBER
	DROP CONSTRAINT PK_MEMBER; -- 회원 기본키

-- 회원
DROP TABLE MEMBER;

-- 회원
CREATE TABLE MEMBER (
	idx     NUMBER(8)     NOT NULL, -- 회원번호
	name    VARCHAR2(30)  NOT NULL, -- 아이디
	userid1 VARCHAR2(20)  NOT NULL, -- 이름
	email   VARCHAR2(100) NULL,     -- 이메일
	pwd1    VARCHAR2(18)  NOT NULL, -- 비밀번호
	hp1     CHAR(3)       NOT NULL, -- 연락처1
	hp2     CHAR(4)       NOT NULL, -- 연락처2
	hp3     CHAR(4)       NOT NULL, -- 연락처3
	post    CHAR(5)       NULL,     -- 우편번호
	addr1   VARCHAR2(100) NULL,     -- 주소1
	addr2   VARCHAR2(100) NULL,     -- 주소2
	indate  DATE          NULL,     -- 가입일
	status  VARCHAR2(30)  NULL,     -- 회원상태
	penalty NUMBER(2)     NULL      -- 패널티
);

-- 회원 기본키
CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER ( -- 회원
		idx ASC -- 회원번호
	);

-- 회원
ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER -- 회원 기본키
		PRIMARY KEY (
			idx -- 회원번호
		);
		
--시퀸스명	
DROP SEQUENCE MEMBER_IDX_SEQ;
		
CREATE SEQUENCE MEMBER_IDX_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;