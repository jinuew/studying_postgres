select to_date('2022-01-01', 'yyyy-mm-dd') - 2 as date_01;
select to_date('2022-01-01', 'yyyy-mm-dd') * 10 -- 곱하기는 에러

-- Timestamp 연산. + 7을 하면 오류 발생, interval 타입을 이용하여 연산 수행

select to_timestamp('2022-01-01', 'yyyy-mm-dd') + 7;
select to_timestamp('2022-01-01', 'yyyy-mm-dd') + interval '7 days' as timestamp_01;

select to_timestamp('2022-01-01', 'yyyy-mm-dd') + interval '10 years, 5 days' as timestamp_02;

-- Date 타입에 interval을 더하면 Timestamp로 변환됨

select to_date('2022-01-01 11:11:11', 'yyyy-mm-dd hh24:mi:ss') + interval '10 years' as date_02;
select to_date('2022-01-01 11:11:11', 'yyyy-mm-dd hh24:mi:ss') + interval '2' day as date_03;

select to_date('2022-01-01 11:11:11', 'yyyy-mm-dd hh24:mi:ss') - to_date('2019-03-01 11:11:11', 'yyyy-mm-dd hh24:mi:ss') as interval
	, pg_typeof(to_date('2022-01-01 11:11:11', 'yyyy-mm-dd hh24:mi:ss') - to_date('2019-03-01 11:11:11', 'yyyy-mm-dd hh24:mi:ss')) as interval2;


-- Timestamp간의 차이 구하기. 차이값은 interval
select to_timestamp('2023-02-21 11:11:11', 'yyyy-mm-dd hh24:mi:ss')
	-to_timestamp('2023-01-01 10:10:10', 'yyyy-mm-dd hh24:mi:ss') as interval
	,pg_typeof(to_timestamp('2023-02-21 11:11:11', 'yyyy-mm-dd hh24:mi:ss')
	-to_timestamp('2023-01-01 10:10:10', 'yyyy-mm-dd hh24:mi:ss')) as type
	
	
with
temp_01 as (
select empno, ename, hiredate, now(), current_timestamp, current_date, current_time 
	,date_trunc('second', now()) as now_trun
	,now() - hiredate as 근속기간
from hr.emp
)
select * from temp_01;



with
temp_01 as (
select empno, ename, hiredate, now(), current_timestamp, current_date, current_time 
	,date_trunc('second', now()) as now_trun
	,now() - hiredate as 근속기간
from hr.emp
)
select *
	,date_part('year', 근속기간)
	,justify_interval(근속기간)
	,age(hiredate)
	,date_part('year', justify_interval(근속기간))||'년 '||date_part('month', justify_interval(근속기간)) ||'월' as 근속년월
	,date_part('year', age(hiredate)) || '년 ' || date_part('month', age(hiredate)) || '월' as 근속년월_01
from temp_01;

-- now(), current_timestamp, current_date, current_time
-- interval을 년, 월, 일로 표시하기. justify_interval와 age 사용 차이

with
temp_01 as (
select empno, ename, hiredate, now(), current_timestamp, current_date, current_time 
	,date_trunc('second', now()) as now_trun
	,now() - hiredate as 근속기간
from hr.emp
)
select empno, ename, hiredate, now() - hiredate as 근속기간
	, date_part('year', 근속기간)
	,justify_interval(근속기간)
	,age(hiredate)
	,date_part('year', justify_interval(근속기간))
	,date_part('year', justify_interval(근속기간)) || '년 ' || date_part('month', justify_interval(근속기간)) || '월' as 근속년월
	,date_part('year', age(hiredate)) || '년 ' || date_part('month', age(hiredate)) || '월 ' as 근속년월_01
from temp_01;