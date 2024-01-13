create database Course;
use Course;

create table Subjects
(Subject_id int primary key,
Subject_name varchar(25) not null);

describe Subjects;

insert into 
Subjects(Subject_id, Subject_name) 
values
(1, 'Python'),
(2, 'SQL'),
(3, 'NPV'),
(4, 'EDA'),
(5, 'Statistics');

select*from Subjects;

create table Students
(Student_id int primary key,
Student_name varchar(25) not null,
Subject_id int,
  foreign key(Subject_id) references Subjects(Subject_id)
);

select*from Students;
describe Students;

insert into Students values (01,'Akshen',1);
insert into Students values (02,'Maher',2);
insert into Students values (03,'Nalini',2);
insert into Students values (04,'Rakesh',1);
insert into Students values (05,'Moksha',3);

select*from Students;
select*from Subjects;

create table department
(dept_id int primary key,
dept_name varchar(25) unique,
roll_call int unique);

insert into department values 
(1, 'HR', 10),
(2, 'Accountant', 11),
(3, 'IT', 12);

select*from department;

insert into department values
(4, 'IT');

select*from department;

insert into department values
(5, 'SEO', 12);