/****************************************
문제 1.
전체직원의 다음 정보를 조회하세요. 
정렬은 입사일(hire_date)의 올림차순(ASC)으로 가장 선임부터 출력이 되도록 하세요. 
이름(first_name last_name), 월급(salary), 전화번호(phone_number), 입사일(hire_date) 순서이고 
"이름", "월급", "전화번호", "입사일" 로 컬럼 이름을 대체해 보세요. 
입사일이 같으면 abc순(오름차순)으로 출력합니다.
****************************************/
select  concat(first_name, ' ', last_name) as 이름, 
		salary as '월급', 
        phone_number as '전화번호', 
        hire_date as '입사일'
from	employees
order by hire_date asc, first_name asc;

/****************************************
문제2.
업무(jobs)별로 업무이름(job_title)과 최고월급(max_salary)을 월급의 내림차순(DESC)로 정렬
하세요.
****************************************/
select  job_title, 
		max_salary
from jobs
order by max_salary desc;
/****************************************
문제3.
담당 매니저가 배정되어있으나 커미션비율이 없고, 
월급이 3000초과인 직원의 이름, 매니저 아이디, 커미션 비율, 
월급을 월급이 많은사람부터 출력하세요.
****************************************/
select  first_name, 
		manager_id, 
        commission_pct
from 	employees
where 	salary > 3000
and 	commission_pct is null
order by salary asc;

/****************************************
문제4.
최고월급(max_salary)이 10000 이상인 
업무의 이름(job_title)과 최고월급(max_salary)을 
최고월급의(max_salary) 내림차순(DESC)로 정렬하여 출력하세요.
****************************************/
select  job_id, 
		salary
from employees
where salary >= 10000
order by salary desc;

/****************************************
문제5.
월급이 14000 미만 10000 이상인 직원의 
이름(first_name), 월급, 커미션퍼센트 를 월급순(내림차순) 출력하세오. 
단 커미션퍼센트 가 null 이면 0 으로 나타내시오
****************************************/
select  first_name, 
		salary, 
        commission_pct
from employees
where salary between 10000 and 14000
order by salary desc;

/****************************************
문제6.
부서번호가 10, 90, 100 인 직원의 
이름, 월급, 입사일, 부서번호를 나타내시오
입사일은 1977-12 와 같이 표시하시오
****************************************/
select  first_name,
		salary, 
        date_format(hire_date, '%Y-%m') hire_month,
        employee_id
from employees
where department_id in (10, 90, 100);

/****************************************
문제7.
이름(first_name)에 S 또는 s 가 들어가는 직원의 이름, 월급을 나타내시오
****************************************/
select  first_name, salary
from employees
where first_name like '%s%';

/****************************************
문제8.
전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세오.
****************************************/
select  *
from employees
order by length(job_id) desc;

/****************************************
문제9.
정확하지 않지만, 지사가 있을 것으로 예상되는 나라들을 나라이름을 대문자로 출력하고
올림차순(ASC)으로 정렬해 보세오.   from countries
****************************************/
select  country_name, 
		ucase(country_name)
from countries
order by country_name asc;
/****************************************
문제10.
입사일이 03/12/31 일 이전 입사한 
직원의 이름, 월급, 전화 번호, 입사일을 출력하세요
전화번호는 545-343-3433 과 같은 형태로 출력하시오.
****************************************/
select  first_name,
		salary,
		concat(
        substring(phone_number, 1, 3), '-', 
        substring(phone_number, 5, 3), '-', 
        substring(phone_number, 9)
		) as phone_number,
        hire_date
from employees
where hire_date < '03/12/31';