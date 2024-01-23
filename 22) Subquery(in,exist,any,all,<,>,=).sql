-- in, exists, any, all: multi row operators
-- <,>,=: single row operator

use hr;

-- in:
select*from employees;
select*from departments;

-- employee having there dep:
select * from employees where department_id in
(select department_id from departments);

select distinct(department_id) from employees where department_id in
(select department_id from departments);

-- only those department_id in which employees are present:
select * from departments where department_id in
(select department_id from employees);

-- not in:
select * from departments where department_id not in
(select department_id from employees);
-- but if you see its misleading us as there are departments where there's no employee
-- so for this will do correlated subquery

-- correlated subquery:
SELECT e1.first_name, e1.salary, e1.department_id, AVG(e2.salary) avg_salary
FROM employees e1 JOIN employees e2 
ON e1.department_id = e2.department_id
GROUP BY e1.first_name, e1.salary, e1.department_id; -- (joins)

select * from employees where salary>
(select avg(salary) from employees); -- Here we do get avg_salary but not dept wise

select avg(salary) from employees;

select * from employees em where salary>
(select avg(salary) from employees es
where es.department_id = em.department_id); -- Here we do get salary dept wise

select avg(salary) from employees es
where es.department_id=60;

-- exists (not in, wasn't working above, here's the solution):
select * from departments d where exists
(select department_id from employees e
where e.department_id=d.department_id);

select * from departments d where not exists
(select department_id from employees e
where e.department_id=d.department_id);

-- sub query with aggregate:
select department_id, avg(salary) from employees
group by department_id
having avg(salary)>=(select avg(salary) from employees where department_id=70)
order by avg(salary) desc;

-- subquery with joins:
select e.department_id, avg(salary)
from employees e join departments d
on e.department_id = d.department_id
group by e.department_id
having avg(salary)>=(select avg(salary) from employees where e.department_id>=70);

select*from employees where department_id in
(select department_id from departments where department_name='Human Resources');

select e.*, d.department_name
from employees e join departments d 
on e.department_id = d.department_id
where e.department_id in
(select department_id from departments where department_name='Human Resources');

-- Find emp name from marketing department

-- joins:
select * from employees e join departments d
on e.department_id = d.department_id
where department_name= 'Marketing';

-- subquery:
-- 1)  single raw subquery
select first_name from employees where department_id =
(select department_id from departments where department_name = 'Marketing');

-- 2) Multiple row subquery
select * from employees where department_id in
(select department_id from departments where department_name in ('Marketing', 'Human Resources'));
