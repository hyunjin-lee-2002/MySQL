use hr_db;

-- 전일 복습
select  first_name,
		Upper(first_name), -- 대문자로 표기 
        rpad(first_name, 10, '*') -- (이름 포함 10칸, 이름은 나오게) * 표기
from employees;

-- --------------------------------------
-- *복수행 함수 (그룹 함수, 집계 함수)
-- --------------------------------------
-- 종류: 갯수 합계 평균 최고값 최저값(최소값 최대값)

-- 사용 가능(결과 1개 --> 표현 가능)
select  sum(salary) -- 평균 / 결과 하나만 출력 
from employees;

-- 사용 불가능(결과 107개와 1개를 같이 표현 못 함)
select  first_name
		,sum(salary)
from employees;


-- *그룹 함수 > count() 데이터의 총 건수---------------------------------------
-- 직원의 수를 구하시오
select  count(*) -- 전체 갯수(row) 
from employees;

select  count(commission_pct) -- 커미션을 받은 직원의 수 (null을 제외 갯수)
from employees;

select count(manager_id) -- 매니저(팀장)가 있는 직원의 수 (null을 제외 갯수)
from employees;

select  count(*), count(commission_pct), sum(salary) -- 표를 예쁘게 그릴 수 있냐 없냐
from employees;

-- 월급이 16000 초과되는 직원의 수는?
select  count(salary)
from employees
where salary > 16000;

select  * -- 이렇게 수가 맞는지 확인하기 
from employees
where salary > 16000;

select  count(*),
		count(salary), -- 조건이 있기 때문에 둘이 똑같음 
		count(manager_id)
from employees
where salary > 16000;


-- *그룹 함수 > sum() 합계 값---------------------------------------
-- 전체 직원의 수와 급여의 합
select  count(*),
		sum(salary)
from employees;

-- 논리적으로 잘못된 합계 (계산은 됨)
select  sum(employee_id), -- 컬럼이 잘못되면 전혀 다른 데이터가 나오기 때문에 주의!!!
		sum(first_name) -- 0으로 계산 
from employees;


-- *그룹 함수 > avg() 평균값---------------------------------------
-- 월급의 평균을 구하시오
select  avg(salary),  			 -- salary가 null이면 평균에 포함 안됨
		avg(ifnull(salary, 0))	 -- salary가 null이면 0으로 평균에 포함
from employees
;

select  ifnull(commission_pct, 0) -- 0으로 잘 표기되나 확인
from employees;


-- *그룹 함수 > max(), min() 가장 큰값/작은값---------------------------------
-- 정렬 로직을 가지고 있어서 계산량이 많다 
select  max(salary), -- 1개 oreder by salary desc
		min(salary), -- 1개 order by salary asc 
        sum(salary)  -- 1개
	--  first_name   -- 여러개 -> 안됨
from employees;
-- 수가 아니어도 가능한 경우들이 있음 
select  max(hire_date), -- 가장 먼저, 늦게 입사한 날짜 
		max(first_name),
		min(hire_date) 
from employees;

-- 정렬
select  *
from employees
order by hire_date desc;

-- count(*), sum(salary), avg(salary), max(salary), min(salary)
-- max, min은 사용자가 많아질수록 계산의 양이 확 많아져 느려지기 때문에 최소한으로 사용하기 

-- --------------------------------------
-- *group by 절 
-- --------------------------------------
-- 부서별로 월급 합계를 구해라 
-- 현재로는 where절을 이용해서 구한다 --> 한 그룹씩만 가능
select  sum(salary)
from employees
where department_id = 90;
-- 한 번에 그룹별로 합계를 구한다
-- Group by에 참여한 컬럼이나 그룹함수만 올 수 있다.
select  department_id,
		count(*),
		sum(salary), 	-- 합친 그룹별 월급 합계
        avg(salary), 	-- 평균
        max(salary), 	-- 최고값
        min(salary) 	-- 최저값 
        -- first_name 은 안 됨 
from employees
group by department_id; -- 그룹합치기



-- 부서별로 부서 번호와 최고월급, 최고월급을 받는 직원의 이름을 출력하세요
-- Group by에 참여한 컬럼이나 그룹함수만 올 수 있다.
select  department_id,
		max(salary),
        first_name
from employees
group by department_id;

-- 부서별 월급 합계, 부서 job_id별 인원수 
-- 그룹 나누는 첫 번째 기준 department_id, 그 안에서 서브(두번째) 그룹을 job_id로 
select  department_id,
		job_id,
		sum(salary),
        count(*)
from employees
group by department_id, job_id -- 1차 그룹, 2차 그룹(서브 그룹)
order by department_id asc;

-- 비교
select  department_id,
		job_id,
        first_name, -- 그룹에 참여하지 않은 컬럼명은 사용할 수 없다
		sum(salary),
        count(*)
from employees
group by department_id, job_id 
order by department_id asc;
-- ------------------------------------------------------------------------------
-- 부서별로 부서 번호와 인원수, 월급 합계를 출력하세요
select  department_id,
		count(*),
        sum(salary)
from employees
group by department_id;
-- --------------------------------------
-- *having 절 
-- --------------------------------------
-- 월급(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 월급합계를 출력하세요
select  department_id,
		count(*),
		sum(salary),
        avg(salary),
        max(salary),
        min(salary)
from employees
group by department_id
having sum(salary) >= 20000; -- having절에는 그룹함수와 group by에 참여한 컬럼만 사용할 수 있다.

-- 월급(salary)의 합계가 20000 이상이고 부서번호가 100번 이상인 부서의 부서 번호와 , 인원수, 월급합계를 출력하세요
-- having 절
select  department_id,
		count(*),
		sum(salary)
from employees
group by department_id
having sum(salary) >= 20000 -- having절에는 그룹함수와 group by에 참여한 컬럼만 사용할 수 있다.
and department_id >= 100; -- 100 이상만 
-- and hire_date > 2001/01/01 -- 쓸 수 없음



select  department_id
--		   count(*),
-- 		   sum(salary),
--         avg(salary),
--         max(salary),
--         min(salary)
from dual
-- where
group by department_id
having sum(salary) >= 20000;


-- ------------------------------------------------------------------------

/********************************
	if (조건문, 참, 거짓일때)
********************************/ 
-- 모든 직원의 이름, 월급, 수당, 상태를 출력
-- 상태컬럼은 수당이 없으면 0, 수당이 있으면 1을 state 컬럼에 표시

-- IFNULL(컬럼명, null일때값): 컬럼의 값이 null일때 정해진값을 출력

select  first_name,
		salary, 
        commission_pct,
        if(commission_pct is null, '사무직', '영업사원') as 'if()', 
        ifnull(commission_pct, '없음') as 'ifnull()'
from employees;

-- ------------------------------------------------------
-- * CASE ~ END 문:  if~else if~else if~else

-- 문제)
-- 직원아이디, 월급, 업무아이디, 실제월급(realSalary)을 출력하세요.
-- 실제월급은 job_id 가 'AC_ACCOUNT' 면 월급+월급*0.1,
-- 					'SA_REP' 월급+월급*0.2,
-- 					'ST_CLERK' 면 월급+월급*0.3
-- 					그외에는 월급으로 계산하세요. 
select  job_id 업무아이디, 
		salary 월급,
		case when job_id = 'AC_ACCOUNT' then salary+salary*0.1
			 when job_id = 'SA_REP' then salary+salary*0.2
             when job_id = 'ST_CLERK' then salary+salary*0.3
             else salary
		end 실제월급
from employees;

/*
예제)
직원의 이름(first_name), 부서아이디(department_id), 팀을 출력하세요
팀은 코드로 결정하며 부서코드가 
 10~50 이면 'A-TEAM'
 60~100이면 'B-TEAM'
 110~150이면 'C-TEAM'
 나머지는 '팀없음' 으로 
출력하세요.
*/
select  first_name, 
		department_id,
        case  when department_id >=10 and department_id <= 50 then 'A-TEAM'
			  when department_id >=60 and department_id <= 100 then 'B-TEAM'
              when department_id >=110 and department_id <= 150 then 'C-TEAM'
			  else 'No Team'
		end Team
from employees;
