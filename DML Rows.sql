use Akshen;

-- insert:
-- (i) 
insert into resumes values 
(1, 'Python', 'BE', 'Computer_Engineering', 'ML', 'Dance');

-- (ii)
insert into 
resumes(Numbers, Skills, Courses, Project, Extra_Curriculum) 
values 
(2, 'C', 'Data_Science', 'DL', 'Cricket');

-- to view inserted information written inside columns:
select*from resumes;

-- update
update resumes 
set Education='PGP'
where Numbers=2;
select*from resumes;

-- delete
delete from resumes where Skills='C';
select*from resumes;