#### ============================================================ PART 2 ================================================================================

# What is the average amount that employees were getting paid for each job designation?
# order the designations based on their average salaries

/*
Pre-requisite - Videos on aggregation functions and group-by-clause concepts videos, Date functions, 
and other clauses covered in Week 1 and week 2.
*/

# Display designation-wise average salary arrange in higher to lower.

select job_id, avg(salary) avg_salary
from employees
group by 1
order by avg_salary desc ;


# Write a query to find the total number of employees joined in each year and show it year wise
select year(hire_date),count(*) from employees
group by year(hire_date)
order by 1 asc;


# Let's write a query to find the manager and the salary of the lowest-paid and highest-paid employees who have a manager.

SELECT manager_id, MIN(salary) Min_salary, MAX(salary) max_salary
FROM employees
where manager_id is not null
GROUP BY manager_id
ORDER BY MIN(salary) DESC;


# Show the Countries that have 2 to 4 cities

select country_id,count(city) counts_city from locations
group by 1
having counts_city between 2 and 4;


/*
Write a query to tag the departments based on the strength of the department.

# Use the following the conditions
The number of employees is 1:  "Junior department“,
 2 or 3: "Intermediate department“  
above 3:  "Senior Department“.
*/

SELECT department_id AS "Department", COUNT(*) AS "No. Of Employees",
  CASE 
  WHEN count(*)=1 THEN "Junior Department"
 WHEN count(*)<=3 THEN "Intermediate Department"
 WHEN count(*)>3 THEN "Senior Department"
 END AS Level
 FROM employees
 GROUP BY Department_id;
 
## Let's say We are working in the Great Lakes company as an assistant business analyst, and your manager asked you this, Filter out the departments and their jobs that their employee's average salary is greater than 10000.

select department_id,job_id, avg(salary) avg_salary 
from employees
group by 1,2
having avg_salary>10000;

# Extract the jobs where at least 20 employees have been worked.

Select job_id,count(*) emp_counts 
from employees
group by 1
having emp_counts >=20;


## Calculate the average commission pct and average salary, employees' strength for the jobs which belong to the department that can get commission along with salary.
# There is a way to solve this problem with one query using sub-queries that will be covered in later weeks, as of now we will solve this using two queries.

# Let's find the department id which has the advantage of getting commission along with salary.

select distinct department_id from 
employees
where commission_pct is not null;

# As we can see the query returned department id is 80. Let's see the name of the department id 80

select * from departments
where department_id = 80;

# As we can see in the above query output the department name is sales. This makes sense aswell.

# Now let's complete the problem.

select department_id,job_id,avg(commission_pct) avg_commision,avg(salary) avg_salary,count(*) Emp_strength
from employees
where department_id= 80
group by 1,2;

#  Write your key to segregate the designations into Higher_range_salary_des 1 and 2 for the designation that the average salary of employees is 4000, order the output based on the job ids.
# Use the following range to segregate: if the average salary is more than or equal to 8000 then Higher_range_salary_des 1 else Higher_range_salary_des 2

select job_id, 
case 
when avg(salary) >= 8000 
	then "Higher_range_salary_des 1"
when avg(salary) < 8000
	then "Higher_range_salary_des 2"
end "salary_category"
from employees
group by 1
having avg(salary)>4000
order by job_id;

# or use below query

select job_id, 
case 
when avg(salary) >= 8000 
	then "Higher_range_salary_des 1"
else "Higher_range_salary_des 2"
end "salary_category"
from employees
group by 1
having avg(salary)>4000
order by job_id;

# Ask students solve this using if conditions and solve this solutions

select job_id, if(avg(salary)>=8000,"Higher_range_salary_des 1","Higher_range_salary_des 2") "salary_category"
from employees
group by 1
having avg(salary)>4000
order by job_id;
