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
	SQ_AD_URL varchar2(1000) NOT NULL,
	-- 광고 파트 분류
	SQ_AD_PART varchar2(30) NOT NULL,
	PRIMARY KEY (SQ_AD_ID)
);


-- 아티스트 회원
CREATE TABLE SQ_ARTIST
(
	-- 회원 아이디 : 일반회원 ID
	SQ_MEMBER_ID varchar2(15) NOT NULL,
	-- 회원 전화번호
	SQ_ARTIST_PHONE varchar2(20) NOT NULL UNIQUE,
	-- 아티스트 프로필 사진 경로
	SQ_ARTIST_PHOTO varchar2(300),
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
, ID VARCHAR2(15) NOT NULL 
  -- 글제목
, TITLE VARCHAR2(50) NOT NULL 
  -- 공연위치(ex:홍대입구)
, LOCATION VARCHAR2(40) NOT NULL 
  -- 공연위치 위도
, LATITUDE NUMBER(12, 7) NOT NULL 
  -- 공연위치 경도
, LONGITUDE NUMBER(12, 7) NOT NULL 
  -- 공연 상세정보 주소
, URL VARCHAR2(100) NOT NULL 
  -- 공연장르
, GENRE VARCHAR2(20) NOT NULL 
  -- 관람객 별점(사용안함)
, RATING NUMBER
  -- 팀 명
, TEAMNAME VARCHAR2(30) NOT NULL 
  -- 갤러리 정보
, GALLERY VARCHAR2(300) 
  -- 갤러리 정보2
, GALLERY2 VARCHAR2(300) 
  -- 갤러리 정보3
, GALLERY3 VARCHAR2(300) 
  -- 갤러리 정보4
, GALLERY4 VARCHAR2(300) 
  -- 갤러리 정보5
, GALLERY5 VARCHAR2(300) 
  -- 공연일시
, BUSKINGDATE DATE NOT NULL 
  -- 공연지속시간
, RUNNINGTIME NUMBER(3, 0) NOT NULL 
  -- 공연설명
, DESCRIPTION VARCHAR2(3000) 
  -- 끝나는 시간
, END date
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
	-- 아티스트 대표사진 파일 경로
	SQ_PORT_FILE varchar2(300),
	-- 아티스트 대표사진 파일 경로
	SQ_PORT_MEDIA varchar2(300),
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
	SQ_RECRUIT_PHOTO varchar2(300),
	-- 구인정보 사진 원래경로
	SQ_RECRUIT_PHOTO_ORIGINAL varchar2(300),
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
	SQ_RECRUIT_INFO varchar2(3000) NOT NULL,
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
INSERT INTO SQ_MEMBER VALUES ('aa', '123', '김소똥', 'a@a.a', '락', 'Y', null, 'Y');
INSERT INTO SQ_MEMBER VALUES ('ss', '123', '김쥐똥', 'a@a.a', '발라드', 'Y', null, 'Y');
INSERT INTO SQ_MEMBER VALUES ('dd', '123', '김양똥', 'a@a.a', '재즈', 'Y', null, 'Y');
INSERT INTO SQ_MEMBER VALUES ('123', '123', '김개똥', 'a@a.a', '락', 'Y', null, 'Y');
INSERT INTO SQ_MEMBER VALUES ('1234', '123', '김말똥', 'a@a.a', '힙합', 'Y', null, 'Y');
INSERT INTO SQ_MEMBER VALUES ('qq', '123', '김양', 'a@a.a', '재즈', 'Y', null, 'Y');
INSERT INTO SQ_MEMBER VALUES ('nnn', '123', '김똥', 'a@a.a', '발라드', 'Y', null, 'Y');
INSERT INTO SQ_MEMBER VALUES ('jhs1', '123', '현솨', 'a@a.a', '힙합', 'Y', null, 'Y');
INSERT INTO SQ_MEMBER VALUES ('qwe', '123', '김똥1', 'a@a.a', '발라드', 'N', null, 'N');
INSERT INTO SQ_MEMBER VALUES ('asd', '123', '김똥2', 'a@a.a', '발라드', 'N', null, 'Y');
INSERT INTO SQ_MEMBER VALUES ('zxc', '123', '김똥3', 'a@a.a', '발라드', 'N', null, 'Y');
INSERT INTO SQ_MEMBER VALUES ('cxz', '123', '김똥4', 'a@a.a', '발라드', 'N', null, 'Y');
INSERT INTO SQ_MEMBER VALUES ('dsa', '123', '김똥5', 'a@a.a', '발라드', 'N', null, 'Y');
INSERT INTO SQ_MEMBER VALUES ('aloha','1111','하와이안','aaa@a.com', '재즈', 'Y', null,'Y');
INSERT INTO SQ_MEMBER VALUES ('solo','1111','뼈속까지','sss@a.com', '락', 'Y', null,'Y');
INSERT INTO SQ_MEMBER VALUES ('calories','1111','빼자','ccc@a.com', '힙합', 'Y', null,'Y');
INSERT INTO SQ_MEMBER VALUES ('soulmate','1111','음악','bbb@a.com' ,'힙합', 'Y', null,'Y');
INSERT INTO SQ_MEMBER VALUES ('home','1111','리스','hhh@a.com', '락', 'Y', null,'Y');
INSERT INTO SQ_MEMBER VALUES ('gaikoku','1111','진','ggg@a.com', '힙합', 'Y', null,'Y');
INSERT INTO SQ_MEMBER VALUES ('youna','1111','김연아','yyy@a.com', '락', 'Y', null,'Y');


INSERT INTO SQ_MEMBER VALUES ('artist1','1234','테스트용1','yyy@a.com', '락', 'Y', null,'Y');


--SQ_ARTIST 생성
INSERT INTO SQ_ARTIST VALUES ('aa', '010-1111-1011', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('ss', '010-1211-1151', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('dd', '010-1241-1118', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('123', '010-1216-1131', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('1234', '010-1271-5111', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('qq', '010-1291-1161', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('nnn', '010-1271-1211', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('jhs1', '010-1271-1213', null,'adfadsfd');

INSERT INTO SQ_ARTIST VALUES ('aloha', '010-1211-8765', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('solo', '010-1241-1321', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('calories', '010-1216-9999', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('soulmate', '010-1271-7777', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('home', '010-1291-6666', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('gaikoku', '010-1271-3333', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('youna', '010-1271-2222', null,'adfadsfd');


INSERT INTO SQ_ARTIST VALUES ('artist1', '010-1991-2922', null,'adfadsfd');


--구인 테스트용 데이터(38)

INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '1234', '이리오세요! 기타세션 급구', sysdate, '기타','recruit_indi1.jpg', null, '힙합', sysdate, '홍대',37.556386, 126.924211, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '밤을 잊은 그대에게-Jazz', sysdate, '기타','recruit_indi2.jpg', null, '재즈', sysdate, '도림천',37.472118, 126.933605, '컴온');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', 'Jazz - Guitar session', sysdate, '기타','recruit_ind3.jpg', null, '재즈', sysdate, '홍대',37.556309, 126.924104, '요~~');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '1234', '재즈 : 베이스 캄온~~!', sysdate, '드럼','recruit_indi4.jpg', null, '락', sysdate, '청담',37.523830, 127.053350, '풋쳐핸즈업');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'dd', '이번밖에 없습니다.-키보드', sysdate, '드럼','recruit_indi5.jpg', null, '락', sysdate, '이대',37.561866, 126.946727, '왓썹?');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'dd', 'Drummer!!!', sysdate, '드럼','recruit_indi6.jpg', null, '락', sysdate, '홍대',37.555799, 126.924034, '컴온 레이디즈');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '123', 'Guitar!!!', sysdate, '기타','recruit_indi7.jpg', null, '락', sysdate, '서울 시청',37.565578, 126.977984, '컴온 보이즈');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '123', '베이스 찾습니다', sysdate, '기타','recruit_indi8.jpg', null, '락', sysdate, '홍대',37.555739, 126.923959, '쉬즈건');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '헤비메탈에 목청을 바칩니다', sysdate, '보컬','recruit_indi9.jpg', null, '발라드', sysdate, '대학동',37.470931, 126.938185, '콜라보레이션');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '창하셨던 분 환영!', sysdate, '보컬', 'recruit_indi11.jpg',null, '재즈', sysdate, '홍대',37.555939, 126.924286, '준');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', 'DRUM 세션 급구!', sysdate, '드럼', 'recruit_indi13.jpg', null,'힙합', sysdate,'삼성동',37.512441, 127.058668, '아리랑');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '드러머! - 퍼포먼스 가능자!', sysdate, '드럼', 'recruit_indi14.jpg',null, '락', sysdate, '도림천',37.471539, 126.93438, '퓨전');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '123', '역삼역-락보컬', sysdate, '보컬', 'recruit_indi15.jpg', null,'재즈', sysdate, '도림천',37.471752, 126.933691, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'jhs1', '락발라드- 기타', sysdate, '기타','recruit_indi16.jpg', null, '재즈', sysdate, '삼성동',37.511956, 127.060576, '발라드 함 들어보실라예');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '난 싱어다!!! 클릭!', sysdate, '보컬','recruit_indi17.jpg', null, '락', sysdate, '삼성동',37.510145, 127.061726, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '123', '키보드 - 실력자 급합니다!', sysdate, '키보드','recruit_indi18.jpg', null, '발라드', sysdate,'삼성동', 37.511488, 127.061088, '컴컴');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'jhs1', '키보드 - 반주자', sysdate, '키보드','recruit_indi19.jpg', null, '재즈', sysdate, '홍대',37.556033, 126.924797, '냥냥');

INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '기타 세션 구합니다.', sysdate, '기타','recruit_indi21.jpg', null, '재즈', sysdate, '도림천',37.472118, 126.935605, '컴온');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '어구스틱 기타', sysdate, '기타','recruit_ind22.jpg', null, '재즈', sysdate, '홍대',37.556309, 126.924004, '요~~');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '1234', '재즈', sysdate, '드럼','recruit_indi23.jpg', null, '락', sysdate, '청담',37.523830, 127.053351, '풋쳐핸즈업');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'dd', 'Such a *****!(드러머 구인!)', sysdate, '드럼','recruit_indi25.jpg', null, '락', sysdate, '홍대',37.555799, 126.924033, '컴온 레이디즈');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'dd', 'Nanananana-기타리스트 클릭!', sysdate, '기타','recruit_indi26.jpg', null, '락', sysdate, '서울 시청',37.565578, 126.977981, '컴온 보이즈');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '123', '베이스 기타리스트', sysdate, '기타','recruit_indi27.jpg', null, '락', sysdate, '홍대',37.555739, 126.923958, '쉬즈건');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '헤비메탈에 목청을 바칩니다', sysdate, '보컬','recruit_indi28.jpg', null, '발라드', sysdate, '대학동',37.470931, 126.938189, '콜라보레이션');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '락보컬이 필요해요~', sysdate, '보컬', 'recruit_indi30.jpg',null, '재즈', sysdate, '홍대',37.555939, 126.924284, '준');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', 'DRUM 세션!', sysdate, '드럼', 'recruit_indi32.jpg', null,'힙합', sysdate,'삼성동',37.512441, 127.058669, '아리랑');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '기타 파트 모집중', sysdate, '기타', 'recruit_indi33.jpg',null, '락', sysdate, '도림천',37.471539, 126.93437, '퓨전');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '123', '발라드 - 보컬 급구', sysdate, '보컬', 'recruit_indi34.jpg', null,'재즈', sysdate, '도림천',37.471752, 126.933692, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '락발라드 기타세션 구합니다', sysdate, '기타','recruit_indi35.jpg', null, '재즈', sysdate, '삼성동',37.511956, 127.060572, '발라드 함 들어보실라예');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '1234', '보컬 가 봅시다~', sysdate, '보컬','recruit_indi36.jpg', null, '락', sysdate, '삼성동',37.510145, 127.061725, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '재즈에 드럼~ 세션도전!', sysdate, '드럼','recruit_indi38.jpg', null, '재즈', sysdate, '홍대',37.556033, 126.924790, '냥냥');

INSERT INTO SQ_RECRUIT_APPLY VALUES (SQ_RECRUIT_APPLY_ID_SQ.nextval, 1, 'artist1');





--대관 게시물 등록
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'artist1', '즐거운밴드', sysdate+7, sysdate, sysdate+5, '같이해요', 'ex (1).jpg', 'ex (1).jpg', '서울특별시 강남구', '락', '1', '1', 37.510674, 127.060012599);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'aa', '반가운밴드', sysdate+6, sysdate, sysdate+5, '같이해요', 'ex (2).jpg', 'ex (2).jpg', '서울특별시 강남구', '재즈', '1', '1', 37.510674, 127.060012599);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'aa', '서울밴드', sysdate+10, sysdate, sysdate+8, '같이해요', 'ex (3).jpg', 'ex (3).jpg', '서울특별시 중랑구', '힙합', '1', '1', 37.59015412293465, 127.08782174306634);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'aa', '안즐거운밴드', sysdate+9, sysdate, sysdate+7, '같이해요', 'ex (4).jpg', 'ex (4).jpg', '경기도 광명시', '발라드', '1', '1', 37.48071088450467, 126.86225869374994);

INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'ss', '드루와밴드', sysdate+7, sysdate, sysdate+5, '드루와바', 'ex (5).jpg', 'ex (5).jpg', '경기도 수원시', '락', '1', '1', 37.293493, 127.029621);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'ss', '저리가밴드', sysdate+6, sysdate, sysdate+5, '저리가라 오지마', 'ex (6).jpg', 'ex (6).jpg', '경기도 수원시', '발라드', '1', '1', 37.282976, 126.977865);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'ss', '아가밴드', sysdate+10, sysdate, sysdate+8, '같이해요', 'ex (7).jpg', 'ex (7).jpg', '경기도 수원시', '재즈', '1', '1', 37.271024, 127.037689);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'ss', '이리온나밴드', sysdate+9, sysdate, sysdate+7, '같이해요', 'ex (8).jpg', 'ex (8).jpg', '경기도 수원시', '힙합', '1', '1', 37.285435, 127.018892);

INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'dd', '취하자밴드', sysdate+7, sysdate, sysdate+5, '같이해요', 'ex (9).jpg', 'ex (9).jpg', '대전광역시 유성구', '재즈', '1', '1', 36.373931, 127.338327);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'dd', '취화선밴드', sysdate+6, sysdate, sysdate+5, '같이해요', 'ex (10).jpg', 'ex (10).jpg', '대전광역시 대덕구', '발라드', '1', '1', 36.406872, 127.442719);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'dd', '안취한밴드', sysdate+10, sysdate, sysdate+8, '같이해요', 'ex (11).jpg', 'ex (11).jpg', '대전광역시 동구', '힙합', '1', '1', 36.339595, 127.429756);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'dd', '술과밴드', sysdate+9, sysdate, sysdate+7, '같이해요', 'ex (12).jpg', 'ex (12).jpg', '대전광역시 유성구', '락', '1', '1', 36.340424, 127.339478);

INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, '123', '형님밴드', sysdate+7, sysdate, sysdate+5, '같이해요', 'ex (13).jpg', 'ex (13).jpg', '부산광역시 동래구', '재즈', '1', '1', 35.205224, 129.075538);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, '123', '뜨거운밴드', sysdate+6, sysdate, sysdate+5, '같이해요', 'ex (14).jpg', 'ex (14).jpg', '부산광역시 사상구', '락', '1', '1', 35.160906, 128.985332);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, '123', '차가운밴드', sysdate+10, sysdate, sysdate+8, '같이해요', 'ex (15).jpg', 'ex (15).jpg', '부산광역시 연제구', '힙합', '1', '1', 35.180310, 129.084034);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, '123', '미지근한밴드', sysdate+9, sysdate, sysdate+7, '같이해요', 'ex (16).jpg', 'ex (16).jpg', '부산광역시 영도구', '발라드', '1', '1', 35.074242, 129.062545);

INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, '1234', '쿵해쪄밴드', sysdate+7, sysdate, sysdate+5, '같이해요', 'ex (17).jpg', 'ex (17).jpg', '광주광역시 북구', '락', '1', '1', 35.179725, 126.877198);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, '1234', '콩해쪄밴드', sysdate+6, sysdate, sysdate+5, '같이해요', 'ex (18).jpg', 'ex (18).jpg', '광주광역시 북구', '재즈', '1', '1', 35.161672, 126.930463);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, '1234', '한대맞자밴드', sysdate+10, sysdate, sysdate+8, '같이해요', 'ex (19).jpg', 'ex (19).jpg', '광주광역시 광산구', '힙합', '1', '1', 35.198365, 126.815705);
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, '1234', '두대맞자밴드', sysdate+9, sysdate, sysdate+7, '같이해요', 'ex (20).jpg', 'ex (20).jpg', '광주광역시 남구', '발라드', '1', '1', 35.125081, 126.915018);

--버스킹리스트
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '불타는 이밤', 
'홍대입구', '37.566756', '126.934539', 
'사용안함', '발라드', 0, '밴드 오브 브라더스',
'ex (13).jpg', 'ex (14).jpg', null, null, null, sysdate+1,
120, '반갑습니다', sysdate+1+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '오늘밤은 저희가 책임집니다.', 
'홍대입구', '37.641056', '126.929839', 
'사용안함', '발라드', 0, '밴드 오브 브라더스',
'ex (15).jpg', 'ex (16).jpg', null, null, null, sysdate+3,
120, '이길아선생님 짱', sysdate+3+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '불타는 이밤', 
'홍대입구', '37.541056', '126.929839', 
'사용안함', '발라드', 0, '밴드 오브 브라더스',
'ex (13).jpg', 'ex (14).jpg', null, null, null, sysdate+1,
120, '반갑습니다', sysdate+1+(2/24));


--포트폴리오
INSERT INTO sq_portfolio VALUES (sq_port_id_sq.nextval, 'ss', '기타', '1988년 기타를 들고 태어남', '저는 많이 활약했어요', 'portFile (1).jpg', 'portMedia (1).MOV');
INSERT INTO sq_portfolio VALUES (sq_port_id_sq.nextval, 'dd', '기타', '1989년 드럼을 들고 태어남', '저는 많이 활약했어요', 'portFile (2).jpg', 'portMedia (2).MOV');
INSERT INTO sq_portfolio VALUES (sq_port_id_sq.nextval, 'artist1', '기타', '1990년 키보드를 들고 태어남', '저는 많이 활약했어요', 'portFile (3).jpg', 'portMedia (3).MOV');

--형님밴드 지원자들
INSERT INTO sq_rent_apply VALUES(sq_rent_apply_id_sq.nextval, 1, 'dd');
INSERT INTO sq_rent_apply VALUES(sq_rent_apply_id_sq.nextval, 1, 'ss');
INSERT INTO sq_rent_apply VALUES(sq_rent_apply_id_sq.nextval, 1, '123');


INSERT INTO sq_favorite VALUES('aa', '{"락":10, "발라드":0, "재즈":0, "힙합":0}', '임시보류', '{"기타":0, "드럼":0, "키보드":0, "보컬":0}' );
INSERT INTO sq_favorite VALUES('ss', '{"락":0, "발라드":10, "재즈":0, "힙합":0}', '임시보류', '{"기타":0, "드럼":0, "키보드":0, "보컬":0}' );
INSERT INTO sq_favorite VALUES('dd', '{"락":0, "발라드":0, "재즈":10, "힙합":0}', '임시보류', '{"기타":0, "드럼":0, "키보드":0, "보컬":0}' );
INSERT INTO sq_favorite VALUES('123', '{"락":10, "발라드":0, "재즈":0, "힙합":0}', '임시보류', '{"기타":0, "드럼":0, "키보드":0, "보컬":0}' );
INSERT INTO sq_favorite VALUES('1234', '{"락":0, "발라드":0, "재즈":0, "힙합":10}', '임시보류', '{"기타":0, "드럼":0, "키보드":0, "보컬":0}' );
INSERT INTO sq_favorite VALUES('qq', '{"락":0, "발라드":0, "재즈":10, "힙합":0}', '임시보류', '{"기타":0, "드럼":0, "키보드":0, "보컬":0}' );
INSERT INTO sq_favorite VALUES('nnn', '{"락":0, "발라드":10, "재즈":10, "힙합":0}', '임시보류', '{"기타":0, "드럼":0, "키보드":0, "보컬":0}' );
INSERT INTO sq_favorite VALUES('jhs1', '{"락":0, "발라드":10, "재즈":10, "힙합":0}', '임시보류', '{"기타":0, "드럼":0, "키보드":0, "보컬":0}' );

INSERT INTO sq_favorite VALUES('aloha', '{"락":0, "발라드":10, "재즈":20, "힙합":0}', '임시보류', '{"기타":0, "드럼":10, "키보드":0, "보컬":0}' );
INSERT INTO sq_favorite VALUES('solo', '{"락":10, "발라드":0, "재즈":0, "힙합":0}', '임시보류', '{"기타":0, "드럼":0, "키보드":0, "보컬":2}' );
INSERT INTO sq_favorite VALUES('calories', '{"락":10, "발라드":0, "재즈":0, "힙합":0}', '임시보류', '{"기타":0, "드럼":10, "키보드":0, "보컬":0}' );
INSERT INTO sq_favorite VALUES('soulmate', '{"락":0, "발라드":0, "재즈":0, "힙합":10}', '임시보류', '{"기타":20, "드럼":0, "키보드":0, "보컬":0}' );
INSERT INTO sq_favorite VALUES('home', '{"락":12, "발라드":0, "재즈":8, "힙합":0}', '임시보류', '{"기타":0, "드럼":10, "키보드":0, "보컬":0}' );
INSERT INTO sq_favorite VALUES('gaikoku', '{"락":0, "발라드":10, "재즈":10, "힙합":0}', '임시보류', '{"기타":0, "드럼":0, "키보드":30, "보컬":5}' );
INSERT INTO sq_favorite VALUES('youna', '{"락":5, "발라드":1, "재즈":2, "힙합":0}', '임시보류', '{"기타":0, "드럼":0, "키보드":0, "보컬":0}' );


INSERT INTO sq_favorite VALUES('artist1', '{"락":15, "발라드":15, "재즈":0, "힙합":0}', '임시보류', '{"기타":0, "드럼":0, "키보드":0, "보컬":0}' );



INSERT INTO sq_ad VALUES (sq_ad_id_sq.nextval, '오렌지앰프', 'amp.jpg', 'http://freebud.co.kr/', '기타');
INSERT INTO sq_ad VALUES (sq_ad_id_sq.nextval, '전자드럼', 'drum.jpg', 'http://freebud.co.kr/', '드럼');
INSERT INTO sq_ad VALUES (sq_ad_id_sq.nextval, '기타 1+1', 'guitar.jpg', 'http://freebud.co.kr/', '기타');
INSERT INTO sq_ad VALUES (sq_ad_id_sq.nextval, '키보드할인', 'keyboard.jpg', 'http://freebud.co.kr/', '키보드');
INSERT INTO sq_ad VALUES (sq_ad_id_sq.nextval, '마이크', 'mic.jpg', 'http://freebud.co.kr/', '보컬');
INSERT INTO sq_ad VALUES (sq_ad_id_sq.nextval, '스틱 세일', 'stick.jpg', 'http://freebud.co.kr/', '드럼');


-- 버스킹 데이터
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'aloha', '비가 오는 날이면 생각나는 밴드','홍대 입구', 
  37.555832, 126.924204,'사용안함','발라드',0, '하와이안',
  'busking7.jpg','busking6.jpg','busking8.jpg',null,null,
  '2016/11/16',120, '발라드 들으러 오세요~~~','2016/11/16' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval,'aloha', '발라드 들으러 오세요~','홍대입구', 
  37.555911, 126.924263,'사용안함','발라드',0, '하와이안',
  'busking7.jpg','busking8.jpg','busking6.jpg',null,null,
  '2016/11/17',120, '2시간동안 사랑을 얘기해봐요~','2016/11/17' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'solo', '솔로들이여 여기로~','홍대입구', 
  37.554649, 126.922836,'사용안함','발라드',0, '쏠로',
  'busking9.jpg','busking10.jpg','busking11.jpg',null,null,
  '2016/11/17',120, '커플은 가라!','2016/11/17' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'solo', '안생겨요~','홍대입구', 
  37.554753, 126.922920,'사용안함','발라드',0, '쏠로',
  'busking10.jpg','busking9.jpg','busking11.jpg',null,null,
  '2016/11/17',120, '유상민씨 여기로 오세요~~','2016/11/17' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'solo', '오늘도 안생겨요...','홍대입구', 
  37.554873, 126.922989,'사용안함','발라드',0, '쏠로',
  'busking10.jpg','busking11.jpg','busking9.jpg',null,null,
  '2016/11/18',120, '솔로부대 대환영!','2016/11/18' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'solo', '자리옮겨봄.-솔로부대','홍대입구', 
  37.554371, 126.922632,'사용안함','발라드',0, '쏠로',
  'busking9.jpg','busking10.jpg','busking11.jpg','busking12.jpg',null,
  '2016/11/19',120, '이래도 안생길거냐!','2016/11/19' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'calories', '내 노래 들으면 살빠진다.','홍대입구', 
  37.554425, 126.922758,'사용안함','발라드',0, '다이어트',
  'busking13.jpg','busking14.jpg',null,null,null,
  '2016/11/17',120, '내장지방아 물럿거라~~~','2016/11/17' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'calories', '내 노래 다시 들으면 또 빠진다.','홍대입구', 
  37.555050, 126.923155,'사용안함','힙합',0, '다이어트',
  'busking13.jpg','busking14.jpg',null,null,null,
  '2016/11/18',120, '셀룰라이트 타파!','2016/11/18' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval,'calories', '오늘은 좀 흔들어볼까나','홍대입구', 
  37.554952, 126.923067,'사용안함','락',0, '다이어트',
  'busking15.jpg','busking16.jpg','busking17.jpg','busking18.jpg',null,
  '2016/11/19',120, '츄리닝 입고 오세요~~~','2016/11/19' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'calories', '다이어트란 내일부터 하는 것!','홍대입구', 
  37.555279, 126.923526,'사용안함','발라드',0, '다이어트',
  'busking19.jpg','busking20.jpg','busking21.jpg','busking22.jpg',null,
  '2016/11/14',120, '조용히 앉아 있으면 됨.','2016/11/14' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'soulmate', '우리는 솔로탈출을 꿈꾼다!','홍대입구', 
  37.555196, 126.923445,'사용안함','발라드',0, '여기네밴드',
  'busking23.jpg','busking24.jpg','busking25.jpg','busking26.jpg',null,
  '2016/11/15',120, '내 노래 들으면 생길 걸~','2016/11/15' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'home', '집이 없어 나왔습니다...','홍대입구', 
  37.554771, 126.922088,'사용안함','발라드',0, 'Home리스',
  'busking27.jpg','busking28.jpg','busking29.jpg','busking30.jpg',null,
  '2016/11/13',120, '편하게 즐기세요...','2016/11/13' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'home', '길거리가 내 집','홍대입구', 
  37.554852, 126.921991,'사용안함','발라드',0, 'Home리스',
  'busking27.jpg','busking28.jpg','busking30.jpg','busking29.jpg',null,
  '2016/11/14',120, '여기 대박!!!!','2016/11/14' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'home', '홈리스의 발라드~','홍대 입구', 
  37.554637, 126.922227,'사용안함','발라드',0, 'Home리스',
  'busking31.jpg','busking32.jpg','busking33.jpg','busking34.jpg',null,
  '2016/11/15',120, '늪','2016/11/15' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'home', '오늘도 조용히...','홍대 입구', 
  37.554565, 126.922311,'사용안함','발라드',0, 'Home리스',
  'busking31.jpg','busking32.jpg','busking33.jpg','busking34.jpg',null,
  '2016/11/16',120, '홍대 입구에서 발라드를 즐겨보세요~~','2016/11/16' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'home', '1년 365일~ 홈리스의 발라드','홍대 입구', 
  37.555759, 126.921948,'사용안함','발라드',0, 'Home리스',
  'busking31.jpg','busking32.jpg','busking33.jpg','busking34.jpg',null,
  '2016/11/17',120, '꾸준히 발라드를 부르는 내 친구~','2016/11/17' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'gaikoku', '저는 외쿡인 입니다~','홍대 입구', 
  37.555862, 126.922139,'사용안함','힙합',0, '외쿡인밴드',
  'busking35.jpg','busking36.jpg',null,null,null,
  '2016/11/13',120, '외쿡인의 솜씨를 즐겨보세요~','2016/11/13' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'gaikoku', '저는 외쿡인 입니다~2','홍대 입구', 
  37.555359, 126.921456,'사용안함','힙합',0, '외쿡인밴드',
  'busking35.jpg','busking36.jpg',null,null,null,
  '2016/11/14',120, '외쿡인의 오리지널 힙합!','2016/11/14' 
);
INSERT INTO SQ_BUSKINGLIST VALUES (
  SQ_BUSKING_ID_SQ.nextval, 'gaikoku', '저는 외쿡인 입니다~3','홍대 입구', 
  37.555418, 126.923759,'사용안함','힙합',0, '외쿡인밴드',
  'busking35.jpg','busking36.jpg',null,null,null,
  '2016/11/15',120, '힙합!','2016/11/15' 
);
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '불타는 이밤', 
'홍대입구', '37.554609', '126.922898', 
'사용안함', '발라드', 0, '김태희밴드',
'ex (13).jpg', 'ex (14).jpg', null, null, null, sysdate+1,
120, '반갑습니다', sysdate+1+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '오늘밤은 저희가 책임집니다.', 
'홍대입구', '37.554609', '126.932898', 
'사용안함', '발라드', 0, '김화선밴드',
'ex (15).jpg', 'ex (16).jpg', null, null, null, sysdate+3,
120, '이길아선생님 짱', sysdate+3+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '불타는 이밤', 
'홍대입구', '37.544609', '126.932898', 
'사용안함', '발라드', 0, '밴드 오브 브라더스',
'ex (13).jpg', 'ex (14).jpg', null, null, null, sysdate+1,
120, '반갑습니다', sysdate+1+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '놀러오세요', 
'홍대입구', '37.534609', '126.939098', 
'사용안함', '락', 0, '신나는 락밴드',
'ex (1).jpg', 'ex (2).jpg', null, null, null, sysdate,
120, '반갑습니다', sysdate+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '재즈와 함께 밤을', 
'코엑스', '37.511950', '127.058681', 
'사용안함', '재즈', 0, '재즈3형제',
'ex (3).jpg', 'ex (4).jpg', null, null, null, sysdate,
120, '재즈는 연주 스타일이나 연주 그자체에 대한 호칭으로 연주자의 감각과 표현력을 중요시하며 모든 음악 중에서 가장 자유로운 표현이 허용되는 음악이다.', sysdate+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '힙합 힙힙힙합', 
'삼성역', '37.508958', '127.062855', 
'사용안함', '힙합', 0, '쇼미더머니',
'ex (5).jpg', 'ex (6).jpg', null, null, null, sysdate+1,
120, '힙합의 세계로 빠져봅시다.', sysdate+1+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '감미로운 노래속으로', 
'이태원', '37.534414', '126.994611', 
'사용안함', '발라드', 0, '성시경',
'ex (7).jpg', 'ex (8).jpg', null, null, null, sysdate+2,
120, '감미로운 발라드의 세계로', sysdate+2+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '락', 
'이태원', '37.544414', '126.984611', 
'사용안함', '락', 0, '하정우',
'ex (9).jpg', 'ex (10).jpg', null, null, null, sysdate+2,
120, '감미로운 발라드의 세계로', sysdate+2+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '락', 
'이태원', '37.634414', '126.894611', 
'사용안함', '락', 0, '혼토니',
'ex (9).jpg', 'ex (10).jpg', null, null, null, sysdate+2,
120, '감미로운 발라드의 세계로', sysdate+2+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '재즈', 
'이태원', '37.434414', '126.894611', 
'사용안함', '재즈', 0, '이충구',
'ex (10).jpg', 'ex (11).jpg', null, null, null, sysdate,
120, '감미로운 발라드의 세계로', sysdate+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '힙합', 
'대학로', '37.582294', '127.002588', 
'사용안함', '힙합', 0, '조전형',
'ex (12).jpg', 'ex (13).jpg', null, null, null, sysdate,
120, '감미로운 발라드의 세계로', sysdate+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '발라드', 
'대학로', '37.682294', '127.102588', 
'사용안함', '발라드', 0, '김지현',
'ex (12).jpg', 'ex (13).jpg', null, null, null, sysdate+1,
120, '감미로운 발라드의 세계로', sysdate+1+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '락', 
'대학로', '37.581588', '126.999659', 
'사용안함', '발라드', 0, '안성전',
'ex (12).jpg', 'ex (13).jpg', null, null, null, sysdate+2,
120, '감미로운 발라드의 세계로', sysdate+2+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '재즈', 
'대학로', '37.579904', '126.999552', 
'사용안함', '재즈', 0, '백승훈',
'ex (12).jpg', 'ex (13).jpg', null, null, null, sysdate+1,
120, '감미로운 발라드의 세계로', sysdate+1+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '힙합', 
'부산', '35.115464', '129.040687', 
'사용안함', '힙합', 0, '오승연',
'ex (12).jpg', 'ex (13).jpg', null, null, null, sysdate+2,
120, '감미로운 발라드의 세계로', sysdate+2+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '발라드', 
'전주', '35.836737', '127.123493', 
'사용안함', '발라드', 0, '김승훈',
'ex (14).jpg', 'ex (15).jpg', null, null, null, sysdate,
120, '감미로운 발라드의 세계로', sysdate+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '락', 
'광주', '35.158437', '126.848745', 
'사용안함', '락', 0, '장민식',
'ex (16).jpg', 'ex (17).jpg', null, null, null, sysdate+1,
120, '감미로운 발라드의 세계로', sysdate+1+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '재즈', 
'광주', '35.155038', '126.853967', 
'사용안함', '재즈', 0, '조현상',
'ex (18).jpg', 'ex (19).jpg', null, null, null, sysdate+2,
120, '감미로운 발라드의 세계로', sysdate+2+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '힙합', 
'광주', '35.153425', '126.860060', 
'사용안함', '힙합', 0, '김성훈',
'ex (20).jpg', 'ex (1).jpg', null, null, null, sysdate+3,
120, '감미로운 발라드의 세계로', sysdate+3+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '발라드', 
'광주', '35.825076', '127.122520', 
'사용안함', '발라드', 0, '이도연',
'ex (2).jpg', 'ex (3).jpg', null, null, null, sysdate,
120, '감미로운 발라드의 세계로', sysdate+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '락', 
'광주', '35.823950', '127.127194', 
'사용안함', '락', 0, '장효민',
'ex (4).jpg', 'ex (5).jpg', null, null, null, sysdate+1,
120, '감미로운 발라드의 세계로', sysdate+1+(2/24));
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '재즈', 
'대전', '36.339548', '127.393027', 
'사용안함', '재즈', 0, '김두리나',
'ex (6).jpg', 'ex (7).jpg', null, null, null, sysdate+2,
120, '감미로운 발라드의 세계로', sysdate+2+(2/24)); 
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '힙합', 
'대전', '36.339381', '127.389854', 
'사용안함', '힙합', 0, '이사야',
'ex (8).jpg', 'ex (9).jpg', null, null, null, sysdate+3,
120, '감미로운 발라드의 세계로', sysdate+3+(2/24)); 
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '발라드', 
'속초', '38.197225', '128.540727', 
'사용안함', '발라드', 0, '김재은',
'ex (10).jpg', 'ex (11).jpg', null, null, null, sysdate,
120, '감미로운 발라드의 세계로', sysdate+(2/24)); 
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '락', 
'속초', '38.197292', '128.535287', 
'사용안함', '락', 0, '한수현',
'ex (12).jpg', 'ex (13).jpg', null, null, null, sysdate+1,
120, '감미로운 발라드의 세계로', sysdate+1+(2/24)); 
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '락', 
'속초', '37.521638', '126.924206', 
'사용안함', '락', 0, '이정훈',
'ex (12).jpg', 'ex (13).jpg', null, null, null, sysdate+1,
120, '감미로운 발라드의 세계로', sysdate+1+(2/24)); 
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '재즈', 
'여의도', '37.528846', '126.932057', 
'사용안함', '재즈', 0, '김다흰',
'ex (14).jpg', 'ex (15).jpg', null, null, null, sysdate+2,
120, '감미로운 발라드의 세계로', sysdate+2+(2/24)); 
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '발라드', 
'대구', '35.830199', '128.568758', 
'사용안함', '발라드', 0, '최서현',
'ex (16).jpg', 'ex (17).jpg', null, null, null, sysdate+3,
120, '감미로운 발라드의 세계로', sysdate+3+(2/24)); 
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '힙합', 
'대구', '35.837826', '128.558035', 
'사용안함', '힙합', 0, '안중수',
'ex (16).jpg', 'ex (17).jpg', null, null, null, sysdate,
120, '감미로운 발라드의 세계로', sysdate+(2/24)); 
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '힙합', 
'홍대', '37.654609', '126.922898', 
'사용안함', '힙합', 0, '권상우',
'ex (16).jpg', 'ex (17).jpg', null, null, null, sysdate+1,
120, '감미로운 발라드의 세계로', sysdate+1+(2/24)); 
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '락', 
'홍대', '37.457323', '126.922387', 
'사용안함', '락', 0, '소지섭',
'ex (16).jpg', 'ex (17).jpg', null, null, null, sysdate+2,
120, '감미로운 발라드의 세계로', sysdate+2+(2/24)); 
INSERT INTO SQ_BUSKINGLIST values (SQ_BUSKING_ID_SQ.NEXTVAL, 'jhs1', '발라드', 
'홍대', '37.557323', '126.950387', 
'사용안함', '발라드', 0, '10센치',
'10c.jpg', '10c2.png', '10c3.jpg', '10c4.jpg', '10c5.jpg', sysdate,
120, '10㎝(십센치)는 대한민국의 2인조 인디 밴드이다. 고교시절 스쿨밴드 선후배 사이인 윤철종과 권정열로 구성되었다. 밴드 이름은 두 멤버의 키가 10㎝ 차이 난다는 것에서 나왔다.', sysdate+(2/24)); 


commit;