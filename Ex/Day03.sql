/**********
복습
**********/
-- 월급이 10000 이상인 직원의 // 이름 월급을 // 월급이 큰 직원부터 출력
-- select문의 기본 구조 (4개의 절)
-- 작동 순서 중요

select  first_name 이름, 	
		salary 월급
from 	employees
where 	salary >= 10000
order by 월급 desc;

-- where절 x, order by절 --> 작동 순서  (where는 컬럼 인식 안됨)
select  first_name 이름, 	
		salary 월급
from 	employees
where 	월급 >= 10000
order by 월급 desc;

-- ------------------------------------------------------------------------

/********************************
		   단일행 함수
********************************/ 
-- *단일행 함수 > 숫자 함수

-- *round() : 반올림
select  round(123.123, 2), 			--  123.12 소수점 2자리까지 표현 (양수는 소숫점을 건듦)
		round(123.126, 2),  		--  소수점 3자리에서 반올림 돼서 표현
		round(234.567, 0),  		--  235
        round(123.456, 0), 			--  123
        round(123.124, -1),			--  120  (음수는 양수쪽을 건듦)
        round(125.126, -2)			--  100
from	dual;

-- *ceil() : 올림	 0번쨰 자리까지 표현 (소수점 1자리에서 버림)
select  ceil(123.456),				-- 124
		ceil(123.789),				-- 124 (소수점 버려서)
        ceil(123.789213),
        ceil(987.1234)
from dual;

-- *floor() : 내림	0번째 자리까지 표현 (소수점 1자리에서 버림)
select  floor(123.456), 			-- 123
		floor(123.4567),			-- 123
		floor(123.7892313),			-- 123
        floor(987.1234)				-- 987
from dual;

-- *truncate() : 자리수 버림
select  truncate(1234.34567, 2), 	-- 1234.34
		truncate(1234.34567, 3),	-- 1234.345
        truncate(1234.34567, 0),	-- 1234
        truncate(1234.34567, -2)	-- 1200
from dual;

-- *POWER(숫자, n),  POW(숫자, n): 숫자의 n승
select  power(12, 2),				-- 12*12
		pow(12, 2)					-- power와 같음 12*12 = 144
from	dual;

-- * SQRT(숫자): 숫자의 제곱근 
select  sqrt(144)					-- 144 = 12*12 (루트)
from	dual;

-- * SIGN(숫자): 숫자가 음수이면 -1, 0이면 0, 양수이면 1
select  sign(123),					-- 양수 = 1
		sign(0), 					-- 0이면 0
        sign(-123)					-- 음수 = -1
from dual;

-- * ABS(숫자): 절대값
select  abs(123), 					-- 절대값 123
		abs(0),						-- 0
        abs(-123)					-- -123
from dual;

-- * GREATEST(x, y, z, ...): 괄호안의 값중 가장 큰값
select  greatest(2, 0, -2),				-- 2
		greatest(4, 3.2, 5.25),			-- 5.25
        greatest('B', 'A', 'D', 'd'),	-- d  왜 소문자가 더 큼 (c는 대소문자 구분 어려워서 d로 바꿈)
		greatest('ㄱ', 'ㅎ', 'ㅏ', 'ㅗ'),	-- ㅗ
        greatest('B', 'A', 'ㄱ', 'ㅗ')	-- ㅗ 한글이 더 큼? 그럼 영어 쓰지 말고 한국어 써 ㅅㅂ들아
from dual;

-- * LEAST(x, y, z, ...): 괄호안의 값중 가장 작은값  
select	least(2, 0, -2),			-- -2
		least(4, 3.2, 5.25),		-- 3.2
        least('B', 'A', 'D', 'd'),	-- A
        least('B', 'A', 'a', 'ㅗ')	-- A
from dual;

-- ------------------------------------------------------------------------

/********************************
		   단일행 함수 
********************************/ 

-- 단일행 함수 > 문자 함수
-- CONCAT(str1, str2, ..., strn): str1, str2, ..., strn을 연결  
select  concat('say', 'hi')
from dual;

select	concat('집'-'가고'-'싶어요')
from dual;

select  concat(first_name, " ", last_name)
from employees; 

-- CONCAT_WS(s, str1, str2, ..., strn): str1, str2, ..., strn을 연결할때 
-- 사이에 s 로 연결 *with seperator
select concat_ws(' - ', 'abc', '123', '가나다') -- 합칠 때 첫 글자로 합침. 결과: abd - 123 - 가나다
from dual;

select  first_name, last_name, 
		concat(first_name, last_name),
        concat( first_name, ' - ', last_name, employee_id),
        concat_ws(' - ', first_name, last_name, employee_id)
from employees;

-- lcase(str) 또는 lower(str): str의 모든 대문자를 소문자로 변환
select 	first_name,
		lcase(first_name),
		lower(first_name),
        lower('ABCabc!#$%'),
        lower('가나다')
from employees;

-- ucase(str) 또는 upper(str): str의 모든 소문자를 대문자로 변환
select 	first_name,
		ucase(first_name),
		upper(first_name),
        upper('ABCabc!#$%'),
        upper('가나다')
from employees;

-- ucase(str) 또는 upper(str): str의 모든 소문자를 대문자로 변환
select 	first_name,
		ucase(first_name),
		upper(first_name),
        upper('ABCabc!#$%'),
        upper('가나다')
from employees;


-- 문자갯수
-- length(str): str의 길이를 바이트로 반환
-- char_length(str) 또는 character_length(str): str의 문자열 길이를 반환
select  first_name, 
		length(first_name), 			-- 바이트수 (조심)
        char(first_name),				-- 글자수
        character_length(first_name)	-- 글자수
from employees;

select  length('a'),
		char_length('a'),
        character_length('a')
from dual;

select  length('가'),
		char_length('나'),
        character_length('다')
from dual;

-- SUBSTRING(str, pos, len) 또는 SUBSTR(str, pos, len): 
-- str의 pos 위치에서 시작하여 len 길이의 문자열 반환
-- * 양수인 경우 왼쪽오른쪽으로 검색해서 글자수 만큼 추출
-- **음수인 경우 오른쪽왼쪽 검색을 한 후 왼쪽오른쪽으로 글자수 만큼 추출
select  first_name,
		substr(first_name, 1, 3),				-- 1번째부터 3글자
        substring(first_name, 2, 4),			-- 2번째부터 4글자
        substring(first_name, -3, 2)			-- 뒤에서 3번째부터 2굴자
from employees;


select  substr('040418-1456789', 8, 1),		-- 성별
		substr('040418-1456789', -7, 1),	-- 성별
        substr('010-2222-3333', 1, 3)		-- 지역번호
from dual;



-- LPAD(str, len, padstr): 
-- 		str 문자열 왼쪽에 padstr 문자열을 추가하여, 전체 문자열의 길이가 len이 되도록 만듦
-- RPAD(str, len, padstr)
-- 		str 문자열 오른쪽에 padstr 문자열을 추가하여, 전체 문자열의 길이가 len이 되도록 만듦

select  first_name,
		lpad(first_name, 10, '!'),
        rpad(first_name, 10, '*')
from employees;

/*****
TRIM(str): str의 양쪽에 있는 공백 문자를 제거
- LTRIM(str): str의 왼쪽에 있는 공백 문자를 제거
- RTRIM(str): str의 오른쪽에 있는 공백 문자를 제거
- trim: 문장의 중간 공백은 적용되지 않음
-- ex) ________hello________
*****/
select  concat('|','        hello        ' ,'|'), 
		concat('|',      trim('        hello        ')      ,'|'),
        concat('|',      ltrim('        hello        ')      ,'|'),
        concat('|',      rtrim('        hello        ')      ,'|'),
        
        trim(concat('|', '        hello        ', '|'))
from dual;

-- replace[(str, from_str, to_str)]: str에서 from_str을 to_str로 변경
select  first_name,
		replace(first_name, 'a', '&+&')
from employees;

/* ex)
Steaven		tev		*** 	S***en		tev
*/
select  first_name, 
		substr(first_name, 2, 3), 
        replace(first_name, substr(first_name, 2, 3), '***'),	-- 이벤트 당첨자
        substr(first_name, 2, 3)
from employees;

-- ------------------------------------------------------------------------

/********************************
		   날짜 / 시간 함수 
********************************/ 
-- 단일함수 -> 날짜함수
select  current_date()			from dual;
select	curdate()				from dual;

select  current_time()			from dual;
select	curtime()				from dual;

select  current_timestamp()		from dual;
select	now()					from dual;

-- 날짜, 시간 더하기 빼기
select  '2021-06-20 00:00:00',
		adddate('2021-06-20 00:00:00', interval 1 year),			-- add 1 year 		22-06-20
        adddate('2021-06-20 00:00:00', interval 1 month),			-- add 1 month 		21-07-20
		adddate('2021-06-20 00:00:00', interval 1 week),			-- add 1 week		21-06-27
		adddate('2021-06-20 00:00:00', interval 1 day),				-- add 1 day		21-06-21
        
        adddate('2021-06-20 00:00:00', interval 1 hour),			-- add 1 hour		01:00:00
        adddate('2021-06-20 00:00:00', interval 1 minute),			-- add 1 minute		00:01:00
        adddate('2021-06-20 00:00:00', interval 90 second),			-- add 90 second	00:01:30
        
        -- 빼기
		subdate('2021-06-20 00:00:00', interval 1 year),			-- interval 1 year 		22-06-20
        subdate('2021-06-20 00:00:00', interval 1 month),			-- interval 1 month 		21-07-20
		subdate('2021-06-20 00:00:00', interval 1 week),			-- interval 1 week		21-06-27
		subdate('2021-06-20 00:00:00', interval 1 day),				-- interval 1 day		21-06-21
        
        subdate('2021-06-20 00:00:00', interval 1 hour),			-- interval 1 hour		01:00:00
        subdate('2021-06-20 00:00:00', interval 1 minute),			-- interval 1 minute	00:01:00
        subdate('2021-06-20 00:00:00', interval 90 second)			-- interval 90 second	00:01:30
from dual;

-- *datediff(): 두 날짜간 일 수 사이
select  datediff('2021-06-21', '2021-06-20')
from dual;

-- 수업 기간
select  datediff('2025-09-05', '2025-03-27')
from dual;

-- 만난 지 ㅎㅎ
select  datediff('2025-05-26', '2023-10-13')
from dual;

-- *timediff(): 두 시간 간 시간 차
select  timediff('2025-05-21 13:00:00', '2025-05-20 13:00:00')
from dual;

-- ---- use now()
select  first_name, hire_date,
		datediff(now(), hire_date)/365
from employees;

select  first_name, hire_date,
		concat(ceil(datediff(now(), hire_date)/365), '년차') 
from employees;

select  concat('만난 지 ', datediff(now(), '2023-10-13'), '일') 창민이랑
from dual;

-- ------------------------------------------------------------------------

/********************************
		단일행 함수 > 변환함수
********************************/ 
-- date_format()
select  now(),
		date_format(now(), '%Y-%m-%d %H:%i:%s'),			-- 기본값
        date_format(now(), '%y/%m/%d/%a , %h:%i:%S %p'),	-- 내맘대로
        date_format(now(), '%Y-%M-%d %H:%i:%s')				-- 대중픽
from dual;

-- 원래 문자열 > 날자형 > 계산 (자동변환)
select  datediff('2021-06-22', '2021-06-21')
from dual;

select	datediff('2021-Jun-22', '2021-06-21')
from dual;

select  str_to_date	('2021-Jun-22', '%Y-%b-%d'), 
		str_to_date	('2021-06-21', '%Y-%m-%d'),
        datediff(str_to_date ('2021-Jun-22', '%Y-%b-%d'), str_to_date ('2021-06-21', '%Y-%m-%d'))
from dual;


select  first_name, 
		date_format(hire_date, '%m.%d.%y') hire_date
from employees;

-- 숫자 > 문자열
-- FORMAT(숫자, p): 숫자에 콤마(,) 를 추가, 소수점 p자리까지 출력
select  format(123456,0),
		format(20231013.0592175,4) date,		-- 소수점 자릿수 반올림
        format(1234567.8543549,-5)				-- 소수점 자릿수 반올림 (-는 안됨)
from dual;


-- IFNULL(컬럼명, null일때값): 컬럼의 값이 null일때 정해진값을 출력
select  first_name, 
		commission_pct,
        ifnull(commission_pct, 0)
from employees;

select  first_name, 
		manager_id,
        ifnull(manager_id, '매니저 없음') '매니저 없음'
from employees;