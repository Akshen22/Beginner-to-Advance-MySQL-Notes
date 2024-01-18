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