-- 1) distinct helps to delete duplicate rows
select distinct first_name from employees;

select distinct department_id, first_name from employees
order by department_id;

select distinct first_name, job_id from employees
union
select distinct '', job_id from jobs
order by first_name, job_id asc;

-- 2) Operator Precedence

select * from employees where salary > 7800 and first_name like 'S%' or first_name like 'A%';
-- here, we are not getting proper records as we also get salary less than 7800 which we don't want. So do: ()

select * from employees where salary > 7800 and (first_name like 'S%' or first_name like 'A%');
