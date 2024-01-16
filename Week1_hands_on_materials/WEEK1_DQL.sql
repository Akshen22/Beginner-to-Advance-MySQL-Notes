
# Pre-requisite for DQL (Select command videos) and missing values video

# Generate the monthly gross and Annual Gross for each employee who are liable to commission pct.

SELECT first_name, last_name,
(salary + salary * commission_pct) AS "monthly_gross", (salary + salary * commission_pct)*12 "Annual gross"
FROM Employees
where commission_pct is not null;

## Let's see the employee ID, name, and salary of the employee who has a reporting manager but not a department.


select employee_id,first_name,last_name,salary 
from employees
where (manager_id is not null and department_id is null);

## Let's get the employee's ID, name, and hire date who are designated as IT, Clerk, and accountant

## Let's solve the above problem in various ways

# Way 1:

select Employee_id,First_name,Last_name, hire_date,job_id
from employees
where job_id = 'IT_PROG' OR JOB_id = 'ST_CLERK'
OR JOB_id = 'PU_CLERK' OR JOB_id = 'SH_CLERK' OR JOB_ID = 'FI_ACCOUNT' OR JOB_ID = 'AC_ACCOUNT';

# WAY 2:

select Employee_id,First_name,Last_name, hire_date,job_id
from employees
where job_id IN( 'IT_PROG','ST_CLERK','PU_CLERK','SH_CLERK','FI_ACCOUNT','AC_ACCOUNT');


# WAY 3: SINCE IN THE QUESTION,  GIVEN ONLY SHORT FORMS LIKE IT, CLERK, AND ACCOUNTANT WE CAN USE LIKE OPERATORS SUCH THIS CASES.

select Employee_id,First_name,Last_name, hire_date,job_id
from employees
where job_id LIKE '%IT%' OR JOB_ID LIKE '%CLERK%' OR JOB_ID LIKE '%ACCOUNT%';

# LET'S display the employee's job id's who are getting more than 10000


# Pre-requisite is a video on duplicates.

SELECT distinct job_id FROM EMPLOYEES
where salary> 10000;


## Let's see the employee's details earning 3000 to 7000 and belonging to CLERK or IT jobs.

select * from
employees
where (salary between 3000 and 7000) and (job_id LIKE '%CLERK%' OR JOB_ID LIKE '%IT%');



