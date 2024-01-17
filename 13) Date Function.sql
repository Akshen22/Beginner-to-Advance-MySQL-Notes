-- current date and time:
SELECT CURRENT_TIMESTAMP;
select now();
select curdate();
select curtime();

-- date differences between the 2:
SELECT DATEDIFF('2017/08/25', '2011/08/25') AS DateDiff;
SELECT TIMESTAMPDIFF(YEAR, '2011-08-25', '2017-08-25') AS DateDiff;
SELECT DATE_add(curdate(), interval 10 day);

-- extract:
select day(curdate()),month(curdate()),year(curdate());
select dayname(curdate());
select last_day(curdate());
select dayofyear(curdate());
select dayofweek(curdate());

-- date format:
select date_format(curdate(), '%d-%b-%y');
