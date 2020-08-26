-- 식당 댓글
ALTER TABLE res_review
	DROP CONSTRAINT FK_restaurant_TO_res_review; -- 식당 업로드 -> 식당 댓글

-- 식당 댓글
ALTER TABLE res_review
	DROP CONSTRAINT FK_MEMBER_TO_res_review; -- 회원 -> 식당 댓글

-- 식당 댓글
ALTER TABLE res_review
	DROP CONSTRAINT PK_res_review; -- 식당 댓글 기본키

-- 식당 댓글
DROP TABLE res_review;

-- 식당 댓글
CREATE TABLE res_review (
	res_reviewNum    NUMBER(8)     NOT NULL, -- 식당댓글번호
	res_reviewMsg    varchar2(200) NOT NULL, -- 식당댓글내용
	res_reviewWriter varchar2(30)  NOT NULL, -- 식당댓글작성자
	res_reviewDate   DATE          NOT NULL, -- 식당댓글작성시간
	upnum            NUMBER(8)     NOT NULL, -- 업로드 번호
	idx              NUMBER(8)     NOT NULL, -- 회원번호
	RES_STAR         number(8)     NULL      -- 평점
);

-- 식당 댓글 기본키
CREATE UNIQUE INDEX PK_res_review
	ON res_review ( -- 식당 댓글
		res_reviewNum ASC -- 식당댓글번호
	);

-- 식당 댓글
ALTER TABLE res_review
	ADD
		CONSTRAINT PK_res_review -- 식당 댓글 기본키
		PRIMARY KEY (
			res_reviewNum -- 식당댓글번호
		);

-- 식당 댓글
ALTER TABLE res_review
	ADD
		CONSTRAINT FK_restaurant_TO_res_review -- 식당 업로드 -> 식당 댓글
		FOREIGN KEY (
			upnum -- 업로드 번호
		)
		REFERENCES restaurant ( -- 식당 업로드
			upnum -- 업로드 번호
		);

-- 식당 댓글
ALTER TABLE res_review
	ADD
		CONSTRAINT FK_MEMBER_TO_res_review -- 회원 -> 식당 댓글
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);
		
DROP SEQUENCE table_tablenum_SEQ;
		
CREATE SEQUENCE res_review_seq
START WITH 1
INCREMENT BY 1
NOCACHE;