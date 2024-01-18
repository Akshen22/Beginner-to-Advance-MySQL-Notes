-- 1)
create database hr_employees;
use hr_employees;

create table emp_personal_details
(id int,
Name varchar(30),
Gender char(7),
Age tinyint,
Family_Strength bit(5),
Marital_Status bool,
DOB date
);
describe emp_personal_details;

create table emp_professional_details
(id int,
DOJ date,
Annual_pay real(20,3),
Probation_Completed bool,
Designation char(20),
Pre_designation text,
Pre_year_exp tinyint
);
describe emp_professional_details;

create table employee_pay_slip_details
(id int,
date_of_slip_genrated timestamp
);
describe employee_pay_slip_details;

alter table emp_personal_details add primary key(id);
describe emp_personal_details;

alter table emp_professional_details 
add constraint FK foreign key(id)
references emp_personal_details(id);

describe emp_professional_details;

alter table emp_professional_details 
add primary key(id); -- (overwritten pk on fk)

alter table employee_pay_slip_details 
add constraint FK_1 foreign key(id)
references emp_personal_details(id);

alter table employee_pay_slip_details 
add constraint FK_2 foreign key(id)
references emp_professional_details(id);

describe employee_pay_slip_details;

-- 2) check constraint age>18 (personal)
 alter table emp_personal_details
 add constraint ch_1 check (Age>18);
 desc emp_personal_details;
 
 insert into emp_personal_details values
 (1, 'Akshen', 'M', 17, 5, 0, '2000-08-22');
 -- above constraint gets violated 
 -- as age is given smaller than 18
 
insert into emp_personal_details values
 (1, 'Akshen', 'M', 23, 5, 0, '2000-08-22');
 
select*from emp_personal_details;

-- not null and unique for name (personal)
alter table emp_personal_details
modify Name varchar(30) not null unique;

desc emp_personal_details;

alter table emp_personal_details
add constraint unique(DOB);

-- add new attribute montly_salary (pay_slip)
desc employee_pay_slip_details;

alter table employee_pay_slip_details
add montly_salary float not null after id;

-- rename date_of_slip_genrated to payslip_date
alter table employee_pay_slip_details
change date_of_slip_genrated payslip_date timestamp;

desc employee_pay_slip_details;

-- add and drop attribute (transaction_id in payslip)
alter table employee_pay_slip_details
add transaction_id int primary key not null after id;

alter table employee_pay_slip_details
drop transaction_id;

desc employee_pay_slip_details;
