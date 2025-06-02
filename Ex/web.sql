-- --------------------------------------------------
-- 						web
-- --------------------------------------------------

-- #테이블 만들기
create table book (
	book_id int,
	title varchar(50),
    auther varchar(20),
	pub_date datetime
);


-- 1) 테이블 컬럼 추가하기
alter table book add pubs varchar(50);
alter table book add pubs varchar(50);

-- 2-1) 컬럼 수정
alter table book modify title varchar(100);
-- 2-2) 이름 바꾸기
alter table book rename column title to subject;

-- 3) 컬럼 삭제
alter table book drop pubs;

-- 4) 테이블 이름 수정
rename table book to article;

-- 5) 테이블 삭제
drop table article;

-- etc) 테이블 확인
select * from article;


-- # 작가 테이블 만들기
create table author(
	author_id 	int primary key,
    author_name varchar(100) not null,
    author_desc varchar(500)
);

-- 작가 데이터 삽입 alter
-- insert문

insert into author 
value(1, '차정은', '여름 피치 스파클링');

insert into author			-- 오류 / 칼럼 수와 데이터 수가 안 맞음
value(2, '이문열', ''); 		-- 작가 설명에 ' ' 데이터 값을 입력함. 

insert into author			
value(6, '한강', ''); 

insert into author (author_id, author_name)  -- 오류 author name --> not null
value(4, '김진영');							 -- author_name 데이터가 꼭 있어야 함


insert into author (author_id, author_desc)
value(5, '아침의 피아노');
-- 오류 이유: author_name에 not null로 설정했기 때문. 이름 안 넣어서 오류남

insert into author(author_name, author_desc)
value('카리나', '에스파');
-- 오류 이유: pk로 설정했는데 author_id가 없음. 간단히 식별번호로 볼 수 있음. 꼭 있어야 함. 

insert into author(author_desc, author_name, author_id)		-- 괄호 안 순서는 상관 없음
value ('토마토 컵라면', '차정은', 5);							-- 대신 value는 위에 쓴 내용이랑 맞춰서 써줘야 함. 


-- author 테이블 삭제
drop table author;


-- 다시 만들기
insert into author 
value(1, '차정은', '여름 피치 스파클링');

insert into author 
value(2, '차정은', '토마토 컵라면');

insert into author 
value(3, '철학자 김진영', '아침의 피아노');

insert into author 
value(4, '최진영', '구의 증명');

insert into author 
value(5, '오 은', '우리는 분위기를 사랑해');



select * from author;



-- ---------------------------------------------------------------------------------------------

-- # book 테이블 만들기
create table book(
	book_id int primary key,
    title varchar(100) not null,
    pubs varchar(100),
    pub_date datetime
);

insert into book
value();


select * from book;