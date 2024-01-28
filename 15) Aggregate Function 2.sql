use hr;
select*from employees;
select first_name, avg(salary) Avg_Salary, sum(salary) Sum_of_Salary
from employees
group by first_name
order by Avg_Salary, Sum_of_Salary;

SELECT * FROM employees;
SELECT first_name, AVG(salary) AS Avg_Salary, SUM(salary) AS Sum_of_Salary
FROM employees
GROUP BY first_name
HAVING AVG(salary) > 4000
ORDER BY Avg_Salary, Sum_of_Salary;

select job_id, month(hire_date), sum(salary)>4000 from employees
group by job_id, month(hire_date)
order by sum(salary)>4000 desc;

-- here we can take salary in group by as its not agg function
select salary, sum(salary) from employees
group by salary;

select department_id, avg(salary) Avg_Salary from employees
where department_id is not null
group by department_id
having avg(salary)>4000; 

select * from employees;

select first_name, last_name, email, sum(salary)
from employees
where first_name='Lex'
group by first_name, last_name, email
having sum(salary)
order by first_name
limit 5;

(select first_name, year(curdate())-year(hire_date) tenure from employees
order by tenure desc limit 2)
union
(select first_name, year(curdate())-year(hire_date) tenure from employees
order by tenure limit 3);

(select hire_date from employees
order by hire_date desc limit 1)
union
(select hire_date from employees
order by hire_date asc limit 1);

select min(hire_date) first_hire_date, max(hire_date) recent_hire_date from employees;

(select hire_date from employees
order by hire_date desc limit 1,1) -- (limit 1,1): second record, 1 time
union
(select hire_date from employees
order by hire_date limit 1,1); -- (limit 1,1): second record, 1 time

(select hire_date from employees
order by hire_date desc limit 1 offset 1)
union
(select hire_date from employees
order by hire_date limit 1 offset 1);

-- replace null with 0:
-- 1) if null handle max 2 attribute at 1 time
select ifnull (commission_pct,0) commission_pct from employees;

-- 2) COALESCE handle n no. of attributes at 1 time
SELECT COALESCE(commission_pct, 0) AS commission_pct FROM employees;

-- 3) if:
select if(commission_pct is null, 0, commission_pct) from employees;

-- 4) case:
select case when commission_pct is null then 0
else commission_pct
end commission_pct
from employees;
