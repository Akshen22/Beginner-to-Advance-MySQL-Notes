use hr;

-- in
select*from employees where department_id in
(select department_id from departments);

-- any
select*from employees where salary>any
(select avg(salary) from employees);

-- all
select*from employees where salary>all
(select avg(salary) from employees);

-- exists
select * from departments d where exists
(select department_id from employees e
where e.department_id=d.department_id);