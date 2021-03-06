--답변형 게시판
DROP TABLE BOARD;

CREATE TABLE BOARD(
	IDX NUMBER CONSTRAINT BOARD_IDX_PK PRIMARY KEY,
	NAME VARCHAR2(30) NOT NULL,
	EMAIL VARCHAR2(100),
	HOMEPAGE VARCHAR2(100),
	PWD VARCHAR2(20) NOT NULL,
	SUBJECT VARCHAR2(200),
	CONTENT VARCHAR2(2000),
	WDATE TIMESTAMP,
	READNUM NUMBER DEFAULT 0, --조회수
	FILENAME VARCHAR2(100),--첨부파일명
	FILESIZE NUMBER, --파일 크기
	REFER NUMBER, --글 그룹번호 [답변형 게시판일 때 사용]
	LEV NUMBER, --답변 레벨 [답변형 게시판일 때 사용]
	SUNBUN NUMBER --같은 글 그룹 내의 순서 정렬 [답변형 게시판일 때 사용]
);

DROP SEQUENCE BOARD_IDX_SEQ;

CREATE SEQUENCE BOARD_IDX_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;


--꼬리글 테이블 생성 (자식 테이블)

DROP TABLE REPLY;

CREATE TABLE REPLY(
	NUM NUMBER CONSTRAINT REPLY_NUM_PK PRIMARY KEY,
	NAME VARCHAR2(30) NOT NULL,
	USERID VARCHAR2(20),
	CONTENT VARCHAR2(500),
	WDATE TIMESTAMP DEFAULT SYSTIMESTAMP,
	IDX_FK NUMBER CONSTRAINT REPLY_IDX_FK REFERENCES BOARD(IDX)
);

DROP SEQUENCE REPLY_NUM_SEQ;

CREATE SEQUENCE REPLY_NUM_SEQ NOCACHE;










