use classicmodels;

-- want to know top 5 and bottom 5 customers and details in terms of higher payments
-- and emp whom they referred too and tag customers as top & bottom customers
select c.customernumber, c.customername, e.firstname, amt, ranks,
case when ranks<=5 then 'Top Customers' else 'Bottom Customers' 
end tom  from employees e, customers c,
(select * from
(select *, rank()over(order by amt desc) ranks , count(*) over() counts
from
(select customernumber, sum(amount) amt
from payments
group by customernumber)t1)t2
where ranks<=5 or ranks>counts-5)t3
where c.salesrepemployeenumber = e.employeenumber
and c.customernumber=t3.customernumber;
 
-- figure out vendor and products with highest transaction amount
with t1 as
(select productvendor, p.productcode, productname, sum(quantityordered*priceeach) total_price
 from orders o, orderdetails od, products p
 where o.ordernumber = od.ordernumber and p.productcode = od.productcode
 group by 1,2,3)
 select*from t1 where total_price= (select max(total_price) from t1);
 
