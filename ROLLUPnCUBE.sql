select deptno, job, sum(sal)
from hr.emp
group by rollup(deptno, job)
order by 1,2;

select c.category_name, b.product_name, sum(amount)
from nw.order_items a
	join nw.products b on a.product_id = b.product_id
	join nw.categories c on b.category_id =c.category_id
group by rollup(c.category_name, b.product_name)
order by 1, 2;

select to_char(b.order_date, 'yyyy') as year
	, to_char(b.order_date, 'mm') as month
	, to_char(b.order_date, 'dd') as day
	, sum(a.amount) as sum_amount
from nw.order_items a
	join nw.orders b on a.order_id = b.order_id
group by rollup(to_char(b.order_date, 'yyyy'), to_char(b.order_date, 'mm'), to_char(b.order_date, 'dd'))
order by 1,2,3;


-- CUBE

select deptno, job, sum(sal)
from hr.emp
group by cube(deptno, job)
order by 1,2;