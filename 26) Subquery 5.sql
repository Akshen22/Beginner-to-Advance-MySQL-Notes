use hr;

-- subquery from a from clause

-- increase salary by 3000 and 
-- later print all emp having salary greater than 5000
select * from
(select employee_id, first_name, salary+3000 Salary from employees
where Salary>5000) S;

-- 5th highest paid emp:
select * from employees
order by salary desc
limit 5;

-- here we do get top 5 emp having highest salary, 
-- but what if i just want 5th emp? Then do:
select min(s.salary) from 
(select*from employees
order by salary desc
limit 5) s;

-- count of emp whose name starts with 'a', using from:
select count(*) from
(select employee_id, first_name from employees where first_name like 'a%') a;


-- subquery from a with clause (CTE: Common table expression)
with sw as
(select employee_id, first_name, salary+3000 Salary from employees where Salary>5000)
select * from sw;

-- count of emp whose name starts with 'a', using with:
with aw as
(select employee_id, first_name from employees where first_name like 'a%')
select count(*) from aw;
