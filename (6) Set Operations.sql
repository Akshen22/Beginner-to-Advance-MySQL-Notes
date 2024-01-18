use hr;

show tables;

-- union all lists duplicate values as well
select job_id from employees
union all
select job_id from jobs;

-- union lists all the values, once
select job_id from employees
union 
select job_id from jobs;

-- here will get first name in asc order and job_id's,
-- just give a " " in between if you want a particular row and is not ther in another table 
select first_name,job_id from employees
union all
select " ", job_id from jobs
order by first_name; 
