-- cast:
select cast(25.65 as time);

-- coalesce:
select coalesce('Great_Learning', null, 2);
select coalesce(null, 2, 'Great_Learning', null, 2);

-- sorting query result:
use hr;
select * from employees order by salary desc; 
select first_name, salary, hire_date from employees order by hire_date desc, salary; 
