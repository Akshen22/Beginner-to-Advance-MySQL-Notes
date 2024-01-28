-- Easy steps to solve without getting disturb:
-- 1) See which all columns you should join and which join to apply
-- 2) Later do select stuffs properly
-- 3) And their conditions if any like where

use hr;

show tables;

select*from employees;
select*from departments;
select*from locations;

-- Display employees name and the city in which he/she is working
select concat(e.first_name, '\n', e.last_name) full_name, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;
-- we r getting 106 instead of 107 because 1 does'nt have city, 
-- inner joins/joins will take only the common values,
-- to verify do:
-- left outer ya right outer joins ya full joins:
select concat(e.first_name, '\n', e.last_name) full_name, l.city
from employees e left join departments d
on e.department_id = d.department_id
left join locations l
on d.location_id = l.location_id;
-- Kimberely Grant does not have city so he was removed from the table

-- Display dep name, job_id, emp last name & 
-- starting date for all jobs from 1990 to 1995
select d.department_name, e.job_id, e.last_name, e.hire_date
from employees e join departments d
on e.department_id = d.department_id
where year(e.hire_date) between 1990 and 1995
order by e.hire_date;

-- Display dep_name, manager_name, salary of manager for all managers
-- whose exp is more than 27 years;
select d.department_name, e.first_name, e.salary, 
round(datediff(current_date(),e.hire_date)/365) year
from departments d join  employees e 
on d.manager_id = e.employee_id
where round(datediff(current_date(),e.hire_date)/365)>=28
order by year;

-- Display emp who contain a letter z to their first_name, also there last name,
-- dep, city, state province
select e.first_name, e.last_name, d.department_name, 
l.city, l.state_province
from employees e join departments d
on e.department_id = d.department_id 
join locations l
on d.location_id = l.location_id
where e.first_name like '%z%';

select e.first_name, e.last_name, d.department_name, 
l.city, l.state_province
from employees e join departments d
using(department_id) 
join locations l
using (location_id)
where e.first_name like '%z%';

-- Display first, last_name, salary for those emp who earns less than
-- emp earn whose emp_id is 191 (self joins) (non equi joins)
select e1.first_name, e1.last_name, e1.salary
from employees e1 join employees e2
on e1.salary < e2.salary and e2.employee_id=191;

-- Display name of all emp along with name of their manager
select e1.first_name, e2.first_name manager_name
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;

-- Display emp name if emp joined before his manager
select e1.first_name
from employees e1 join employees e2
on e1.manager_id=e2.employee_id
where e1.hire_date<e2.hire_date;

-- Display details of manager who manages more than 5 emp
select e2.first_name, count(*)
from employees e1 join employees e2
on e1.manager_id=e2.employee_id
group by e2.first_name
having count(*)>5;
