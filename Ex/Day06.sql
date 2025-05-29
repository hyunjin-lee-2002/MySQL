-- ------------------------------------------------
# SubQuery
/********************
단일행
- subQuery의 결괴기 한 row일 때
- 연산자: =, >, >=, <, <=, !=, <> (!=, <> 둘 다 같지 않다)
********************/
-- ------------------------------------------------
-- 'Den' 보다 월급을 많은 사람의 이름과 월급은?

-- 1)딘의 월급  11000
select 	salary
from employees
where first_name = 'Den';

-- 2)11000 보다 받은사람리스트
select 	first_name,
		salary
from employees
where salary >= 11000;

-- 1)과 2)합친다
select 	first_name,
		salary
from employees
where salary >= (select salary
				 from employees
				 where first_name = 'Den');
                 
                 
-- 월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?
-- 가장적은 월급 min(), 그룹함수라서 이름..하고 같이 사용할수 없다
-- 1)가장 적은 월급 --> 2100
select min(salary)
from employees;

-- 2)월급이 2100인 사람의 이름, 월급, 사번 
select 	first_name,
		salary,
        employee_id
from employees
where salary = 2100;

-- 3)합치기
select 	first_name,
		salary,
        employee_id
from employees
where salary = (select min(salary)
				from employees);

-- !!!절대로 한방에 작성하지 않는다  오해!!!!! 하지말자

-- 평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요?
-- 1)평균월급  --> 6461.831776
select avg(salary)
from employees;


-- 2)6461.831776보다 월급이 적은 사람을 구한다
select *
from employees
where salary <= 6461.831776;

-- 1)과 2) 합친다
select	first_name,
		salary
from employees
where salary <= (select avg(salary)
				 from employees )
order by salary desc;

/********************
		다중행
연산자: all, in, any etc..
*********************/-
-- 부서번호가 110인 직원의 월급과 "같은" 월급을 받는
-- 모든 사원의 사번, 이름, 월급 출력

-- 1)
select  employee_id,
		salary
from employees
where department_id = 110;

-- 2)
select  employee_id, 
		first_name,
        salary
from employees
where salary = 12008 
or salary = 8300;

-- 3)
select employee_id, first_name, salary
from employees
where salary in (select salary
				 from employees
				 where department_id = 110);
                 
-- 예제: 각 부서별로 최고 급여를 받는 사원의 이름과 월급을 출력
/*
select  first_name, 
		max(salary)
from employees
group by department_id;
where department_id in (select max(salary)
						from employees);
*/
-- 1) 각 부서별 최고 월급  -> 이름 출력 x 
select  department_id,
		max(salary)
from employees
group by department_id;

-- 2) 각 부서별 최고 월급 (이름 포함)
-- 2-1) where절 표시
select  first_name, 
		department_id,
		salary
from employees
where (salary = 4400 and department_id = 10)
or (department_id =30 and salary = 11000)
or (department_id = 20 and salary = 13000);

-- 2-2) in() 사용  -> 비교값이 2개 이상
select  first_name, 
		department_id,
		salary
from employees
where (department_id, salary) in ((10, 4400), (30, 11000), (20,13000)) ;

-- 3) 합치기 (2-2 사용)
select  first_name, 
		department_id,
		salary
from employees						-- 1번 사용
where (department_id, salary) in (select  department_id,
										  max(salary)
								  from employees
								  group by department_id) ;
                                  
-- 부서 번호가 110인 직원의 월급 중
-- 가장 작은 월급보다 월급이 많은 모든 직원의 이름, 급여를 출력(or연산 -> 8300보다 큼)
select  *
from employees
where department_id = 110;

select  salary
from employees
where department_id = 110;
                    
-- 2-1) where 절
select  salary
from employees
where salary > 8300
or salary > 12008;

-- 2-2) in
select  salary
from employees
where salary in (8300, 12008);

-- 2-2 any()	where절이 or 일 때
select  salary
from employees
where salary >= any (8300, 12008);

-- 3) 합치기
-- or --> any
select  first_name, 
		salary
from employees
where salary >= any (select salary
					 from employees
                     where department_id = 110);
                     
