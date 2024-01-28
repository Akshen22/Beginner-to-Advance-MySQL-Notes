use hr;

-- single row subquery:

-- display name of emp who gets more salary than emp id 163
select * from employees where salary>
(select salary from employees where employee_id =163);

-- display name, salary, jobid who works in same designation
-- as emp whose id is 169
select concat(first_name, '\n', last_name) full_name, salary, job_id from employees where job_id =
(select job_id from employees where employee_id = 169);

-- multiple row subquery:
-- display employee details whose id is any of the number 134, 159, 183
select*from employees where employee_id = any
(select employee_id from employees where employee_id in (134, 159, 183));

-- emp details who have salary more than all who joined in 1998
select * from employees where salary> all
(select salary from employees where year(hire_date) = 1998);

-- emp details where sales rep are earning more than 
-- any of the sales manager
select*from employees where job_id='SA_REP' and salary> any
(select salary from employees where job_id = ('SA_MAN'));

-- emp details who changes thrir jobs atleast once
select*from employees e where exists
(select employee_id from job_history j where e.employee_id = j.employee_id);

