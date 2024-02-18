-- 고객명 Antonio Moreno가 1997년에 주문한 주문 정보를 주문 아이디, 주문일자, 배송일자, 배송 주소를 고객 주소와 함께 구하기

select * from nw.customers a;
select * from nw.orders;

select a.customer_id, b.required_date, b.shipped_date, a.address 
from nw.customers a
	join nw.orders b on a.customer_id = b.customer_id
where a.contact_name = 'Antonio Moreno'
and b.order_date between to_date('19970101', 'yyyymmdd') and to_date('19971231', 'yyyymmdd');

-- Berlin에 살고 있는 고객이 주문한 주문 정보를 구할 것
-- 고객명, 주문id, 주문일자, 주문접수 직원명, 배송업체명
select * from nw.order_items oi;
select * from nw.orders a;
select * from nw.customers b;
select * from nw.employees c;
select * from nw.shippers s;




select a.contact_name, b.order_id, b.order_date, c.first_name ||' '|| c.last_name as "employee name", d.company_name 
from nw.customers a
	join nw.orders b on a.customer_id= b.customer_id
	join nw.employees c on b.employee_id  = c.employee_id
	join nw.shippers d on b.ship_via = d.shipper_id
where a.city = 'Berlin'


-- Beverages 카테고리에 속하는 모든 상품아이디와 상품명, 그리고 이들 상품을 제공하는 supplier 회사명 정보 구할 것

select * from nw.categories c;
select * from nw.products p;
select * from nw.suppliers s;

select a.category_name, b.product_id, b.product_name , c.company_name
from nw.categories a
	join nw.products b on a.category_id =b.category_id
	join nw.suppliers c on b.supplier_id =c.supplier_id
where a.category_name = 'Beverages'


-- 고객명 Antonio Moreno가 1997년에 주문한 주문 상품정보를 고객 주소, 주문 아이디, 주문일자, 배송 주소 및
-- 주문 상품아이디, 주문 상품명, 주문 상품별 금액, 주문 상품이 속한 카테고리명 ,supplier명을 구할 것

select * from nw.categories a;
select * from nw.customers b;
select * from nw.employees c;
select * from nw.order_items d;
select * from nw.orders e;
select * from nw.products f; -- product_id, p_name, s_id, c_id
select * from nw.shippers g;
select * from nw.suppliers h;

select b.contact_name, b.address, e.order_id, e.order_date, e.ship_address, f.product_id, f.product_name, f.unit_price, a.category_name, h.contact_name 
from nw.orders e
	join nw.customers b on e.customer_id = b.customer_id
	join nw.order_items d on e.order_id = d.order_id
	join nw.products f on f.product_id = d.product_id
	join nw.categories a on a.category_id  = f.category_id
	join nw.suppliers h on f.supplier_id  = h.supplier_id 
where b.contact_name ='Antonio Moreno' and e.order_date >= to_date('19970101', 'yyyymmdd') and e.order_date <= to_date('19971231', 'yyyymmdd');
