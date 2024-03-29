drop table if exists hr.emp_test;

create table hr.emp_test
as
select * from hr.emp;

select * from hr.emp_test;
-- 소속 부서를 null로 업데이트
update hr.emp_test set deptno = null where empno = 7934;

select * from hr.emp_test;

-- dept를 기준으로 레트프 outer 조인시에는 소속직원이 없는 부서는 추출되지만, 소속 부서가 없는 직원은 추출할 수 없음
select a.*, b.empno, b.ename
from hr.dept a
	left join hr.emp_test b on a.deptno = b.deptno;


-- full outer join하여 양쪽 모두의 집합이 누락되지 않도록 함
select a.*, b.empno, b.ename
from hr.dept a
	full outer join hr.emp_test b on a.deptno = b.deptno;

