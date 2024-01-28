set autocommit=0;

create database demo;
use demo;
create table sample
(id int,
name_s varchar(25));
desc sample;
select*from sample;

-- 1) read uncommitted (dirty read), written as:
-- set transaction isolation level read uncommitted
start transaction;
insert into sample value(1,'Dad'),
(2,'Mom'),
(3,'Maher'),
(4,'Akshen'),
(5,'Wife');
select*from sample;
commit;

insert into sample value(6,'Bhabi');

/* once you commit all the first 5 rows and later you just insert 6 
but you dont commit and can see is known as dirty read, read uncommitted */

-- 2) read committed (no repeatable read), written as:
-- set transaction isolation level read committed;

-- 3) repeatable read: (same ans again and again)
-- set transaction isolation level repeatable read

-- 4) serializable: (going to use concept of locking)
-- set transaction isolation level serializable
-- 2nd user wont be allow to see what is 1st doinf untill 1st committs