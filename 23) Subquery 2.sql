use hr;

-- single row query:
select*from employees where department_id in
(select department_id from departments where department_name='Human Resources');

-- multiple row query:
select*from employees 
where department_id in
(select department_id from departments where department_name in ('Human Resources', 'Marketing'));

select*from employees where salary>
(select avg(salary) from employees);

-- correlated subquery:
SELECT * FROM employees e1 WHERE EXISTS 
(SELECT AVG(salary) FROM employees e2 
WHERE e2.department_id = e1.department_id) 
AND e1.salary > (SELECT AVG(salary) FROM employees e3 WHERE e3.department_id = e1.department_id);

 -- nested sub query:
 select * from employees where department_id in
 (select department_id from departments where location_id in
 (select location_id from locations where city = 'South San Francisco'));
 
 select first_name, salary, department_name, city 
 from employees e join departments d 
 on e.department_id = d.department_id
 join locations l
 on d.location_id = l.location_id
 where e.department_id in
 (select department_id from departments where d.location_id in
 (select location_id from locations where city = 'South San Francisco')); 