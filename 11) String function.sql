use hr;

-- ascii:
SELECT first_name, ASCII(first_name) AS NumCodeOfFirstChar
FROM employees;

-- char: ascii to character
SELECT CHAR(65);

-- len:
select length(first_name) from employees;

-- concat:
select concat(first_name,'\n',last_name) full_name from employees;

-- lower/lcase:
select lcase(first_name) from employees;

-- upper/ucase:
select ucase(last_name) from employees;

-- replace:
select replace('Akshen_Dhami', 'Dhami', 'D');
select replace('Akshen_Dhami', 'Dhami', 'D') from dual;
select job_id, replace(job_id,'IT','Software')from employees;

-- left:
SELECT LEFT(first_name,3) from employees;

-- right:
SELECT right(first_name,3) from employees;

-- trim:
select trim('Great_' from 'Great_Learning');
select trim('33$$' from '180.33$$') from dual;

-- left trim:
SELECT LTRIM('     SQL Tutorial') AS LeftTrimmedString;

-- right trim:
SELECT RTRIM('SQL Tutorial      ') AS RightTrimmedString;

-- substring:
select substr('Great Learning', 1,5);
select substr(first_name, 1,5) from employees;

-- reverse:
SELECT REVERSE('SQL Tutorial');
