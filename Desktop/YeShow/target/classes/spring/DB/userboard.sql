-- 게시판
ALTER TABLE userboard
	DROP CONSTRAINT FK_MEMBER_TO_userboard; -- 회원 -> 게시판

-- 게시판
ALTER TABLE userboard
	DROP CONSTRAINT PK_userboard; -- 게시판 기본키

-- 게시판
DROP TABLE userboard;

-- 게시판
CREATE TABLE userboard (
	QnA_idx     number(10)     NOT NULL, -- 글번호
	QnA_userid  varchar2(30)   NULL,     -- 작성자
	QnA_title   varchar2(500)  NULL,     -- 제목
	Qna_content varchar2(1000) NOT NULL, -- 내용
	QnA_img1    varchar2(500)  NULL,     -- 첨부이미지1
	QnA_img     varchar2(500)  NULL,     -- 첨부이미지2
	QnA_img2    varchar2(500)  NULL,     -- 첨부이미지3
	QnA_img4    varchar2(500)  NULL,     -- 첨부이미지4
	wdate       DATE           NOT NULL, -- 작성일
	idx         NUMBER(8)      NULL,     -- 회원번호
	ch          varchar2(1)    NULL      -- 상태
);

-- 게시판 기본키
CREATE UNIQUE INDEX PK_userboard
	ON userboard ( -- 게시판
		QnA_idx ASC -- 글번호
	);

-- 게시판
ALTER TABLE userboard
	ADD
		CONSTRAINT PK_userboard -- 게시판 기본키
		PRIMARY KEY (
			QnA_idx -- 글번호
		);

-- 게시판
ALTER TABLE userboard
	ADD
		CONSTRAINT FK_MEMBER_TO_userboard -- 회원 -> 게시판
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);
		
		
DROP SEQUENCE userboard_QnA_idx_SEQ;
		
CREATE SEQUENCE userboard_QnA_idx_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;