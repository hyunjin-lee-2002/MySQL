/********************************
-- select문 조회
********************************/

/********************************
			where절
********************************/
--  부서 아이디가 30인 사원 이름, 부서번호 구하기
select	first_name, department_id
from	employees
where department_id = 30;		-- 기호:  =, >, <, >=, <= !=(부정)<>


--  월급이 15000 이상인 사원들의 이름과 월급을 출력하세요
select  first_name, 
		salary
from	employees
where	salary >= 1500;

--  07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select	first_name, 
		hire_date
from	employees
where	hire_date > 07/01/01; 
/*
--  특정 기준일을 0으로 해서 관리
1700-01-01 00:00:00		0  --> 1700/01/01 00:00:00
1700-01-01 00:00:01		1 
1700-01-01 00:00:02		2 
1700-01-01 00:01:00		13

2025-05-23 11:25:00		25523
*/

--  이름이 Lex인 직원의 이름과 월급을 출력하세요
select	first_name, 
		salary
from	employees
where	first_name = 'Lex';

--  비교
select	first_name, 
		salary
from	employees
where binary first_name = 'lex';		--  구별하려면 binary 사용 (lex는 db에 없으니 결과값 없음)
--  문자열 대소문자를 구별하지 않는다.  구별하려면 binary 사용

--  조건이 2개 이상일 때 한 번에 조회하기
--  월급이 14000이상 17000이하인 사원의 이름과 월급 구하기
--  salary >=14000  1400이상
--  salary >=17000  1700이하
--  두 조건 모두 만족해야함. 기호: &&(이것두댐 내가해봄) = and(근데 글자가 더 예뻐서 글자씀), (|| = or)
select	first_name,
		salary
from	employees
where	salary >= 14000	and salary <= 17000;


--  월급이 14000 이하이거나 17000 이상인 사원의 이름과 월급을 출력하세요
select  first_name, 
		salary
from	employees
where	salary <= 14000 || salary >= 17000;

--  입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select	first_name,
		hire_date
from	employees
where	hire_date >= 04/01/01 or hire_date <= 05/12/31;

--  월급이 14000 이상 17000이하인 사원의 이름과 월급을 구하시오
select	first_name, salary
from	employees
where	salary >= 14000 and salary <= 17000; 

--  월급이 14000 이상 17000이하인 사원의 이름과 월급을 구하시오 (between)
select	first_name, salary
from	employees
where	salary between 14000 and 17000;

--  Neena, Lex, John 의 이름, 성, 월급을 구하시오
select first_name, last_name, salary
from employees
where first_name = 'neena' 
or first_name = 'lex'
or first_name = 'john';

--  in 사용
select  first_name, last_name, salary
from	employees
where	first_name in ('Neena', 'Lex', 'John');

-- 월급이 2100, 3100, 4100, 5100 인 사원의 이름과 월급을 구하시오 (in 사용)
select  first_name, last_name, salary
from 	employees
where 	salary in (2100, 3100, 4100, 5100);

/********************************
			like 연산자
********************************/

--  이름이 L(대소문자 구분x)로 시작하는 직원의 이름, 성, 월급을 출력하세요
select  first_name, last_name, salary
from	employees
where	first_name like 'L%';

--  이름이 L(대소문자 구분x)로 끝나는 직원의 이름, 성, 월급을 출력하세요
select  first_name, last_name, salary
from	employees
where	first_name like '%l';

--  이름에 n 들어가는 사람
select  first_name, last_name, salary
from	employees
where	first_name like '%n%';

--  1. 이름에 am 을 포함한 사원의 이름과 월급을 출력하세요
select  first_name, salary
from	employees
where	first_name like '%am%';

--  2. 이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요
select	first_name, salary
from	employees
where	first_name like '_a%';

--  3. 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select	first_name, salary
from	employees
where	first_name like '___a%';

--  4. 이름이 4글자인 사원 중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요 (글자수 제어, % 안씀)
select  first_name
from	employees
where	first_name like '_a__';

/********************************
			 null
********************************/ 
--  null:	아무런 값도 정해지지 않았음을 의미 (0이 아님)
-- 			어떠한 데이터타입에도 사용가능
--  		not null 이나 primary key 속성에는 사용할 수 없음
--  		null을 포함한 산술식은 null
-- 			null은 = 사용하지 않고 is 사용

-- 부서가 없는 사람을 이름과 부서 번호를 출력할 것
select	first_name, 
		department_id
from 	employees
where 	department_id is null;

-- 부서가 있는 사람을 이름과 부서 번호를 출력할 것
select  first_name, 
		department_id
from 	employees
where 	department_id is not null;

select  first_name, 
		salary, 
		commission_pct, 
        salary*commission_pct,
        salary*commission_pct+200
from 	employees;

--  1. 커미션비율이 있는 사원의 이름과 월급 커미션비율을 출력하세요
select  first_name, 
		salary, 
		commission_pct
from 	employees
where 	commission_pct is not null;

--  2. 담당매니저가 없고 커미션비율이 없는 직원의 이름과 매니저아이디 커미션 비율을 출력하세요
select  first_name, 
		manager_id,
        commission_pct
from	employees
where	manager_id is null
and 	commission_pct is null;

--  3. 부서가 없는 직원의 이름과 월급을 출력하세요
select	first_name, 
		salary
from	employees
where	department_id is null;

--  4;	월급 6000이상 10000이하 직원 중 (between and)
-- 		커미션 비율이 없는 직원의 (null)
-- 		이름, 월급, 커미션 비율 출력
select	first_name,
		salary,
        commission_pct
from	employees
where	salary between 6000 and 10000
and 	commission_pct is null;

-- ------------------------------------------------------------------------

/********************************
		order by 절(정렬)
********************************/ 
--  select, from, where, order by
--  정렬조건이 복수일때는 , 로 구분하여 나열
--  오름차순: asc
--  내림차순: desc

-- 	직원의  이름과 월급을 월급이 많은 직원부터 출력 (큰 거에서 작은 거로 내려오는. 내림차순)
select first_name, salary
from employees
order by salary desc;

--  월급이 9000 이상인 직원의 // 이름과 월급을 // 월급이 작은 순으로 출력
select first_name, salary
from employees
where salary >= 9000
order by salary asc;




--  1. 부서번호를 오름차순으로 정렬하고 // 부서번호, 월급, 이름을 출력하세요 (desc)
select  department_id, 
		salary,
        first_name
from	employees
order by department_id desc;

--  2. 월급이 10000 이상인 직원의 // 이름 월급을 // 월급이 // 큰직원부터 // 출력하세요 (desc)
select  first_name,
		salary
from	employees
where salary >= 10000
order by salary desc;

--  3. 부서번호를 오름차순으로 정렬하고 // 부서번호가 같으면 월급이 높은 사람부터 // 부서번호 월급 이름을 출력하세요  (asc)
-- 	부서번호 먼저, 같으면 월급 많은 순으로 출력 (salary = desc  //  department id = asc)
select  department_id, 
		salary,
        first_name
from employees
order by department_id asc, salary desc, first_name asc;

--  4. 직원의 이름, 급여, 입사일을 // 이름의 알파벳 // 오름차순 // 으로 출력하세요 (asc)
select  first_name, 
		salary, 
        hire_date
from employees
order by  first_name asc;

--  5. 직원의 이름, 급여, 입사일을 // 입사일이 빠른 사람 부터 // 출력하세요 (asc)
select  first_name,
		salary,
        hire_date
from employees
order by hire_date asc, salary desc;