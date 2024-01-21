use hr;

#========================================================= PART 1: ===============================================================================

## Pre-requisite - Video on number function

### FUNCTIONS

# Numerical fucntions: "Basic demonstration examples"

# Let's see the few numerical functions used for decimal points:
select floor(13.8233) as 'floor',ceil(13.8233) 'ceiling',
format(13.8233,1) as 'format', truncate(13.8233,1) 'truncate',round(13.8233,1) 'round',greatest(1,2,3) 'greatest',least(1,2,3) 'least';

# Let's also see the mathematical related functions.

select log(11) 'log',log10(11) 'log10',mod(11,2) 'mod',abs(-11) 'absolute_value',sqrt(11) 'sqrt_value',power(11,2) 'power' ;


# Pre-requisite - video on Strings


## String functions:Basic Demonstration examples:

# Let's start with the basic functions right and left functions
# Extract the business using the left function and analyst using the right function from Business Analyst

SELECT LEFT('Business Analyst', 8) "Extracting_from_left",RIGHT('Business Analyst', 7) "Extracting_from_right"; 

# Write a Query to remove all the leading and trailing exclamation marks from the string '!!!!!Great Learning!!!!!!'.
 
SELECT TRIM(BOTH '!' from '!!!!!Great Learning!!!!!!');

# Let's display the word "Data Base Management System" by removing the vowels in it and replacing the spaces with _

SELECT 
replace(replace(replace(replace(replace("Data Base Management System",'a',''),'e',''),'i',''),'o',''),' ','_') as "Word"
from dual
;# if you want to add "u" you can add. since the word does not contain the character "u" we are not using the replace function to replace 'u'


# DATE FUNCTIONS

# Pre-requisite -   video on the date function, aggregation functions and video on sorting.



## Let's see some date functions using HR schema:
## Let's calculate the number of years the employees had been in the company.

select round(datediff(end_date,start_date)/365,1) as 'year' from job_history;

## Let's display the employee's first name and joining date in the given format for the employee who has id no 124.
# sample output: 'Rajesh joined on Friday, October 10th, 2007'
# Hint: Use Date functions and string functions

SELECT CONCAT(first_name, ' joined on ', DATE_FORMAT(hire_date, '%W, %M %D, %Y')) AS emp_desc
	FROM Employees WHERE employee_id = 124;


select year(hire_date),month(hire_date), count(*) from employees
group by 1,2
order by count(*) desc;


# Generate the employee list who has completed successfully their first year of service in the organization as of today(assume today is MAR 1998)
 
SELECT first_name,hire_date, ADDDATE(hire_date, interval 1 year) AS 'Oneyear completion'
FROM Employees 
where year(ADDDATE(hire_date, interval 1 year)) = 1998 and month(ADDDATE(hire_date, interval 1 year))  = 03
;

# Find the tenure of the employees except for the 10,20,100,120 departments. And show results seniority-wise.

SELECT employee_id, first_name, hire_date, PERIOD_DIFF(DATE_FORMAT(curdate(), '%Y%m'), 
DATE_FORMAT(hire_date, '%Y%m'))/12 as yrs_of_service 
FROM Employees WHERE department_id  not in (10,20,100,120)
order by yrs_of_service desc;


## Pre-requisite are set operations,string and date functions. Please go through the videos


# Pull out the 2 senior and 3 junior employees.

(select Concat(first_name,' ',last_name) name, extract(year from current_date()) -  extract(year from hire_date) yrs_of_service from employees
order by yrs_of_service desc limit 2
)
union
(select Concat(first_name,' ',last_name) name, extract(year from current_date()) -  extract(year from hire_date) yrs_of_service from employees
order by yrs_of_service asc limit 3 );


# Write different methods of queries to find the first and last date of hire.

# Method 1:

select min(date_format(hire_date,'%Y-%M-%D')) "First_Day_of_hire",
max(date_format(hire_date,'%Y-%M-%D')) "Last_Day_of_hire"
from employees
;

# Method 2:

(select date_format(hire_date,'%Y-%M-%D') as 'Hire_date'
from employees 
order by 1 asc limit 1
)
union 
(select date_format(hire_date,'%Y-%M-%D') as "Hire_date"
from employees 
order by 1 desc limit 1
);

# An example for you guys is how would you find the early second year of hire and the second last year of hire happened?

(select distinct year(hire_date) as "Hire_year"
from employees 
order by 1 asc limit 1 offset 1
)
union 
(select distinct year(hire_date) as "Hire_year"
from employees 
order by 1 desc limit 1 offset 1
);

# Let's see the various methods of dealing with missing values.

# METHOD 1: IFNULL METHOD
select IFNULL(commission_pct,0) as 'commission_pct' from employees;

# METHOD 2: COALEASE
select coalesce(commission_pct,0) as 'commission_pct' from employees;

# METHOD 3: IF 
select if(commission_pct is Null,0,commission_pct) from employees;

# METHOD 4: CASE STATEMENT
select 
case 
	when commission_pct is null
		then 0
	else commission_pct
end "commission_pct"
from employees;


