select trunc(99.9999, 2);

select date_Trunc('day', '2022-03-03 14:05:32'::timestamp);

select date_trunc('day', to_date('2022-03-12', 'yyyy-mm-dd')) as date_01;

select date_trunc('day', '2024-02-29'::date)::date as date_02; -- ::date를 통한 명시적 변환

select date_trunc('month', '2024-02-29'::date)::date as date_03;

select date_trunc('week', '2024-02-29'::date)::date as date_04; -- week의 시작 날짜 월요일!

select (date_trunc('week', '2024-02-29'::date) +interval '6 days')::date as date_05; -주의 마지막 날짜 일요일

-- 일요일을 기준으로 하고 싶다면?
select date_trunc('week', '2024-02-29'::date)::date -1 as date_04;

select (date_trunc('week', '2024-02-29'::date) +interval '5 days')::date as date_05;


select now();
select date_trunc('hour', now());


drop table if exists hr.emp_test

create table hr.emp_test
as
select a.*, hiredate + current_time as hiretime
from hr.emp a;


select date_trunc('month', hiredate) from hr.emp_test
order by 1;

-- 입사월 그룹 바이
select date_trunc('month', hiredate) as hire_month, count(*)
from hr.emp_test
group by date_trunc('month', hiredate);

-- 시분초 절삭 그룹바이
select date_trunc('day', hiredate) as hire_day, count(*)
from hr.emp_test
group by date_trunc('day', hiredate);