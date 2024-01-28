use hr;
select job_id job, count(job_id), avg(salary) as average from employees
group by job
order by average desc;

select count(first_name), year(hire_date) from employees
group by year(hire_date)
order by year(hire_date);

select count(first_name), year(hire_date) from employees
group by 2
order by 2;

select manager_id, count(manager_id), min(salary), max(salary) from employees
where manager_id is not null
group by manager_id
order by min(salary), max(salary);

select country_id, count(city) cities from locations
group by country_id
having cities between 2 and 4;

select department_id, count(employee_id),
case 
when count(employee_id) =1 then 'Junior_department'
when count(employee_id) between 2 and 3 then 'Intermediate_department'
when count(employee_id) > 3 then 'Senior_department'
end dept_tag
from employees
where department_id is not null
group by department_id
order by count(employee_id);

select department_id, job_id, avg(salary) Avg_Salary from employees
group by department_id, job_id
having Avg_Salary > 5000;

select job_id, count(employee_id) from employees
group by job_id
having count(employee_id)>20;

-- calculate avg commission_pct, avg salary, employees strength for the jobs 
-- which belong to the dep that can get commission along wit salary.
select distinct department_id, avg(commission_pct), avg(salary), count(employee_id), job_id 
from employees
where department_id is not null
group by job_id, department_id
having avg(commission_pct) is not null and avg(salary) is not null;

-- method 1:
select job_id, avg(salary), employee_id, 
case
when avg(salary) >= 4000 then 'des_1'
when avg(salary) < 4000 then 'des_2'
end Avg_Salary
from employees
group by job_id, employee_id
having avg(salary)>2000
order by job_id, avg(salary) desc;

-- method 2:
select job_id, avg(salary), employee_id, 
if (avg(salary)>=4000, 'des1', 'des2')
Avg_Salary
from employees
group by job_id, employee_id
having avg(salary)>2000
order by job_id, avg(salary) desc;
