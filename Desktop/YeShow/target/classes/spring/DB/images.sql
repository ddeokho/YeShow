-- 메뉴or 업장 사진
ALTER TABLE images
	DROP CONSTRAINT FK_restaurant_TO_images; -- 식당 업로드 -> 메뉴or 업장 사진

-- 메뉴or 업장 사진
ALTER TABLE images
	DROP CONSTRAINT FK_MEMBER_TO_images; -- 회원 -> 메뉴or 업장 사진

-- 메뉴or 업장 사진
ALTER TABLE images
	DROP CONSTRAINT PK_images; -- 메뉴or 업장 사진 기본키

-- 메뉴or 업장 사진
DROP TABLE images;

-- 메뉴or 업장 사진
CREATE TABLE images (
	upinum  number(8)    NOT NULL, -- 사진 번호
	upiname VARCHAR2(50) NULL,     -- 사진명
	upnum   NUMBER(8)    NOT NULL, -- 업로드 번호
	idx     NUMBER(8)    NULL      -- 회원번호
);

-- 메뉴or 업장 사진 기본키
CREATE UNIQUE INDEX PK_images
	ON images ( -- 메뉴or 업장 사진
		upinum ASC -- 사진 번호
	);

-- 메뉴or 업장 사진
ALTER TABLE images
	ADD
		CONSTRAINT PK_images -- 메뉴or 업장 사진 기본키
		PRIMARY KEY (
			upinum -- 사진 번호
		);

-- 메뉴or 업장 사진
ALTER TABLE images
	ADD
		CONSTRAINT FK_restaurant_TO_images -- 식당 업로드 -> 메뉴or 업장 사진
		FOREIGN KEY (
			upnum -- 업로드 번호
		)
		REFERENCES restaurant ( -- 식당 업로드
			upnum -- 업로드 번호
		);

-- 메뉴or 업장 사진
ALTER TABLE images
	ADD
		CONSTRAINT FK_MEMBER_TO_images -- 회원 -> 메뉴or 업장 사진
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);
		

drop SEQUENCE images_upinum_seq;
		
CREATE SEQUENCE images_upinum_seq
START WITH 1
INCREMENT BY 1
NOCACHE;