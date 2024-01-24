use hr;

-- rank, dense_rank, row_number, percent_rank
select employee_id, first_name, 
rank() over(order by salary desc) as ranking,
dense_rank() over(order by salary desc) as denseranking,
row_number() over(order by salary desc) as rownumber
from employees;

select employee_id, first_name, department_id,
rank() over(partition by department_id order by salary desc) as ranking, -- repeats and skips
dense_rank() over(partition by department_id order by salary desc) as denseranking, -- repeats
row_number() over(partition by department_id order by salary desc) as rownumber, -- proper linewise
percent_rank() over(partition by department_id order by salary desc) as percentrank -- percentage rank from 0 to 1
from employees;

-- lead, lag, first_value, last_value
select employee_id, first_name, department_id,
lead(employee_id) over(partition by department_id order by salary desc) as lead_by, -- next value
lag(employee_id) over(partition by department_id order by salary desc) as lag_by, -- before_value
first_value(employee_id) over(partition by department_id order by salary desc) as firstvalue_by, -- next value
last_value(employee_id) over(partition by department_id order by salary desc range between unbounded preceding and unbounded following) as lastvalue_by -- before_value
from employees;
                              
-- ntile,cum_dist
select employee_id, ntile(10) over(order by employee_id) from employees; 
-- divides rows equally according to the value we give inside ntile

select employee_id, cume_dist() over(order by employee_id) from employees; 
-- add current rows/total and moves till we get 1 starting from 0

-- avg(), min(), max(), sum(), count()
select employee_id, first_name, department_id, salary, 
avg(salary) over(partition by department_id) from employees;

select employee_id, first_name, department_id, salary, 
min(salary) over(partition by department_id) from employees;

select employee_id, first_name, department_id, salary, 
max(salary) over(partition by department_id) from employees;

select employee_id, first_name, department_id, salary, 
sum(salary) over(partition by department_id) from employees;

select employee_id, first_name, department_id, salary, 
count(salary) over(partition by department_id) from employees;

