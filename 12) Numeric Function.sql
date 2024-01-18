use hr;

select 25+7,25-7,25/7,25*7,25 mod 7;

-- abs: works as modulo, -ve to +ve
SELECT Abs(-243.5) AS AbsNum;

-- cos;
SELECT COS(2);

-- acos: (arc) inverse of cos
select acos(0.45);

-- sin:
SELECT SIN(2);

-- asin: (arc) inverse of sin
SELECT ASIN(0.25);

-- tan: tangent is a line that touches a circle or ellipse at only one point.  
SELECT TAN(1.75);

-- atan: (arc) inverse of tangent
select atan(0.25);

-- similarly there's tan2:
select atan2(50,2);

-- The advantage of using atan2 over atan is that 
-- atan2 can handle all four quadrants of the Cartesian plane, 
-- while atan can only handle the first and fourth quadrants 2. 
-- This means that atan2 can return values in the range (-π, π], 
-- while atan can only return values in the range (-π/2, π/2).

-- avg:
select avg(salary) from employees;

-- Round off:
-- 1) ceiling: a type of round off (max)
SELECT CEILING(25.75) AS CeilValue;

-- 2) round: rounds of max number
SELECT round(25.75) AS roundoff;

-- 3) floor: rounds of min number
SELECT floor(25.75) AS CeilValue;

-- 4) truncate:
select truncate(13.99,1);

-- count:
select count(first_name) from employees;

-- cot: returns the cotangent of a number.
SELECT COT(6);

-- degree:
SELECT DEGREES(1.5);

-- exp: exponential, e poower of of 2
SELECT EXP(1);

-- log:
SELECT LOG(2);

-- log10: Return the base-10 logarithm of 2:
SELECT LOG10(2);

-- max
select max(salary) as highest_salary from employees;

-- min
select min(salary) as highest_salary from employees;

-- pi:
SELECT PI();

-- power: multiply
SELECT POWER(4, 2);

-- radian:
SELECT RADIANS(180);

-- rand: select random decimal number
SELECT RAND();

-- round: round of the value as per need
SELECT ROUND(235.415, 2) AS RoundValue;

-- sign: 
-- If number > 0, it returns 1
-- If number = 0, it returns 0
-- If number < 0, it returns -1
SELECT SIGN(255.5);

-- sqrt:
SELECT SQRT(64);

-- sum:
SELECT SUM(salary) AS TotalSalary FROM employees;

-- format:
select format(124567.876,1);

-- mod:
select mod(10,5);