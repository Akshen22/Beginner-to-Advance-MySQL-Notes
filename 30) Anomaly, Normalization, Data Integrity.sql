/* Anomaly:
Missmatch, Inconsistencies in the data
Types: Insertion anomaly, Updation anomaly, Deletion anomaly*/ 

/* Functional dependency:
There's one primary key where as other all columns are said to be no keys 
and are dependent on that one primary key */

/* Normalization:
Helps to reduces defects, can be done by dividing table in smaller tables.

Types: 
1NF: 
1 data value in a particular cell
Rules: 
consist of scalar atomic value, same business term, 
columns should be unique name, order of rows doesn't matters.

2NF: 
Each nonkey and independent attribute has functional dependency
Its evolution of 1NF, handles redundancy of data
Must be in 1NF
If there's many primary key gets divided in sub groups

3NF:
Column can't be dependent on some other column that's not a key
Example: 2 primary key and 2 columns are there, and 1 column depents on 2 PK its okay,
but if 2nd column depends on 1st column (not a PK columns) and still all are in same group it does not work,
need to divide 2 groups, one having: 1 column and 2 PK column 
and other: 2nd column depending on 1st column
*/

/* Data Integrity:
Need to maintain integrity of data to ensure smooth business flow,
Ensure consistency of the data.
If vioalets: Penalty by data govaernance, 
Cost associated to unused data maintenance is in billion due to add on storage,
Consuming additional ram, Purchase additionl disk,
Analytics may show inappropriate result, Quality control is overhead, 
No proper decision making due to quality of data*/

-- Example:
use hr;
create table courses
(course_id int primary key,
course_name varchar(20) not null);

create table students
(std_id int primary key,
std_name varchar (25),
course_id int,
foreign key (course_id) references courses(course_id));

describe table courses;
describe courses;
insert into courses values('one','python'); -- error, as it goes against column integrity
insert into courses values(1, 'Python'), (20,'SQL'),(30,'BigData');
select*from courses;

describe table students;
describe students;
insert into students values (5,'Aki','50'); -- throw an error because course id refers to course and theres no 50 inside course id
insert into students values (1,'Maher',1),(2,'Aki',1),(3,'Nalini',20),(4,'Rakesh',30);
select*from students;

delete from courses where course_id=20;
-- cannot delete parent row, need to delete foreign key first to do it successfully
