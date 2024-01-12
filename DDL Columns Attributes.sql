-- 1) create database
create database Akshen;

-- 2) use that particular database you want to work on
use Akshen;

-- 3) show all list of database available
show databases;

-- 4) create table:
create table CV
(Numbers int,
Skills varchar(25),
Education varchar(25),
Experince varchar(25),
Courses varchar(25),
Project text
);

-- 5) shows the table we created under a particular database
show tables;

-- 6) view structure of the table
describe CV;

-- 7) alter
-- i) alter change (changes name of column, data type, constraints):
alter table cv change Numbers Id int;
describe CV;

alter table cv change Id Numbers float not null;
describe cv;

-- ii) alter modify (changes data type, constraints):
alter table cv modify Numbers int;
describe CV;

alter table cv modify Numbers float not null;
describe CV;

-- iii) alter drop (drops duplicate ya unwanted column):
alter table cv drop Experince;
describe cv;

-- iv) alter add (add a column whenever you need):
-- a)
alter table cv add Experience varchar(25);
describe cv;

-- b)
alter table cv add Extra_Curriculum text not null;
describe cv;

-- c)
alter table cv add Experience varchar(25) after Skills;
describe cv;

-- d)
alter table cv add Experience varchar(25) first;
describe cv;

-- e)
alter table cv add Experience varchar(25) not null first;
describe cv;

-- 8) drop: removes a table and all its data permanently
drop table cv;
describe cv;

-- 9) truncate: removes all data from a table but leaves the table structure intact
truncate table cv;
describe cv;

-- 10) rename table name:
rename table cv to resumes;
show tables;
describe resumes;

-- 11) drop database:
drop database Akshen;
show databases;