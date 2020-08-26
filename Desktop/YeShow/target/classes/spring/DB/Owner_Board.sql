-- 점주 게시판
ALTER TABLE Owner_Board
	DROP CONSTRAINT FK_MEMBER_TO_Owner_Board; -- 회원 -> 점주 게시판

-- 점주 게시판
ALTER TABLE Owner_Board
	DROP CONSTRAINT PK_Owner_Board; -- 점주 게시판 기본키

-- 점주 게시판
DROP TABLE Owner_Board;

-- 점주 게시판
CREATE TABLE Owner_Board (
	ob_num       NUMBER(10)     NOT NULL, -- 점주게시판번호
	ob_title     VARCHAR2(500)  NULL,     -- 제목
	ob_userid    VARCHAR2(50)   NULL,     -- 작성자
	ob_contents  VARCHAR2(4000) NULL,     -- 내용
	ob_recommand NUMBER(10)     NULL,     -- 추천수
	mb_hits      NUMBER(10)     NULL,     -- 조회수
	mb_indate    DATE           NULL,     -- 등록일
	idx          NUMBER(8)      NULL      -- 회원번호
);

-- 점주 게시판 기본키
CREATE UNIQUE INDEX PK_Owner_Board
	ON Owner_Board ( -- 점주 게시판
		ob_num ASC -- 점주게시판번호
	);
	
DROP SEQUENCE Owner_Board_obnum_SEQ;
		
CREATE SEQUENCE Owner_Board_obnum_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 점주 게시판
ALTER TABLE Owner_Board
	ADD
		CONSTRAINT PK_Owner_Board -- 점주 게시판 기본키
		PRIMARY KEY (
			ob_num -- 점주게시판번호
		);

-- 점주 게시판
ALTER TABLE Owner_Board
	ADD
		CONSTRAINT FK_MEMBER_TO_Owner_Board -- 회원 -> 점주 게시판
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);
		

DROP SEQUENCE Owner_Board_ob_num_SEQ;
		
CREATE SEQUENCE Owner_Board_ob_num_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;