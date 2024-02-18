-- 주문이 단 한 헌도 없는 고객 정보 구하기

select *
from nw.customers a
	left outer join nw.orders b on a.customer_id = b.customer_id
where b.order_id is null;


-- 부서정보와 부서에 소속된 직원명 정보 구하기. 부서가 직원을 가지고 있지 않더라도 부서 정보 표시

select * from hr.emp;
select * from hr.dept;
select * from hr.emp_dept_hist;
select * from hr.emp_salary_hist;
select * from hr.salgrade;

select a.*, b.ename
from hr.dept a
	left join hr.emp b on a.deptno =b.deptno;
	
select * from nw.

-- Madrid에 살고 있는 고객이 주문한 주문 정보 구하기
-- 고객명, 주문id, 주문일자, 주문접수 직원명, 배송업체명을 구하되 주문을 한 번도 하지 않아도 고객정보가 기재되어야함. 이경우 주문 정보가 없으면 주문id를 0, 나머지는 null

select a.contact_name, coalesce(b.order_id, 0), b.order_date, c.first_name || ' ' || c.last_name as name, d.company_name
from nw.customers a
	left join nw.orders b on a.customer_id =b.customer_id
	left join nw.employees c on b.employee_id =c.employee_id
	left join nw.shippers d on b.ship_via = d.shipper_id
where a.city = 'Madrid';




select * from nw.orders;
select * from nw.employees;
select * from nw.suppliers s;
select* from nw.shippers s


-- orders_items에 주문번호(order_id)가 없는 order_id를 가진 orders 데이터 찾기

select *
from nw.orders a
	left join nw.order_items b on a.order_id = b.order_id
where b.order_id is null;

-- orders 테이블에 업는 order_id가 있는 order_items 데이터 찾기.

select *
from nw.order_items a
	left join nw.orders b on a.order_id = b.order_id 
where b.order_id is null;