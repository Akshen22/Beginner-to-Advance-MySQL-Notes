use Akshen;

set autocommit=0; -- 1) automatic none changes

start transaction; -- 2) Starts transaction

insert into resumes values -- 3) Insert values
(1,	'Python', 'BE',	'Computer_Engineering',	'ML', 'Dance'),
(2,	'Python', 'PGP', 'Data_Science', 'ML', 'Cricket');

select*from resumes; -- 4) See all entered values

rollback; -- 5) undo whole stuffs 

select*from resumes; -- 6) You wont get it back as its rollback

-- 7) Again insert the values

commit; -- 8) ensures it saves in the dataset permenantly
select*from resumes; -- 9) If you see it wont get deleted as its commit
rollback; -- 10) you will still get, rollback wont work as its commit
select*from resumes; -- 11) You will still get it

savepoint A1; -- 12) Partial undo as we need not entier like rollback
insert into resumes values 
(3,	'C', 'BE',	'Computer_Engineering',	'Gaming', 'Dance'),
(4,	'Java', 'PGP', 'Full_Stack', 'Backend', 'Cricket');
savepoint A2; -- 13) 2nd savepoint
insert into resumes values 
(5,	'R', 'BE',	'Computer_Engineering',	'DL', 'Chess');

select*from resumes; -- 14) Will get all 5 rows

rollback to A2; -- 15) Partial rollback happens where row 5 gets deleted
select*from resumes; -- 16) Will get only 4 rows

release savepoint A2; -- 17)Savepoint A2 gets released, now theres no savepoint

set autocommit=1; -- 18) to make evrery automatic;

select*from resumes;
