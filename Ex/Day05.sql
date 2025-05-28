/********************************
			join
********************************/ 
-- 기본정리: 
-- 직원의 이름과 속한 부서명을 출력
-- steven 90   90  executive
-- 카디젼 프로덕트: 모든 경우의 수의 갯수가 됨
-- 107*27 = 2889건 (원하는 게 아님. 원하는 건 107개)
select  first_name, department_id
from employees, departments;

-- where절을 사용함  (normal)
select count(*)
from employees, departments
where employees.department_id = departments.department_id;		-- where절 사용

-- ------------------------------------------------------------------------

/********************************
	 	 inner join
		 (equi join)
********************************/ 
-- 직원의 이름과 속한 부서명을 출력
select  first_name,
		employees.department_id
from employees inner join departments
on employees.department_id = departments.department_id;

select  *
from employees e inner join departments d
on e.department_id = d.department_id;			-- 약자 e, d를 써야 오류 안나는듯


select  first_name,
		em.department_id,
        de.department_id,
        de.department_name
from employees em inner join departments de
on em.department_id = de.department_id;

-- inner join(equi join) 약식표현 (많이 사용함)
select  e.first_name,
		e.department_id,
        d.department_id,
        d.department_name
from employees e, departments d
where e.department_id = d.department_id;

-- --------------------
/*
select  count(*)		-- 107
from employees;

select  count(*)		-- 27
from departments;

select  count(*)		-- 23
from locations;
*/


select  e.first_name,
		d.department_name,
        l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id; 			-- 106

-- inner join (equi join) 정식표현
/*
107      27        23
이름   부서명    부서도시
Steven Excutive  Seattle
Neena  Excutive  Seattle
...
David  IT        Southlake
(106개)
*/

select 	e.first_name,
		d.department_name,
        l.city,
		l.location_id,
        d.location_id
from employees e 
inner join departments d
	    on e.department_id = d.department_id
inner join locations l
        on d.location_id = l.location_id;

-- 모든 직원이름, 부서이름, 업무명 을 출력하세요
select	e.first_name,
		d.department_name,
        j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id;

select 	e.first_name,
		d.department_name,
        j.job_title
from employees e
inner join departments d
	on e.department_id = d.department_id
inner join jobs j
	on e.job_id = j.job_id;
-- -------------------------------------------------

-- ------------------------------
# left outer join
-- ------------------------------
-- 왼쪽 테이블을 기준 ,기준테이블의 정보는 다 보여줌
-- (Kimberely 가 결과에 있어야 함:소속부서가 없는 직원)
select	e.first_name,
		d.department_name,
        e.department_id,
        d.department_id
from employees e 
left outer join departments d
on e.department_id = d.department_id;

-- ------------------------------
# right outer join
-- ------------------------------
-- 모든 직원의 부서번호, 이름,  부서번호를 출력하세요
-- 직원이 없는 부서도 표시  
select	e.first_name,
		d.department_name,
        e.department_id,
        d.department_id
from employees e 
right outer join departments d
	on e.department_id = d.department_id;

-- ------------------------------
# right outer join --> left outer join
-- ------------------------------
-- 모든 직원의 부서번호, 이름,  부서번호를 출력하세요
-- 직원이 없는 부서도 표시  
select	e.first_name,
		d.department_name,
        e.department_id,
        d.department_id
from departments d left outer join  employees e 
	on d.department_id = e.department_id;

-- ------------------------------
# full outer join    union
-- ------------------------------
(-- left조인
select 	e.employee_id,
		e.first_name,
		d.department_id,
		d.department_name
from employees e
left outer join departments d
	on e.department_id = d.department_id
)
union
(-- right조인
select 	e.employee_id,
		e.first_name,
		d.department_id,
		d.department_name
from employees e
right outer join departments d
	on e.department_id = d.department_id
) ;

-- 왼쪽기준
select 	e.employee_id,
		e.first_name,
		d.department_id,
        d.department_name
from employees e
left outer join departments d
	on e.department_id = d.department_id;


-- 오른쪽기준
select 	e.employee_id,
		e.first_name,
        d.department_id,
        d.department_name
from employees e
right outer join departments d
	on e.department_id = d.department_id;

-- ------------------------------
# self join 
-- ------------------------------
-- 테이블에서 자신의 pk를 fk로 가지고 있는 경우
-- 같은 테이블을 두번 불러와서 써야되는 경우
-- 두번 불러와서 별명을 다르게 줌(꼭 별명을 줘야 함)
select 	e.employee_id,
		e.first_name,
		e.phone_number,
        e.manager_id,
        e.department_id,
        m.first_name,
        m.phone_number
from employees e, employees m
where e.manager_id = m.employee_id;

-- ------------------------------
# 참고 잘못된 조인
-- ------------------------------
-- 아무 컬럼이나 where에 사용하면 안됨
-- 월급과 도시는 아무런 관계가 없음
select *
from employees e, locations l
where e.salary = l.location_id;


-- ------------------------------------------------------------------------------------------
# 조인 연습(equi join, inner join 두가지로 풀어볼것)
-- 직원아이디, 이름, 월급, 부서아이디, 부서명, 도시아이디, 도시명
select  e.employee_id,
		e.first_name,
        e.salary,
        e.department_id,
        e.job_id,
        l.location_id,
        l.city
from employees e, locations l ;
-- 직원아이디, 이름, 월급, 부서아이디, 부서명, 도시아이디, 도시명, 나라아이디, 나라명
select  e.employee_id, 
		e.first_name,
        e.salary,
        e.department_id,
        -- e.department_name, 
        l.location_id,
        l.country_id
        -- l.country_name
        
from employees e, locations l;

-- 직원아이디, 이름, 월급, 부서아이디, 부서명, 도시아이디, 도시명, 나라아이디, 나라명, 지역아이디, 지역명