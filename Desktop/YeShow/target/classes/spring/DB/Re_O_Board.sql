-- 점주 답글 게시판
ALTER TABLE Re_O_Board
	DROP CONSTRAINT FK_Owner_Board_TO_Re_O_Board; -- 점주 게시판 -> 점주 답글 게시판

-- 점주 답글 게시판
ALTER TABLE Re_O_Board
	DROP CONSTRAINT FK_MEMBER_TO_Re_O_Board; -- 회원 -> 점주 답글 게시판

-- 점주 답글 게시판
ALTER TABLE Re_O_Board
	DROP CONSTRAINT PK_Re_O_Board; -- 점주 답글 게시판 기본키

-- 점주 답글 게시판
DROP TABLE Re_O_Board;

-- 점주 답글 게시판
CREATE TABLE Re_O_Board (
	rob_num      NUMBER(10)     NOT NULL, -- 답글게시판번호
	ob_num       NUMBER(10)     NULL,     -- 점주게시판번호
	rob_contents VARCHAR2(4000) NULL,     -- 내용
	rob_image    VARCHAR2(500)  NULL,     -- 이미지
	rob_indate   DATE           NULL,     -- 작성일
	idx          NUMBER(8)      NULL      -- 회원번호
);

-- 점주 답글 게시판 기본키
CREATE UNIQUE INDEX PK_Re_O_Board
	ON Re_O_Board ( -- 점주 답글 게시판
		rob_num ASC -- 답글게시판번호
	);

-- 점주 답글 게시판
ALTER TABLE Re_O_Board
	ADD
		CONSTRAINT PK_Re_O_Board -- 점주 답글 게시판 기본키
		PRIMARY KEY (
			rob_num -- 답글게시판번호
		);

-- 점주 답글 게시판
ALTER TABLE Re_O_Board
	ADD
		CONSTRAINT FK_Owner_Board_TO_Re_O_Board -- 점주 게시판 -> 점주 답글 게시판
		FOREIGN KEY (
			ob_num -- 점주게시판번호
		)
		REFERENCES Owner_Board ( -- 점주 게시판
			ob_num -- 점주게시판번호
		);

-- 점주 답글 게시판
ALTER TABLE Re_O_Board
	ADD
		CONSTRAINT FK_MEMBER_TO_Re_O_Board -- 회원 -> 점주 답글 게시판
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);
		
DROP SEQUENCE Re_O_Board_robnum_SEQ;
		
CREATE SEQUENCE  Re_O_Board_robnum_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;