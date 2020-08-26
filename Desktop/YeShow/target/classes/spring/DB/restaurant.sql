-- 식당 업로드
ALTER TABLE restaurant
	DROP CONSTRAINT FK_MEMBER_TO_restaurant; -- 회원 -> 식당 업로드

-- 식당 업로드
ALTER TABLE restaurant
	DROP CONSTRAINT PK_restaurant; -- 식당 업로드 기본키

-- 식당 업로드
DROP TABLE restaurant;

-- 식당 업로드
CREATE TABLE restaurant (
	upnum        NUMBER(8)     NOT NULL, -- 업로드 번호
	upwriter     VARCHAR2(50)  NOT NULL, -- 업주명
	uprestaurant VARCHAR2(50)  NOT NULL, -- 업장명
	upphon       VARCHAR2(50)  NOT NULL, -- 업장 번호
	uptitle      VARCHAR2(100) NOT NULL, -- 간단소개
	upmsg        VARCHAR2(500) NOT NULL, -- 내용
	upindate     DATE          NULL,     -- 업장등록일
	uplocation   VARCHAR2(300) NOT NULL, -- 업장위치
	connum       VARCHAR2(100) NULL,     -- 국가별 음식종류
	idx          NUMBER(8)     NOT NULL, -- 회원번호
	fonum        VARCHAR2(100) NULL,     -- 음식정보
	upbusiness   varchar2(200) NULL,     -- 영업시간
	uprest       varchar2(200) NULL,     -- 휴무일
	upstate      VARCHAR2(10)  NULL,     -- 업로드상태
	upaccept     NUMBER(8)     NULL      -- 최대수용인원
);

-- 식당 업로드 기본키
CREATE UNIQUE INDEX PK_restaurant
	ON restaurant ( -- 식당 업로드
		upnum ASC -- 업로드 번호
	);

-- 식당 업로드
ALTER TABLE restaurant
	ADD
		CONSTRAINT PK_restaurant -- 식당 업로드 기본키
		PRIMARY KEY (
			upnum -- 업로드 번호
		);

-- 식당 업로드
ALTER TABLE restaurant
	ADD
		CONSTRAINT FK_MEMBER_TO_restaurant -- 회원 -> 식당 업로드
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);

DROP SEQUENCE restaurant_upnum_SEQ;
		
CREATE SEQUENCE restaurant_upnum_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;








--회원업로드, 식당업로드, 식당리뷰, 메뉴, 메장이미지 ,테이블 정보, 예약확인, 회원게시판, 회원게시판 리뷰, 오너보드, 오너 리뷰, 관리자, 관리자 리뷰