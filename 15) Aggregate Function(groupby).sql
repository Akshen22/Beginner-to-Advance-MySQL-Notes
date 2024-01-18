select count(salary) from employees;
select sum(salary) from employees;
select avg(salary) from employees;
select min(salary) from employees;
select max(salary) from employees;

select count(distinct(Salary)) from employees;
select sum(distinct(Salary)) from employees;
select avg(distinct(Salary)) from employees;
-- min, max will be same as above

-- group by:
-- suppose you want avg salary of each department_id and you write:
use hr;
select department_id, avg(salary) from employees;
-- will get 1st department_id there in the list and avg salary which is wrong,
-- it should be:
select department_id, avg(salary) Avg_Salary from employees
where department_id is not null
group by department_id;

select month(hire_date), avg(salary) from employees
where month(hire_date) is not null
group by month(hire_date)
order by month(hire_date);

select*from employees;
select email, sum(salary) Sum_Salary  from employees
group by email
order by Sum_Salary desc;
