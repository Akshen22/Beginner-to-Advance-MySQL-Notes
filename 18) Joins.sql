use hr;
select*from employees;
select*from departments;

select*from employees, departments;
-- here unecessary  values gets repeated which is wrong so instead do:

-- to get all the columns and rows properly, do:
-- 1) inner join:
-- method 1:
select * 
from employees emp join departments dep
on emp.department_id = dep.department_id;

-- method 2:
select * 
from employees emp inner join departments dep
on emp.department_id = dep.department_id
order by emp.employee_id;

-- join locations and departments
select*
from departments dep inner join locations loc -- tables need to join
on dep.location_id = loc.location_id; -- which columns can you/want to join

select dep.department_id, dep.department_name, loc.city
from departments dep join locations loc
on dep.location_id = loc.location_id
where dep.department_id between 60 and 100;

-- more than 2 tables:
select *
from employees emp join departments dep
on emp.department_id = dep.department_id
join locations loc
on dep.location_id = loc.location_id;

select e.employee_id, e.first_name, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where l.city ='Seattle'; 

 -- 2) outer join
 -- (1) left outer join:
 -- If A & B are there, takes A full even if null is there but not from B
 select*
 from employees e left join departments d
 on e.department_id = d.department_id
 order by e.employee_id;
 
select*from departments d left join employees e
on e.department_id = d.department_id
order by e.employee_id;

 -- 2) outer join
 -- (2) right outer join:
  -- If A & B are there, takes B full even if null is there but not from A
 select*from employees e right join departments d
 on e.department_id = d.department_id;
 
select*from departments d right join employees e
on e.department_id = d.department_id;

-- 2) outer join
 -- (3) full outer join:
select*from employees e left join departments d
on e.department_id = d.department_id
union
select*from employees e right join departments d
on e.department_id = d.department_id;

-- 3) Self join:
select*from employees;

select e1.employee_id, e1.first_name, e1.manager_id, e2.first_name manager_name
from employees e1 join employees e2
on e1.manager_id = e2.employee_id;





