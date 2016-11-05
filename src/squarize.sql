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

--SQ_ARTIST 생성
INSERT INTO SQ_ARTIST VALUES ('aa', '010-1111-1011', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('ss', '010-1211-1151', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('dd', '010-1241-1118', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('123', '010-1216-1131', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('1234', '010-1271-5111', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('qq', '010-1291-1161', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('nnn', '010-1271-1211', null,'adfadsfd');
INSERT INTO SQ_ARTIST VALUES ('jhs1', '010-1271-1213', null,'adfadsfd');


--테스트용

INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '1234', '이리오세요! 기타세션 급구', sysdate, '기타',null, null, '락', sysdate, '홍대',37.556386, 126.924211, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '밤을 잊은 그대에게-바이올린', sysdate, '기타',null, null, '재즈', sysdate, '도림천',37.472118, 126.933605, '컴온');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '퓨전 클래식-첼리스트 구해요', sysdate, '기타',null, null, '재즈', sysdate, '홍대',37.556309, 126.924104, '요~~');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '1234', '재즈 : 베이스 캄온~~!', sysdate, '드럼',null, null, '락', sysdate, '청담',37.523830, 127.053350, '풋쳐핸즈업');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'dd', '이번밖에 없습니다.-키보드', sysdate, '드럼',null, null, '락', sysdate, '이대',37.561866, 126.946727, '왓썹?');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'dd', 'Such a *****!(drum)', sysdate, '드럼',null, null, '락', sysdate, '홍대',37.555799, 126.924034, '컴온 레이디즈');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'dd', 'Nanananana-기타세션', sysdate, '기타',null, null, '락', sysdate, '서울 시청',37.565578, 126.977984, '컴온 보이즈');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '123', '깔아줄 베이스 찾습니다', sysdate, '기타',null, null, '락', sysdate, '홍대',37.555739, 126.923959, '쉬즈건');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '헤비메탈에 목청을 바칩니다', sysdate, '보컬',null, null, '발라드', sysdate, '대학동',37.470931, 126.938185, '콜라보레이션');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '파티타임! 기타세션~', sysdate, '기타',null, null, '재즈', sysdate, '신림',37.483913, 126.929257, '아임인');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '첼로-국악과의 콜라보레이션', sysdate, '보컬', null,null, '재즈', sysdate, '홍대',37.555939, 126.924286, '준');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '첼리스트 급구합니다.', sysdate, '키보드', null,null, '힙합', sysdate,'청담',37.523668, 127.054047, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', 'DRUM 세션 급구!', sysdate, '드럼', null, null,'힙합', sysdate,'삼성동',37.512441, 127.058668, '아리랑');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '[급구]가야금', sysdate, '기타', null,null, '락', sysdate, '도림천',37.471539, 126.93438, '퓨전');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '123', '역삼역-락보컬', sysdate, '보컬', null, null,'재즈', sysdate, '도림천',37.471752, 126.933691, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '락발라드', sysdate, '기타',null, null, '재즈', sysdate, '삼성동',37.511956, 127.060576, '발라드 함 들어보실라예');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'aa', '전자 바이올리니스트 급구', sysdate, '보컬',null, null, '락', sysdate, '삼성동',37.510145, 127.061726, '컴온 이리오세요');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, '123', '드럼 세션', sysdate, '드럼',null, null, '발라드', sysdate,'삼성동', 37.511488, 127.061088, '컴컴');
INSERT INTO SQ_RECRUIT VALUES(SQ_RECRUIT_ID_SQ.nextval, 'ss', '드럼 세션', sysdate, '드럼',null, null, '재즈', sysdate, '홍대',37.556033, 126.924797, '냥냥');

INSERT INTO SQ_RECRUIT_APPLY VALUES (SQ_RECRUIT_APPLY_ID_SQ.nextval, 1, 'aa');





--대관 게시물 등록
INSERT INTO sq_rent VALUES(sq_rent_id_sq.nextval, 'aa', '즐거운밴드', sysdate+7, sysdate, sysdate+5, '같이해요', 'ex (1).jpg', 'ex (1).jpg', '서울특별시 강남구', '락', '1', '1', 37.510674, 127.060012599);
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
INSERT INTO sq_portfolio VALUES (sq_port_id_sq.nextval, '123', '기타', '1990년 키보드를 들고 태어남', '저는 많이 활약했어요', 'portFile (3).jpg', 'portMedia (3).MOV');



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


INSERT INTO sq_ad VALUES (sq_ad_id_sq.nextval, '오렌지앰프', 'amp.jpg', 'http://freebud.co.kr/', '기타');
INSERT INTO sq_ad VALUES (sq_ad_id_sq.nextval, '전자드럼', 'drum.jpg', 'http://freebud.co.kr/', '드럼');
INSERT INTO sq_ad VALUES (sq_ad_id_sq.nextval, '기타 1+1', 'guitar.jpg', 'http://freebud.co.kr/', '기타');
INSERT INTO sq_ad VALUES (sq_ad_id_sq.nextval, '키보드할인', 'keyboard.jpg', 'http://freebud.co.kr/', '키보드');
INSERT INTO sq_ad VALUES (sq_ad_id_sq.nextval, '마이크', 'mic.jpg', 'http://freebud.co.kr/', '보컬');
INSERT INTO sq_ad VALUES (sq_ad_id_sq.nextval, '스틱 세일', 'stick.jpg', 'http://freebud.co.kr/', '드럼');




commit;