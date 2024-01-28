use classicmodels;
show tables;
select*from employees;

-- retail store manager wants to release some offers for products that were
-- not sold even once to the customer(products & orderdetails)
select*from products;
select*from orderdetails;
select p.productCode, productName, orderNumber
from products p left join orderdetails o
on o.productCode = p.productCode
where orderNumber is null;

-- companies is planning on releasing offers to convert inactive into active customers
-- genrate such customers list (customers, orders)
select c.customerNumber, c.customerName, o.orderNumber
from customers c left join orders o
on c.customerNumber = o.customerNumber
where o.orderNumber is null;

 -- genrate a report with all customers id,names, lifetime sales
 -- (customers and payments)
 select c.customerNumber, c.customerName, sum(amount) lifetime_sale_ampunt
 from customers c join payments p
 on c.customerNumber = p.customerNumber
 group by c.customerNumber, c.customerName
 order by lifetime_sale_ampunt desc;
 
 -- list the products that have been ordered and cancelled 
 -- also count how many times the product has been cancelled
 select p.productcode, p.productname, count(status) count_of_cancel
 from products p join orderdetails od
 on p.productcode = od.productcode
 join orders o
 on od.ordernumber = o.ordernumber
 where status like '%Cancelled%'
 group by p.productcode, p.productname
 order by count(status) desc; 
 -- here we cant use count(status) in having as it comes under string
 -- so do it in where clause
 
 select c.customernumber, c.customername, count(*) total_counts, 
 p.productName, sum(quantityOrdered) sum_qty, max(creditlimit) credit_limit
 from customers c join orders o
 using (customernumber)
 join orderdetails od
 using (ordernumber)
 join products p
 using (productcode)
 where customernumber in (187, 141, 124,119,114)
 group by c.customernumber, c.customername, c.creditlimit, p.productName
 having total_counts>50
 order by total_counts desc;
 
 
