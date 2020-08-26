-- 회원 게시판
ALTER TABLE Member_Board
	DROP CONSTRAINT FK_MEMBER_TO_Member_Board; -- 회원 -> 회원 게시판

-- 회원 게시판
ALTER TABLE Member_Board
	DROP CONSTRAINT FK_restaurant_TO_Member_Board; -- 식당 업로드 -> 회원 게시판

-- 회원 게시판
ALTER TABLE Member_Board
	DROP CONSTRAINT PK_Member_Board; -- 회원 게시판 기본키

-- 회원 게시판
DROP TABLE Member_Board;

-- 회원 게시판
CREATE TABLE Member_Board (
	mb_num       NUMBER(10)     NOT NULL, -- 회원게시판번호
	idx          NUMBER(8)      NULL,     -- 회원번호
	upnum        NUMBER(8)      NULL,     -- 업로드 번호
	mb_title     VARCHAR2(500)  NULL,     -- 제목
	mb_userid    VARCHAR2(50)   NULL,     -- 작성자
	mb_contents  VARCHAR2(4000) NULL,     -- 내용
	mb_recommand NUMBER(10)     NULL,     -- 추천수
	mb_scroe     NUMBER(1)      NULL,     -- 별점
	mb_hits      NUMBER(10)     NULL,     -- 조회수
	mb_select    VARCHAR2(50)   NULL,     -- 말머리
	mb_indate    DATE           NULL      -- 등록일
);

-- 회원 게시판 기본키
CREATE UNIQUE INDEX PK_Member_Board
	ON Member_Board ( -- 회원 게시판
		mb_num ASC -- 회원게시판번호
	);

-- 회원 게시판
ALTER TABLE Member_Board
	ADD
		CONSTRAINT PK_Member_Board -- 회원 게시판 기본키
		PRIMARY KEY (
			mb_num -- 회원게시판번호
		);

-- 회원 게시판
ALTER TABLE Member_Board
	ADD
		CONSTRAINT FK_MEMBER_TO_Member_Board -- 회원 -> 회원 게시판
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);

-- 회원 게시판
ALTER TABLE Member_Board
	ADD
		CONSTRAINT FK_restaurant_TO_Member_Board -- 식당 업로드 -> 회원 게시판
		FOREIGN KEY (
			upnum -- 업로드 번호
		)
		REFERENCES restaurant ( -- 식당 업로드
			upnum -- 업로드 번호
		);
		
DROP SEQUENCE Member_Board_mb_num_SEQ;
		
CREATE SEQUENCE  Member_Board_mb_num_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;