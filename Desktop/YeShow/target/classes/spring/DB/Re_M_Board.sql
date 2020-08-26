-- 회원 답글 게시판
ALTER TABLE Re_M_Board
	DROP CONSTRAINT FK_Member_Board_TO_Re_M_Board; -- 회원 게시판 -> 회원 답글 게시판

-- 회원 답글 게시판
ALTER TABLE Re_M_Board
	DROP CONSTRAINT FK_MEMBER_TO_Re_M_Board; -- 회원 -> 회원 답글 게시판

-- 회원 답글 게시판
ALTER TABLE Re_M_Board
	DROP CONSTRAINT PK_Re_M_Board; -- 회원 답글 게시판 기본키

-- 회원 답글 게시판
DROP TABLE Re_M_Board;

-- 회원 답글 게시판
CREATE TABLE Re_M_Board (
	rmb_num      NUMBER(10)     NOT NULL, -- 답글게시판번호
	mb_num       NUMBER(10)     NULL,     -- 회원게시판번호
	idx          NUMBER(8)      NULL,     -- 회원번호
	rmb_contents VARCHAR2(4000) NULL,     -- 내용
	rmb_image    VARCHAR2(500)  NULL,     -- 이미지
	rmb_indate   DATE           NULL      -- 작성일
);

-- 회원 답글 게시판 기본키
CREATE UNIQUE INDEX PK_Re_M_Board
	ON Re_M_Board ( -- 회원 답글 게시판
		rmb_num ASC -- 답글게시판번호
	);

-- 회원 답글 게시판
ALTER TABLE Re_M_Board
	ADD
		CONSTRAINT PK_Re_M_Board -- 회원 답글 게시판 기본키
		PRIMARY KEY (
			rmb_num -- 답글게시판번호
		);

-- 회원 답글 게시판
ALTER TABLE Re_M_Board
	ADD
		CONSTRAINT FK_Member_Board_TO_Re_M_Board -- 회원 게시판 -> 회원 답글 게시판
		FOREIGN KEY (
			mb_num -- 회원게시판번호
		)
		REFERENCES Member_Board ( -- 회원 게시판
			mb_num -- 회원게시판번호
		);

-- 회원 답글 게시판
ALTER TABLE Re_M_Board
	ADD
		CONSTRAINT FK_MEMBER_TO_Re_M_Board -- 회원 -> 회원 답글 게시판
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);
		
DROP SEQUENCE Re_M_Board_rmb_num_SEQ;
		
CREATE SEQUENCE Re_M_Board_rmb_num_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;