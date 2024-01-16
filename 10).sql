use hr;

select*from employees;

update employees 
set salary = salary* 1.30 -- 30% increase, if written 0.30: it means 70% decrease
where round(datediff(current_date(), hire_date)/365)>2;

select datediff(current_date(), hire_date)/365 from employees;

-- Genrate monthly gross and annual gross for each employee who
-- are liable to commisiion pct
select first_name, 
salary+salary*commission_pct 'Montly Salary',
(salary+salary*commission_pct)*12 'Annual Salary' from employees
where commission_pct is not null;

-- lets see emp id, name, salary of the empwho has a reporting manager but not
-- a department
select employee_id,first_name,salary, manager_id, department_id
from employees
where manager_id is not null and department_id is null;

select employee_id, first_name, hire_date, job_id
from employees
where job_id like '%IT%'
or job_id like '%Clerk%' 
or job_id like '%Account%';

-- distinct gives us unique value from a particular attribute
select distinct job_id from employees where salary>1000;

-- emp details earning between 3000 to 7000, belong to clerk or it
select*from employees 
where (salary between 300 and 70000)
and 
(job_id like '%clerk%' or job_id like '%IT%');

