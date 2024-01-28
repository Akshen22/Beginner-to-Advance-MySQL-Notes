use hr;

-- single raw:

-- Display first and last name, salary and dept_id of those employees who earns
-- less than avg of organization and work for laura's dep:
select first_name, last_name, salary, department_id from employees 
where salary<(select avg(salary) from employees) 
and department_id=(select department_id from employees where first_name='Laura');

-- Emp_id, name, salary, dep_name, city 
-- whose salary is equal to highest salary of emp who joined in 1998
select employee_id, concat(first_name,'\n', last_name) full_name, salary, department_name, city, salary
from employees e join departments d
using(department_id)
join locations
using(location_id) where salary=
(select max(salary) from employees where year(hire_date)=1998);

-- Display name & department_id of all dep that has at least 1 emp with a salary
-- greater than 5000
select distinct d.department_name, d.department_id, e.salary 
from departments d join employees e 
using(department_id)
where exists
(select 1 from employees e2 where e2.department_id=d.department_id
and e2.salary>7000)
and e.salary > 7000;

-- multiple row
-- retail stores wants to release some offers to products was not sold even once
-- to any customers
use classicmodels;

show tables;

select*from products where productcode not in
(select distinct productcode from orderdetails);

-- company is planning on releasing offers to convert inactive customers.
-- genrate such customers list
select*from customers where customernumber not in
(select distinct customernumber from orders);

-- genrate list of emp who had assisted customers to place 
-- orders that were shipped within a span of 1 day of order getting place 
select*from employees 
where employeenumber in
(select salesRepEmployeeNumber from customers 
where customernumber in
(select customernumber from orders where datediff(shippeddate, orderdate)=1));

