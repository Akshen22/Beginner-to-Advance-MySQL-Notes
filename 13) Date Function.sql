-- current date and time:
SELECT CURRENT_TIMESTAMP;
select now();
select curdate();
select curtime();
select utc_timestamp();

-- date differences between the 2:
SELECT DATEDIFF('2017/08/25', '2011/08/25') AS DateDiff;
SELECT (DATEDIFF('2017/08/25', '2011/08/25')/365) AS DateDiff;
SELECT round(DATEDIFF('2017/08/25', '2011/08/25')/365,0) AS DateDiff;
SELECT TIMESTAMPDIFF(YEAR, '2011-08-25', '2017-08-25') AS DateDiff;
SELECT DATE_add(curdate(), interval 10 day);

-- extract:
select day(curdate()),month(curdate()),year(curdate());
select dayname(curdate());
select last_day(curdate());
select dayofyear(curdate());
select dayofweek(curdate());

-- date format:
-- YYYY/MM/DD
-- d: date, b: month, y: year, 
-- W: Day(Mon, Tue, etc..), M: month, Y: year, D: day(10th)
select date_format(curdate(), '%d-%b-%y');
select concat(first_name,'\n', 'joined on','\n', date_format(hire_date, '%W, %M, %D, %Y'))
new_date -- on
from employees;