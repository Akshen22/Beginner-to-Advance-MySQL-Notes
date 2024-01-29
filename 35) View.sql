/*
Virtual table are constructed from existing table, can be: single or multiple
Changes made in table reflects on view and changes made in view reflects on table

Advantage: Avoids direct access to physical data, protects the data
Disadvantage: slower them direct process, consumes more i/o transactions between
local & remote database tables 

Types: 
Simple view, complex view, inline view, horizontal view, vertical view,
joined view, drop view

Syntax:
i) Single table:
create view view_name as 
select column1, column2,... from table 1
where condition;

ii) Multiple table:
create view view_name as
select column1, column2,... from table 1, table 2,..
where table.col_name=table.col_name and
condition;
*/
use hr;

select*from employees;

-- 1) Create single view table:
create view salary_according_job_id as
select employee_id,salary, job_id from employees
where salary>5000;

select*from salary_according_job_id; -- check if created or not

update salary_according_job_id set salary =7000 where employee_id=146;
-- once we update in view table, will observe that in employees table too its changed 

select*from employees where employee_id=146; -- proof
-- if you will update the original table view table will change

-- 2) Create multiple (2) view table:
create view salary_according_dep as
select salary, department_name from employees e, departments d
where e.department_id=d.department_id;

select*from salary_according_dep;

-- 3) Create multiple (3) view table:
create view salary_according_city as
select salary, department_name, city from employees e, departments d, locations l
where e.department_id=d.department_id and d.location_id=l.location_id;

select*from salary_according_city;

drop view salary_according_city; -- to drop when not required