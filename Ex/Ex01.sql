use hr_db;

/********************************
-- select문 (select절 + from절)
********************************/
select * from employees;	-- 마침표
sElEcT * from Employees;	-- 대소문자 구분 없음 

-- 테이블 전체 조회하기
select * from employees;	-- 직원
select * from locations;	-- 도시
select * from regions;		-- 지역
select * from countries;	-- 나라
select * from job_history; 	-- 업무 현황
select * from jobs;			-- 업무
select * from departments; 	-- 부서

-- =====================================================

-- select 절 
select * from employees;


-- employee_id
select employee_id from employees;


-- employee id, first name, last name
select	employee_id, 
		first_name, 
		last_name 
from employees;


-- 모든 직원의 first name 전화번호 입사일 출력
select	first_name, 
		phone_number, 
        hire_date, 
		salary 
from employees;


-- 모든 직원의 풀네임 (first, last 순서) 월급, 전화번호, 이메일, 입사일 출력
select  first_name,
		last_name, 
        salary, 
        phone_number, 
        email, 
        hire_date 
from employees;


-- 컬럼명에 별명사용하기
-- 직원 아이디, 이름, 월급 출력
-- 직원 아이디는 empNO, 이름은 "f-name", 월급은 "월 급"으로 컬럼 출력
select	employee_id as empNO,	-- as는 생략 가능
		first_name as 'f-name', 
        salary as '월 급'		-- 한글 인식 됨. 공백 있으면 특수기호처럼 ' 사용하기
from	employees;


-- 이름(first name), 전화번호, 입사일, 월급으로 표시되게 작성
select  first_name 이름, 
		phone_number 전화번호,
        hire_date 입사일,
        salary 월급
from	employees;


-- 직원아이디를 '사 번', 이름(fst name), 성(last name), 월급, 전화번호, 이메일, 입사일로 표시
select  employee_id '사 번', 
		first_name 이름,
		last_name 성,
        salary 월급, 
        phone_number 전화번호,
        email 이메일,
		hire_date 입사일
from	employees;


-- 산술 연산자 사용
select  first_name,
		salary 월급, 
        salary-100 식대, 
		salary*12 연봉,
        salary*12+5000 '연봉 보너스 포함',	-- 연봉에 5000불 추가
        salary/30 일급, 
        employee_id%3 '워크샵 팀',		-- 3개의 팀으로 나눔
        employee_id/3 정수나누기			-- 정수/정수는 소수점까지 계산
from employees;


-- 연산시 문자열은 0으로 처리  -->  오류는 안 남
select job_id*12
from employees;


-- 
select  first_name, last_name,
		concat(first_name, last_name) '전체 이름', 
        concat(first_name, '-', last_name) as 'full-name',
        concat(first_name, ' ', last_name) as 'full name',
		concat(first_name, ' ', last_name, 'hire date is ', hire_date) as 문장		-- 이현진 입사일은 2024-01-01 입니다. 
        
from employees;

-- 전체 직원의 정보
-- 이름과 성 사이에 -으로 구분 / 월급 / 연봉 / 보너스(월급*12+5000) / 전화번호

select  concat(first_name, '-', last_name) as '성명', 
		salary 월급, 
		salary*12 연봉,
        salary*12+5000 '보너스', 
        phone_number 전화번호
from employees;