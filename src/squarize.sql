/* Make Functions */

DROP FUNCTION RADIANS;
DROP FUNCTION DISTNACE_WGS84;

CREATE FUNCTION RADIANS(nDegrees IN NUMBER) 
RETURN NUMBER DETERMINISTIC 
IS
BEGIN
  RETURN nDegrees / 57.29577951308232087679815481410517033235;
END RADIANS;

create function DISTNACE_WGS84( H_LAT in number, H_LNG in number, T_LAT in number, T_LNG in number)
return number deterministic
is
begin
  return ( 6371.0 * acos(  
          cos( radians( H_LAT ) )*cos( radians( T_LAT /* 위도 */ ) )
          *cos( radians( T_LNG /* 경도 */ )-radians( H_LNG ) )
          +
          sin( radians( H_LAT ) )*sin( radians( T_LAT /* 위도 */ ) )        
         ));
end DISTNACE_WGS84;

/* Drop Tables */

DROP TABLE SQ_AD CASCADE CONSTRAINTS;
DROP TABLE SQ_BUSKINGLIST CASCADE CONSTRAINTS;
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
CREATE TABLE SQ_BUSKINGLIST 
(
  -- 버스킹 ID 시퀀스
  SQ_BUSKING_ID NUMBER NOT NULL 
  -- 글쓴이 ID
, ID VARCHAR2(15 BYTE) NOT NULL 
  -- 글제목
, TITLE VARCHAR2(50 BYTE) NOT NULL 
  -- 공연위치(ex:홍대입구)
, LOCATION VARCHAR2(40 BYTE) NOT NULL 
  -- 공연위치 위도
, LATITUDE NUMBER(12, 7) NOT NULL 
  -- 공연위치 경도
, LONGITUDE NUMBER(12, 7) NOT NULL 
  -- 공연 상세정보 주소
, URL VARCHAR2(100 BYTE) NOT NULL 
  -- 공연장르
, GENRE VARCHAR2(20 BYTE) NOT NULL 
  -- 관람객 별점(사용안함)
, RATING NUMBER
  -- 팀 명
, TEAMNAME VARCHAR2(30 BYTE) NOT NULL 
  -- 갤러리 정보
, GALLERY VARCHAR2(100 BYTE) 
  -- 갤러리 정보2
, GALLERY2 VARCHAR2(100 BYTE) 
  -- 갤러리 정보3
, GALLERY3 VARCHAR2(100 BYTE) 
  -- 갤러리 정보4
, GALLERY4 VARCHAR2(100 BYTE) 
  -- 갤러리 정보5
, GALLERY5 VARCHAR2(100 BYTE) 
  -- 공연일시
, BUSKINGDATE DATE NOT NULL 
  -- 공연지속시간
, RUNNINGTIME NUMBER(3, 0) NOT NULL 
  -- 공연설명
, DESCRIPTION VARCHAR2(200 BYTE) 
, PRIMARY KEY (SQ_BUSKING_ID)
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
	-- 이메일 인증키
	SQ_MEMBER_EMAIL_KEY varchar2(500),
	-- 이메일 인증여부
	SQ_MEMBER_EMAIL_AUTH varchar2(1),
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
	-- 구인정보 제목
	SQ_RECRUIT_TITLE varchar2(50) NOT NULL,
	-- 구인정보 등록 날짜
	SQ_RECRUIT_INPUT_DATE date DEFAULT SYSDATE NOT NULL,
	-- 모집중인 악기 파트
	SQ_RECRUIT_PART varchar2(100) NOT NULL,
	-- 구인정보 사진 경로
	SQ_RECRUIT_PHOTO varchar2(100),
	-- 구인정보 사진 원래경로
	SQ_RECRUIT_PHOTO_ORIGINAL varchar2(100),
	-- 구인중인 장르
	SQ_RECRUIT_GENRE varchar2(20) NOT NULL,
	-- 구인정보 공연날짜
	SQ_RECRUIT_DATE date NOT NULL,
	-- 구인정보 공연장소
	SQ_RECRUIT_LOCATION varchar2(100) NOT NULL,
	-- 구인 위치 위도
	SQ_RECRUIT_LATITUDE number NOT NULL,
	-- 구인 위치 경도
	SQ_RECRUIT_LONGITUDE number NOT NULL,
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
--SQ_BUSKINGLIST 테이블은 올린 ARTIST의 SQ_MEMBER_ID를 참조함
ALTER TABLE SQ_BUSKINGLIST
	ADD FOREIGN KEY (ID)
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
INSERT INTO SQ_MEMBER VALUES ('123', '123', '김개똥', 'a@a.a', 'rock', 'N', null, 'N');
INSERT INTO SQ_MEMBER VALUES ('1234', '123', '김말똥', 'a@a.a', 'rock', 'N', null, 'N');
INSERT INTO SQ_MEMBER VALUES ('aa', '123', '김소똥', 'a@a.a', 'rock', 'Y', null, 'N');
INSERT INTO SQ_MEMBER VALUES ('ss', '123', '김쥐똥', 'a@a.a', 'rock', 'Y', null, 'N');
INSERT INTO SQ_MEMBER VALUES ('dd', '123', '김양똥', 'a@a.a', 'rock', 'Y', null, 'N');
INSERT INTO SQ_MEMBER VALUES ('qq', '123', '김양', 'a@a.a', 'rock', 'Y', null, 'N');

INSERT INTO SQ_MEMBER VALUES ('nnn', '123', '김똥', 'a@a.a', 'rock', 'N', null, 'N');

--SQ_ARTIST 생성
INSERT INTO SQ_ARTIST VALUES ('aa', 01011111111, null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('ss', 01012111111, null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('dd', 01012411111, null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('123', 01017111111, null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('1234', 01018111111, null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('qq', 01012591111, null,'adfadsfd');



--테스트용

INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '1234', '이리오세요! 기타세션 급구', sysdate, 'GUITAR','aaa', null, 'ROCK', sysdate, '홍대',37.556386, 126.924211, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '밤을 잊은 그대에게-바이올린', sysdate, 'VIOLIN','bbb', null, 'CLASSIC', sysdate, '도림천',37.472118, 126.933605, '컴온');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '퓨전 클래식-첼리스트 구해요', sysdate, 'CELLO','ccc', null, 'CLASSIC', sysdate, '홍대',37.556309, 126.924104, '요~~');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '1234', '재즈 : 베이스 캄온~~!', sysdate, 'CONTRABASE','ddd', null, 'JAZZ', sysdate, '청담',37.523830, 127.053350, '풋쳐핸즈업');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'dd', '이번밖에 없습니다.-키보드', sysdate, 'KEYBOARD','eee', null, 'ROCK', sysdate, '이대',37.561866, 126.946727, '왓썹?');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'dd', 'Such a *****!(drum)', sysdate, 'DRUM','fff', null, 'ROCK', sysdate, '홍대',37.555799, 126.924034, '컴온 레이디즈');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'dd', 'Nanananana-기타세션', sysdate, 'GUITAR','gggg', null, 'ROCK', sysdate, '서울 시청',37.565578, 126.977984, '컴온 보이즈');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '123', '깔아줄 베이스 찾습니다', sysdate, 'BASEGUITAR','hhh', null, 'ROCK', sysdate, '홍대',37.555739, 126.923959, '쉬즈건');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '헤비메탈에 목청을 바칩니다', sysdate, 'VOCAL','iii', null, 'HEAVYMETAL', sysdate, '대학동',37.470931, 126.938185, '콜라보레이션');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '파티타임! 기타세션~', sysdate, 'GUITAR','kkkk', null, 'ROCK', sysdate, '신림',37.483913, 126.929257, '아임인');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '첼로-국악과의 콜라보레이션', sysdate, 'CELLO', null,'lll', 'ROCK', sysdate, '홍대',37.555939, 126.924286, '준');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '첼리스트 급구합니다.', sysdate, 'CELLO', null,'mmm', 'CLASSIC', sysdate,'청담',37.523668, 127.054047, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', 'DRUM 세션 급구!', sysdate, 'DRUM', null, 'nnn','ROCK', sysdate,'삼성동',37.512441, 127.058668, '아리랑');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '[급구]가야금', sysdate, 'GUITAR', null,'ooo', 'ROCK', sysdate, '도림천',37.471539, 126.93438, '퓨전');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '123', '역삼역-락보컬', sysdate, 'VOCAL', null, 'ppp','ROCK', sysdate, '도림천',37.471752, 126.933691, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '락발라드', sysdate, 'GUITAR','qqq', null, 'ROCK', sysdate, '삼성동',37.511956, 127.060576, '발라드 함 들어보실라예');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '전자 바이올리니스트 급구', sysdate, 'VIOLIN','rrr', null, 'ROCK', sysdate, '삼성동',37.510145, 127.061726, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '123', '드럼 세션', sysdate, 'DRUM','sss', null, 'ROCK', sysdate,'삼성동', 37.511488, 127.061088, '컴컴');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '드럼 세션', sysdate, 'DRUM','ppp', null, 'ROCK', sysdate, '홍대',37.556033, 126.924797, '냥냥');

INSERT INTO SQ_RECRUIT_APPLY VALUES (SQ_RECRUIT_APPLY_ID_SQ.nextval, 1, 'aa');






INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'aa', '즐거운밴드', sysdate+7, sysdate, sysdate+5, '같이해요', null, null, '서울특별시 강남구', '락', '1', '1', 37.510674, 127.060012599);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'ss', '반가운밴드', sysdate+6, sysdate, sysdate+5, '같이해요', null, null, '서울특별시 강남구', '락', '1', '1', 37.510674, 127.060012599);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'aa', '서울밴드', sysdate+10, sysdate, sysdate+8, '같이해요', null, null, '서울특별시 중랑구', '힙합', '1', '1', 37.59015412293465, 127.08782174306634);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'aa', '안즐거운밴드', sysdate+9, sysdate, sysdate+7, '같이해요', null, null, '대한민국 광명시', '락', '1', '1', 37.48071088450467, 126.86225869374994);




INSERT INTO sq_favorite VALUES('aa', '{"락":0, "발라드":0, "재즈":0, "힙합":0}', '임시보류', '{"기타":0, "드럼":0, "키보드":0, "보컬":0}' );


commit;