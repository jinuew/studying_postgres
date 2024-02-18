select * from hr.salgrade;
select * from hr.emp;
-- 직원 정보와 급여 등급 정보를 추출.
select a.*, b.grade as salgrade, b.losal, b.hisal
from hr.emp a
	join hr.salgrade b on a.sal between b.losal and b.hisal; 
	

-- 직원 급여의 이력 정보를 나타내며, 해당 급여를 가졌던 시점에서의 부서번호도 함께 가져올 것.

select * 
from hr.emp_salary_hist a
	join hr.emp_dept_hist b on a.empno = b.empno and a.fromdate between b.fromdate and b.todate;

select a.*
from hr.emp_salary_hist a where empno=7369;

select * from hr.emp_salary_hist;
select * from hr.emp_dept_hist;
select * from hr.dept;
select * from hr.emp;

-- cross 조인

with
temp_01 as (
select 1 as rnum
union all
select 2 as rnum
)
select a.*, b.*
from hr.dept a
	cross join temp_01 b
where rnum =1;

with
temp_01 as (
select 1 as rnum
union all
select 2 as rnum
)
select * from temp_01;




with
temp_01 as (
select * from hr.emp where deptno = 30
),
temp_02 as (
select * from hr.dept where deptno = 30
)
select a.*, b.dname, b.loc from temp_01 a
	join temp_02 b on a.deptno = b.deptno;