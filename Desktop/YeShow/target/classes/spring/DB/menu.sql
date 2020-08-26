-- 메뉴
ALTER TABLE menu
	DROP CONSTRAINT FK_restaurant_TO_menu; -- 식당 업로드 -> 메뉴

-- 메뉴
ALTER TABLE menu
	DROP CONSTRAINT FK_MEMBER_TO_menu; -- 회원 -> 메뉴

-- 메뉴
ALTER TABLE menu
	DROP CONSTRAINT PK_menu; -- 메뉴 기본키

-- 메뉴
DROP TABLE menu;

-- 메뉴
CREATE TABLE menu (
	menunum   NUMBER(8)     NOT NULL, -- 메뉴번호
	menuname  VARCHAR2(50)  NOT NULL, -- 메뉴이름
	menuprice NUMBER(8)     NOT NULL, -- 메뉴가격
	menuinfo  VARCHAR2(200) NULL,     -- 메뉴정보
	menuimage VARCHAR2(50)  NULL,     -- 메뉴사진
	upnum     NUMBER(8)     NULL,     -- 업로드 번호
	idx       NUMBER(8)     NULL      -- 회원번호
);

-- 메뉴 기본키
CREATE UNIQUE INDEX PK_menu
	ON menu ( -- 메뉴
		menunum ASC -- 메뉴번호
	);

-- 메뉴
ALTER TABLE menu
	ADD
		CONSTRAINT PK_menu -- 메뉴 기본키
		PRIMARY KEY (
			menunum -- 메뉴번호
		);

-- 메뉴
ALTER TABLE menu
	ADD
		CONSTRAINT FK_restaurant_TO_menu -- 식당 업로드 -> 메뉴
		FOREIGN KEY (
			upnum -- 업로드 번호
		)
		REFERENCES restaurant ( -- 식당 업로드
			upnum -- 업로드 번호
		);

-- 메뉴
ALTER TABLE menu
	ADD
		CONSTRAINT FK_MEMBER_TO_menu -- 회원 -> 메뉴
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);
		
DROP SEQUENCE menu_menunum_SEQ;
		
CREATE SEQUENCE menu_menunum_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;