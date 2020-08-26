-- 파일 업로드
ALTER TABLE FileUpload
	DROP CONSTRAINT FK_Member_Board_TO_FileUpload; -- 회원 게시판 -> 파일 업로드

-- 파일 업로드
ALTER TABLE FileUpload
	DROP CONSTRAINT FK_Owner_Board_TO_FileUpload; -- 점주 게시판 -> 파일 업로드

-- 파일 업로드
ALTER TABLE FileUpload
	DROP CONSTRAINT PK_FileUpload; -- 파일 업로드 기본키

-- 파일 업로드
DROP TABLE FileUpload;

-- 파일 업로드
CREATE TABLE FileUpload (
	fup_num VARCHAR2(50)  NOT NULL, -- 파일 업로드 넘버
	mb_num  NUMBER(10)    NULL,     -- 회원게시판번호
	ob_num  NUMBER(10)    NULL,     -- 점주게시판번호
	fname   VARCHAR2(100) NOT NULL  -- 파일
);

-- 파일 업로드 기본키
CREATE UNIQUE INDEX PK_FileUpload
	ON FileUpload ( -- 파일 업로드
		fup_num ASC -- 파일 업로드 넘버
	);

-- 파일 업로드
ALTER TABLE FileUpload
	ADD
		CONSTRAINT PK_FileUpload -- 파일 업로드 기본키
		PRIMARY KEY (
			fup_num -- 파일 업로드 넘버
		);

-- 파일 업로드
ALTER TABLE FileUpload
	ADD
		CONSTRAINT FK_Member_Board_TO_FileUpload -- 회원 게시판 -> 파일 업로드
		FOREIGN KEY (
			mb_num -- 회원게시판번호
		)
		REFERENCES Member_Board ( -- 회원 게시판
			mb_num -- 회원게시판번호
		);

-- 파일 업로드
ALTER TABLE FileUpload
	ADD
		CONSTRAINT FK_Owner_Board_TO_FileUpload -- 점주 게시판 -> 파일 업로드
		FOREIGN KEY (
			ob_num -- 점주게시판번호
		)
		REFERENCES Owner_Board ( -- 점주 게시판
			ob_num -- 점주게시판번호
		);
	
create sequence FileUpload_fup_num_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;