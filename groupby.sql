
select deptno, max(sal) as max_sal, min(sal) as min_sal, round(avg(sal), 2) as avg_sal
from hr.emp
group by deptno
;

-- 부서별 최대 급여, 최소 급여, 평균 급여를 구하되 평균 급여가 2000 이상인 경우만 추출
select deptno, max(sal) as max_sal, min(sal) as min_sal, round(avg(sal), 2) as avg_sal
from hr.emp
group by deptno
having avg(sal) >= 2000

-- with 절을 사용하여! 위랑 같음
with
temp_01 as (
select deptno, max(sal) as max_sal, min(sal) as min_sal, round(avg(sal), 2) as avg_sal
from hr.emp
group by deptno
)
select * from temp_01 where avg_sal >= 2000;

-- 부서명 sales와 research 소속 직원별로 과거부터 현재까지 모든 급여를 취합한 평균 급여

select b.empno, max(ename), avg(c.sal) as avg_sal
from hr.dept a
	join hr.emp b on a.deptno = b.deptno
	join hr.emp_salary_hist c on b.empno = c.empno
where a.dname in ('SALES', 'RESEARCH')
group by b.empno;

--부서명 sales와 research 부서별 평균 급여를 소속 직원들의 과거부터 현재까지 모든 급여를 취합하여 구할 것.
select a.deptno, max(a.dname) as dname, avg(c.sal) as avg_sal, count(*) as cnt
from hr.dept a
	join hr.emp b on a.deptno = b.deptno 
	join hr.emp_salary_hist c on b.empno = c.empno
where a.dname in('SALES', 'RESEARCH')
group by a.deptno
order by 1;

-- with절로
with
temp_01 as
(
select a.deptno, a.dname, b.empno, b.ename, b.job, c.fromdate, c.todate, c.sal
from hr.dept a
	join hr.emp b on a.deptno = b.deptno
	join hr.emp_salary_hist c on b.empno = c.empno
where a.dname in('SALES', 'RESEARCH')
order by a.dname, b.empno, c.fromdate
)
select deptno, max(dname) as dname, avg(sal) as avg_sal
from temp_01
group by deptno
order by 1;


-- 집계 함수의 이해

drop table if exists hr.emp_test;

create table hr.emp_test
as
select * from hr.emp;

insert into hr.emp_test select 8000, 'CHMIN', 'ANALYST', 7839, TO_DATE('19810101', 'YYYYMMDD'), 3000, 1000, 20
;

select * from hr.emp_test;

-- Aggregation은 Null 값을 처리하지 않음.
select deptno, count(*) as cnt
	, sum(comm), max(comm), min(comm), avg(comm)
from hr.emp_test
group by deptno;

select mgr, count(*), sum(comm)
from hr.emp
group by mgr;

-- ㅡmax, min 함수는 숫자열 뿐만 아니라, 문자열, 날짜/시간 타입에도 적용가능.
select deptno, max(job), min(ename), max(hiredate), min(hiredate)
from hr.emp
group by deptno;

-- count(distinct 칼럼명)은 지정된 컬럼명르로 중복을 제거한 고유한 건수를 추출
select count(distinct job) from hr.emp_test;

select * from hr.emp_test;

select count(*) from hr.emp_test;

select deptno, count(*) as cnt, count(distinct job) from hr.emp_test group by deptno;