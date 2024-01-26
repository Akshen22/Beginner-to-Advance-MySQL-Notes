-- derived:
-- genrate list of top 10 customers who have done max payments to store
select*from customers c join 
(select customernumber from payments 
order by amount desc
limit 10) p
on c.customerNumber = p.customerNumber;

-- multilevel:
-- genrate list of product lines that are always ordered in bulk of more than
-- 50 no's
select productline from productlines where productline in
(select productline from products where productcode in
(select productcode from orderdetails where quantityOrdered>50));

-- first_value & last_value:
-- for every customer, get details of all orders placed by them 
-- and the date on which he/she had placed an order for first time
select c.customernumber, c.customerName, o.orderdate, 
first_value(orderdate) over(partition by customerNumber order by orderdate) first_val
from customers c join orders o
using(customernumber);

select c.customernumber, c.customerName, o.orderdate, 
last_value(orderdate) 
over(partition by customerNumber order by orderdate
range between unbounded preceding and unbounded following) last_val
from customers c join orders o
using(customernumber);

-- list all product details, along with recent order quantity 
-- for each products
select p.productCode, p.productName, o.orderNumber, quantityOrdered, orderDate, 
last_value(quantityordered) over(partition by p.productCode order by orderDate
range between unbounded preceding and unbounded following) recent_qty
from products p join orderdetails od
on p.productcode = od.productcode
join orders o
using(ordernumber);

-- lead & lag:
-- multilevel lead with windows function lead:
-- find freq of visits for each customer handled by emp
select*, datediff(next_sales, first_sale) frq_visit from
(select e.employeeNumber, e.firstname, c.customernumber, c.customername,
o.orderdate first_sale, lead(o.orderdate) over (partition by employeeNumber, customernumber
order by o.orderdate) next_sales
from employees e join customers c
on e.employeeNumber=c.salesRepEmployeeNumber
join orders o
on c.customernumber = o.customerNumber) temp;

-- list of customers along with dates on which they have made payments,
-- and the previous dates. filter out those who has made payments within 30 days.
select *, datediff(curr_date, prev_date) diff_days from
(select c.customername, c.customernumber, p.paymentdate curr_date,
lag(p.paymentdate) over(partition by c.customernumber order by paymentDate) prev_date
from customers c join payments p
using (customernumber)) pay
where datediff(curr_date, prev_date) <=30;

-- ntile:
-- find months which had good, average, low based on quantities ordered
select months, total_qty, 
case 
when cume_dist() over (order by total_qty)<=0.5 then'Low' 
when cume_dist() over (order by total_qty) = 0.5 then 'Avg'
when cume_dist() over (order by total_qty)>0.5 then'Good'
end as category from
(select month(orderdate) months, sum(quantityordered) total_qty
from orders o join orderdetails od
group by 1) tq; -- here we need to give values to divide

select*,ntile(3) over(order by cum_dist) as 'Impact_position' from
(select months, total_qty, 
round(cume_dist() over (order by total_qty),2) as cum_dist from
(select month(orderdate) months, sum(quantityordered) total_qty
from orders o join orderdetails od
group by 1) tq) tq2; -- here it gets divided automatically