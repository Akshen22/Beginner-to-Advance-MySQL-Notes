-- 1)
use Akshen;
show tables;
select * from resumes;
select Skills from resumes;
select Education from resumes where Project="DL";

-- 2) 
create database hr_emp;
use hr_emp;

create table employees
(employee_id int unsigned not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
email varchar(25) not null,
phone_number int unsigned not null,
hire_date date not null,
job_id int unsigned not null,
salary decimal(8,2) unsigned not null,
manager_id int unsigned not null,
department_id int unsigned not null,
primary key(employee_id)
);

show tables;

describe employees;

-- 3)
use hr;

show tables;

select*from employees;

select*from employees where employee_id=95;

select*from employees where first_name='Steven';

select*from employees where hire_date < '1990-01-03';

select phone_number from employees where year(hire_date)='1990';

select*from employees where year(hire_date)>1990 and salary>10000;

select first_name, email, salary from employees 
where salary>10000 and employee_id>150;

select first_name from employees where salary between 10000 and 20000;

select first_name, salary from employees where salary in (10000,20000);

select*from employees where first_name in ('Peter', 'Hermann');

select*from employees where job_id not in ('ST_CLERK');

-- like, not like
select*from employees where first_name like '%a';

select*from employees where first_name like 'b%';

select*from employees where first_name like '%a%';

select*from employees where first_name like '%a__';

select*from employees where first_name like '__a%';

select*from employees where first_name not like '%a';

select*from employees where commission_pct is not null;

select*from employees where commission_pct is null;

select employee_id, first_name, last_name, job_id Job_Id from employees;
-- column alias: only changes in the current statement not in the database

-- logical operator (and,or,not)
select*from employees where last_name = 'Patel' and salary='2500';

select*from employees where last_name = 'Patel' and salary='5000';

select*from employees where last_name = 'Patel' or salary='20000';

select*from employees where not(last_name = 'Patel');

-- relational operator
select*from employees where salary = 24000;

select*from employees where salary != 24000;

select*from employees where salary <> 24000 or salary = 24000;

select first_name, salary Salaries from employees where salary <= 2400;

select last_name Last_Name, salary from employees where salary >= 15000 and salary <=20000;

-- order by
select*from employees 
order by first_name;

select first_name, last_name from employees
order by last_name desc;

select*from employees
order by first_name desc;

select*from employees
order by last_name desc;

select * from employees
order by first_name desc, last_name desc;

-- limit
select email, job_id from employees
order by first_name
limit 5;

-- list emp getting least salary
select * from employees
order by salary asc
limit 5;

-- list emp getting highest salary
select*from employees
order by salary desc
limit 5;

-- offset
select*from employees
order by salary desc;

select*from employees
order by salary desc
limit 6 offset 7; 

select*from employees
order by phone_number;

select*from employees
order by phone_number
limit 5 offset 8;

select first_name, last_name, salary, salary *  0.5 Salary from employees;
