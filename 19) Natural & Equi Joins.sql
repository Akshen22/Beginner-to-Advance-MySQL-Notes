use hr;

select*from employees;
select*from departments;

-- 1) Natural join: Takes the common column first
select * from employees natural join departments;
-- i) all the common column should have unique values
-- ii) chances are high of retrieving too many rows without meaningful relationships
-- because of duplicate values in joining key
-- iii) cannot handle null values

-- 3 or more tables:
select * from employees natural join jobs natural join departments;

-- equi joins:
select e.first_name, e.last_name, e.department_id, d.department_name 
from employees e join departments d
on e.department_id = d.department_id;

-- non equi joins:
select e.first_name, e.last_name, e.department_id, e.salary, d.department_name 
from employees e join departments d
where e.salary>2000 and d.department_name not like '%Marketing%';
