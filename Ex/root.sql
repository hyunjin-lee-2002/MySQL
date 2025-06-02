-- --------------------------------------------------
-- root 계정
-- --------------------------------------------------

-- 계정 만들기

-- 모든 곳에서 접속 가능 (활성화 됨)
create user 'web'@'%' identified by 'web';

-- localhost에서만 접속 가능
create user 'web'@'localhost' identified by '1234';

-- 192.168.1.30에서만 접속 가능
create user 'web'@'192.168.1.30' identified by '1234';

-- #계정 비밀번호 바꾸기
alter user'web'@'%'identified by 'web';

/*
mysql -uweb -p
'web'@'192.168.1.30' identified by '1234';  <== 이걸로 로그인 됨.
로그인 우선순위 ==> 'web'@'192.168.1.30' >> 'web'@'localhost' >> 'web'@'%'
*/
-- 비밀번호 바꾸기
alter user'web'@'%'identified by 'web';
/*
'web'@'%' '1234'
'web'@'localhost' '1234'
'web'@'192.168.1.30' '1234'
*/


-- #계정 삭제
drop user 'web'@'192.168.1.30';

drop user 'web'@'localhost';

drop user 'web'@'%';

use mysql;

select  user, host
from user;

-- --------------------------------------------

-- 데이터 베이스 관리(스키마)   (만들기)
create database web_db
	default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

-- 데이터 베이스 관리(스키마)   (삭제)
drop database web_db;

-- 데이터베이스 조회
show databases;

-- 데이터베이스 선택
use web_db;

-- -----------------------------------------------
-- 권한 주기
-- 'web'@'%' 계정이 web_db(데이터베이스)의 모든 테이블의 사용자에게 모든 권한 부여

grant all privileges on web_db.* to 'web'@'%';

-- grant select,insert on hr_db.employees to 'web'@'%';
-- hr_db db의 employees 테이블에 'web'@'%'사용자에게 select,insert 권한 부여