
/* Drop Tables */

DROP TABLE SQ_AD CASCADE CONSTRAINTS;
DROP TABLE SQ_BUSKING CASCADE CONSTRAINTS;
DROP TABLE SQ_FAVORITE CASCADE CONSTRAINTS;
DROP TABLE SQ_PORTFOLIO CASCADE CONSTRAINTS;
DROP TABLE SQ_RECRUIT_APPLY CASCADE CONSTRAINTS;
DROP TABLE SQ_RECRUIT CASCADE CONSTRAINTS;
DROP TABLE SQ_RENT_APPLY CASCADE CONSTRAINTS;
DROP TABLE SQ_RENT CASCADE CONSTRAINTS;
DROP TABLE SQ_ARTIST CASCADE CONSTRAINTS;
DROP TABLE SQ_MEMBER CASCADE CONSTRAINTS;

DROP SEQUENCE SQ_PORT_ID_SQ;
DROP SEQUENCE SQ_BUSKING_ID_SQ;
DROP SEQUENCE SQ_RENT_ID_SQ;
DROP SEQUENCE SQ_RENT_APPLY_ID_SQ;
DROP SEQUENCE SQ_RECRUIT_ID_SQ;
DROP SEQUENCE SQ_RECRUIT_APPLY_ID_SQ;
DROP SEQUENCE SQ_AD_ID_SQ;


/* Create Tables */

-- 광고
CREATE TABLE SQ_AD
(
	-- 광고 고유번호
	SQ_AD_ID number NOT NULL,
	-- 광고 제목
	SQ_AD_TITLE varchar2(50) NOT NULL,
	-- 광고 이미지파일 경로
	SQ_AD_FILE varchar2(50) NOT NULL,
	-- 광고 누르면 이동할 URL
	SQ_AD_URL varchar2(100) NOT NULL,
	PRIMARY KEY (SQ_AD_ID)
);


-- 아티스트 회원
CREATE TABLE SQ_ARTIST
(
	-- 회원 아이디 : 일반회원 ID
	SQ_MEMBER_ID varchar2(15) NOT NULL,
	-- 회원 전화번호
	SQ_ARTIST_PHONE number(11) NOT NULL UNIQUE,
	-- 아티스트 프로필 사진 경로
	SQ_ARTIST_PHOTO varchar2(50),
	-- 회원 소개
	SQ_ARTIST_INTRO varchar2(1000) NOT NULL,
	PRIMARY KEY (SQ_MEMBER_ID)
);


-- 버스킹 정보
CREATE TABLE SQ_BUSKING
(
	-- 해당 버스킹 고유번호
	SQ_BUSKING_ID number NOT NULL,
	-- 회원 아이디 : 일반회원 ID
	SQ_MEMBER_ID varchar2(15) NOT NULL,
	-- 버스킹 장르
	SQ_BUSKING_GENRE varchar2(20) NOT NULL,
	-- 버스킹 시작 날짜
	SQ_BUSKING_DATE date NOT NULL,
	-- 버스킹 진행 예정 시간 (분)
	SQ_BUSKING_RUNNINGTIME number(3) NOT NULL,
	-- 버스킹 위치정보 (위도 LAT)
	SQ_BUSKING_LAT number(6,4) NOT NULL,
	-- 버스킹 위치정보 (경도 LNG)
	SQ_BUSKING_LNG number(6,4) NOT NULL,
	-- 버스킹 실황 자료 경로1
	SQ_BUSKING_FILE1 varchar2(100),
	-- 버스킹 실황 자료 경로2
	SQ_BUSKING_FILE2 varchar2(100),
	-- 버스킹 실황 자료 경로3
	SQ_BUSKING_FILE3 varchar2(100),
	-- 버스킹 실황 자료 경로4
	SQ_BUSKING_FILE4 varchar2(100),
	-- 버스킹 실황 자료 경로5
	SQ_BUSKING_FILE5 varchar2(100),
	PRIMARY KEY (SQ_BUSKING_ID)
);


-- 유저별 선호도 JSON
CREATE TABLE SQ_FAVORITE
(
	-- 회원 아이디 : 일반회원 ID
	SQ_MEMBER_ID varchar2(15) NOT NULL,
	-- 해당 유저의 장르별 선호도 JSON
	SQ_FAVORITE_GENRE varchar2(1000) NOT NULL,
	-- 해당 유저의 장소별 선호도 JSON
	SQ_FAVORITE_LOCATION varchar2(1000) NOT NULL,
	-- 해당 유저의 악기별 선호도 JSON
	SQ_FAVORITE_INST varchar2(1000) NOT NULL,
	PRIMARY KEY (SQ_MEMBER_ID)
);


-- 일반회원
CREATE TABLE SQ_MEMBER
(
	-- 회원 아이디 : 일반회원 ID
	SQ_MEMBER_ID varchar2(15) NOT NULL,
	-- 회원 비밀번호
	SQ_MEMBER_PW varchar2(15) NOT NULL,
	-- 회원 이름
	SQ_MEMBER_NAME varchar2(15) NOT NULL,
	-- 회원 이메일
	SQ_MEMBER_EMAIL varchar2(30) NOT NULL,
	-- 회원 선호장르
	SQ_MEMBER_FAVORITE varchar2(10),
	-- 회원의 아티스트 여부 : NULL OR Y
	SQ_MEMBER_ISARTIST varchar2(1),
	PRIMARY KEY (SQ_MEMBER_ID)
);


-- 포트폴리오
CREATE TABLE SQ_PORTFOLIO
(
	-- 포트폴리오 고유번호
	SQ_PORT_ID number NOT NULL,
	-- 회원 아이디 : 일반회원 ID
	SQ_MEMBER_ID varchar2(15) NOT NULL,
	-- 다루는 악기
	SQ_PORT_INST varchar2(20) NOT NULL,
	-- 아티스트 약력
	SQ_PORT_CAREER varchar2(1000) NOT NULL,
	-- 아티스트 자기소개
	SQ_PORT_PR varchar2(500) NOT NULL,
	-- 아티스트 첨부파일 경로
	SQ_PORT_FILE varchar2(50),
	PRIMARY KEY (SQ_PORT_ID)
);


-- 구인정보 게시물
CREATE TABLE SQ_RECRUIT
(
	-- 구인정보 고유번호
	SQ_RECRUIT_ID number NOT NULL,
	-- 회원 아이디 : 일반회원 ID
	SQ_MEMBER_ID varchar2(15) NOT NULL,
	-- 구인정보 등록 날짜
	SQ_RECRUIT_INPUT_DATE date DEFAULT SYSDATE NOT NULL,
	-- 모집중인 악기 파트
	SQ_RECRUIT_PART varchar2(15) NOT NULL,
	-- 구인정보 사진 경로
	SQ_RECRUIT_PHOTO varchar2(50),
	-- 구인중인 장르
	SQ_RECRUIT_GENRE varchar2(20) NOT NULL,
	-- 구인정보 공연날짜
	SQ_RECRUIT_DATE date NOT NULL,
	-- 구인정보 공연장소
	SQ_RECRUIT_LOCATION varchar2(50) NOT NULL,
	-- 구인정보 소개글 내용
	SQ_RECRUIT_INFO varchar2(1000) NOT NULL,
	PRIMARY KEY (SQ_RECRUIT_ID)
);


-- 구인정보 지원자 목록
CREATE TABLE SQ_RECRUIT_APPLY
(
	-- 구인정보 지원자 고유번호
	SQ_RECRUIT_APPLY_ID number NOT NULL,
	-- 구인정보 고유번호
	SQ_RECRUIT_ID number NOT NULL,
	-- 회원 아이디 : 일반회원 ID
	SQ_MEMBER_ID varchar2(15) NOT NULL,
	PRIMARY KEY (SQ_RECRUIT_APPLY_ID)
);


-- 대관 게시물
CREATE TABLE SQ_RENT
(
	-- 대관 게시물 고유번호
	SQ_RENT_ID number(10) NOT NULL,
	-- 회원 아이디 : 일반회원 ID
	SQ_MEMBER_ID varchar2(15) NOT NULL,
  -- 대관글 올린 밴드 이름
  SQ_RENT_BAND_NAME varchar2(30) NOT NULL,
  -- 콘서트 예정일
  SQ_RENT_CONCERT_DATE date,
	-- 대관정보 등록일
	SQ_RENT_INPUT_DATE date DEFAULT SYSDATE NOT NULL,
	-- 대관 팀 모집 마감날짜
	SQ_RENT_LIMIT date NOT NULL,
	-- 대관정보 게시물 내용
	SQ_RENT_INFO varchar2(1000) NOT NULL,
	-- 대관 게시물 사진 저장된 파일명
	SQ_RENT_PHOTO varchar2(300),
  -- 대관 게시물 사진 원래 파일명
  SQ_RENT_PHOTO_ORIGINAL varchar2(300),
  -- 대관 게시물 지역
  SQ_RENT_REGION varchar2(50) NOT NULL,
  -- 대관 게시물 장르
  SQ_RENT_GENRE varchar2(50) NOT NULL,
  -- 대관 게시물 총 공연시간
  SQ_RENT_RUNNING_TIME number NOT NULL,
  -- 대관 게시물 모집 팀 수
  SQ_RENT_TEAM_COUNT number NOT NULL,
  -- 대관 게시물 공연 위도
  SQ_RENT_LAT number NOT NULL,
  -- 대관 게시물 공연 경도
  SQ_RENT_LNG number NOT NULL,
	PRIMARY KEY (SQ_RENT_ID)
);


-- 렌트 지원자 목록
CREATE TABLE SQ_RENT_APPLY
(
	-- 렌트 지원자 고유번호
	SQ_RENT_APPLY_ID number NOT NULL,
	-- 대관 게시물 고유번호
	SQ_RENT_ID number(10) NOT NULL,
	-- 회원 아이디 : 일반회원 ID
	SQ_MEMBER_ID varchar2(15) NOT NULL,
	PRIMARY KEY (SQ_RENT_APPLY_ID)
);



/* Create Foreign Keys */
--SQ_BUSKING 테이블은 올린 ARTIST의 SQ_MEMBER_ID를 참조함
ALTER TABLE SQ_BUSKING
	ADD FOREIGN KEY (SQ_MEMBER_ID)
	REFERENCES SQ_ARTIST (SQ_MEMBER_ID) ON DELETE CASCADE -- SQ_ARTIST 정보가 삭제되면 해당 아티스트의 버스킹 정보도 삭제
;

--SQ_FAVORITE 테이블은 각각의 SQ_ARTIST테이블의 SQ_MEMBER_ID를 참조함 1:1관계
ALTER TABLE SQ_FAVORITE
	ADD FOREIGN KEY (SQ_MEMBER_ID)
	REFERENCES SQ_ARTIST (SQ_MEMBER_ID) ON DELETE CASCADE -- SQ_ARTIST정보가 삭제되면 해당 아티스트 참조중이던 SQ_FAVORITE도 삭제
;

--SQ_PORTFOLIO 테이블은 포트폴리오 주인의 SQ_ARTIST_ID를 참조함
ALTER TABLE SQ_PORTFOLIO
	ADD FOREIGN KEY (SQ_MEMBER_ID)
	REFERENCES SQ_ARTIST (SQ_MEMBER_ID)  ON DELETE CASCADE -- SQ_ARTIST정보가 삭제되면 해당 아티스트 참조중이던 SQ_PORTFOLIO도 삭제
;

--구인글은 글을 올린 아티스트의 SQ_MEMBER_ID를 참조해서 가짐
ALTER TABLE SQ_RECRUIT
	ADD FOREIGN KEY (SQ_MEMBER_ID)
	REFERENCES SQ_ARTIST (SQ_MEMBER_ID) ON DELETE CASCADE -- SQ_ARTIST정보가 삭제되면 해당 아티스트가 올린 구인글 삭제
;

--SQ_RECRUIT_APPLY 테이블은 지원한 아티스트들의 지원관계정보를 가짐(SQ_MEMBER_ID)
ALTER TABLE SQ_RECRUIT_APPLY
	ADD FOREIGN KEY (SQ_MEMBER_ID)
	REFERENCES SQ_ARTIST (SQ_MEMBER_ID)
;

-- 대관글은 글을 올린 아티스트의 SQ_RENT를 참조해서 가짐
ALTER TABLE SQ_RENT
	ADD FOREIGN KEY (SQ_MEMBER_ID)
	REFERENCES SQ_ARTIST (SQ_MEMBER_ID) ON DELETE CASCADE -- SQ_ARTIST정보가 삭제되면 해당 아티스트가 올린 대관글 삭제
;

-- SQ_RENT_APPLY 테이블은 대관에 함께하려고 신청한 아티스트들의 지원관계정보를 가짐(SQ_MEMBER_ID)
ALTER TABLE SQ_RENT_APPLY
	ADD FOREIGN KEY (SQ_MEMBER_ID)
	REFERENCES SQ_ARTIST (SQ_MEMBER_ID)
;

-- SQ_ARTIST테이블은 SQ_MEMBER테이블의 SQ_MEMBER_ID를 참조함
ALTER TABLE SQ_ARTIST
	ADD FOREIGN KEY (SQ_MEMBER_ID)
	REFERENCES SQ_MEMBER (SQ_MEMBER_ID) ON DELETE CASCADE -- 멤버 삭제되면 ARTIST였던 사람 정보 삭제
;

-- SQ_RECRUIT_APPLY 테이블의 정보는 어떤 구인글과 연결되어 있는지 해당글의ID를 가짐
ALTER TABLE SQ_RECRUIT_APPLY
	ADD FOREIGN KEY (SQ_RECRUIT_ID)
	REFERENCES SQ_RECRUIT (SQ_RECRUIT_ID) ON DELETE CASCADE -- 구인글 삭제되면 해당글 지원관계 삭제
;

-- SQ_RENT_APPLY 테이블의 정보는 어떤 대관글과 연결되어 있는지 해당글의 ID를 가짐
ALTER TABLE SQ_RENT_APPLY
	ADD FOREIGN KEY (SQ_RENT_ID)
	REFERENCES SQ_RENT (SQ_RENT_ID) ON DELETE CASCADE -- 대관글 삭제되면 해당글 지원관계 삭제
;




/* Create Sequences */

CREATE SEQUENCE SQ_PORT_ID_SQ; --포트폴리오ID 시퀀스
CREATE SEQUENCE SQ_BUSKING_ID_SQ; --버스킹ID 시퀀스
CREATE SEQUENCE SQ_RENT_ID_SQ; --대관글ID 시퀀스
CREATE SEQUENCE SQ_RENT_APPLY_ID_SQ; --대관글 지원관계ID 시퀀스
CREATE SEQUENCE SQ_RECRUIT_ID_SQ; --구인글ID 시퀀스
CREATE SEQUENCE SQ_RECRUIT_APPLY_ID_SQ; --구인글 지원관계ID 시퀀스
CREATE SEQUENCE SQ_AD_ID_SQ; --광고ID 시퀀스

commit;




/* EXAMPLES */

--SQ_MEMBER 생성
INSERT INTO SQ_MEMBER VALUES ('123', '123', '김개똥', 'a@a.a', 'rock', 'N');
INSERT INTO SQ_MEMBER VALUES ('1234', '123', '김말똥', 'a@a.a', 'rock', 'N');
INSERT INTO SQ_MEMBER VALUES ('aa', '123', '김소똥', 'a@a.a', 'rock', 'Y');
INSERT INTO SQ_MEMBER VALUES ('ss', '123', '김쥐똥', 'a@a.a', 'rock', 'Y');
INSERT INTO SQ_MEMBER VALUES ('dd', '123', '김양똥', 'a@a.a', 'rock', 'Y');

--SQ_ARTIST 생성
INSERT INTO SQ_ARTIST VALUES ('aa', 01011111111, null);
INSERT INTO SQ_ARTIST VALUES ('ss', 01012111111, null);
INSERT INTO SQ_ARTIST VALUES ('dd', 01012511111, null);




--테스트용

INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', sysdate, 'GUITAR', null, 'ROCK', sysdate, '삼성동', '컴온 이리오세요');

INSERT INTO SQ_RECRUIT_APPLY VALUES (SQ_RECRUIT_APPLY_ID_SQ.nextval, 1, 'aa');

commit;



