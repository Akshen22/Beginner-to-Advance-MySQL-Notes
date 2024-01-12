use Akshen;
insert into resumes values
(2,'C','PG',',Data_Science','DL','Studies');
select*from resumes;


set autocommit=0; -- automatic none changes

update resumes set Education= 'BTech' 
where Numbers=1;

rollback; -- undo earlier stuffs

commit; -- ensures it saves in the dataset

set autocommit=1; -- to make evrery automatic;

update resumes set Courses = 'Data Science'
where Numbers=2;
select*from resumes;