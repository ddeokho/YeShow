-- 댓글
ALTER TABLE recontents
	DROP CONSTRAINT FK_userboard_TO_recontents; -- 게시판 -> 댓글

-- 댓글
ALTER TABLE recontents
	DROP CONSTRAINT FK_MEMBER_TO_recontents; -- 회원 -> 댓글

-- 댓글
ALTER TABLE recontents
	DROP CONSTRAINT PK_recontents; -- 댓글 기본키

-- 댓글
DROP TABLE recontents;

-- 댓글
CREATE TABLE recontents (
	Re_QnA_idx     number(8)      NOT NULL, -- 댓글번호
	QnA_idx        number(10)     NOT NULL, -- 글번호
	Re_QnA_adminid varchar2(30)   NULL,     -- 작성자
	Re_QnA_content varchar2(1000) NOT NULL, -- 내용
	wdate          DATE           NOT NULL, -- 작성일
	idx            NUMBER(8)      NULL      -- 회원번호
);

-- 댓글 기본키
CREATE UNIQUE INDEX PK_recontents
	ON recontents ( -- 댓글
		Re_QnA_idx ASC -- 댓글번호
	);

-- 댓글
ALTER TABLE recontents
	ADD
		CONSTRAINT PK_recontents -- 댓글 기본키
		PRIMARY KEY (
			Re_QnA_idx -- 댓글번호
		);

-- 댓글
ALTER TABLE recontents
	ADD
		CONSTRAINT FK_userboard_TO_recontents -- 게시판 -> 댓글
		FOREIGN KEY (
			QnA_idx -- 글번호
		)
		REFERENCES userboard ( -- 게시판
			QnA_idx -- 글번호
		);

-- 댓글
ALTER TABLE recontents
	ADD
		CONSTRAINT FK_MEMBER_TO_recontents -- 회원 -> 댓글
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);
		
DROP SEQUENCE recontents_Re_QnA_idx_SEQ;
		
CREATE SEQUENCE recontents_Re_QnA_idx_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;