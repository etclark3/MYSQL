-- Q1: Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
SELECT CONCAT((first_name), ' ',
(last_name) LIKE 'e%' AND last_name LIKE '%e')
AS full_name
FROM employees;
	-- Notes: 'e%e'

-- Q2: Convert the names produced in your last query to all uppercase.
SELECT CONCAT(UPPER(first_name), ' ',(last_name) LIKE 'e%e')
AS full_name
FROM employees;

-- Q3: Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
SELECT * FROM employees 
WHERE birth_date LIKE '%12-25'
AND hire_date BETWEEN '1900-01-01' AND '1999-12-31';
	-- A: 842
    
SELECT datediff(now(), hire_date) AS days_worked, hire_date
FROM employees
WHERE birth_date LIKE '%12-25'
AND hire_date BETWEEN '1900-01-01' AND '1999-12-31';

-- Q4: Find the smallest and largest current salary from the salaries table.
SELECT MAX(salary) FROM salaries;
	-- A1: 158220

SELECT MIN(salary) FROM salaries;
	-- A2: 38623
    
SELECT MAX(salary), MIN(salary)
FROM salaries
WHERE to_date >= '9999-01-01';

-- Use your knowledge of built in SQL functions to generate a username for all of the employees.
-- A username should be all lowercase, and consist of the first character of the employees first name, 
-- the first 4 characters of the employees last name, an underscore, the month the employee was born, 
-- and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:
SELECT
	LOWER(
    CONCAT(
	SUBSTR(first_name, 1,1)
    ,SUBSTR(last_name, 1,4)
    ,'_'
    ,SUBSTR(birth_date,6,2)
    ,SUBSTR(birth_date, 3,2)
    )
    ) AS username
FROM employees;
