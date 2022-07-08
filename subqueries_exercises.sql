-- Q1: Find all the current employees with the same hire date as employee 101010 using a sub-query.
-- Hire date of employee 101010
SELECT hire_date
FROM employees
WHERE emp_no = '101010';
-- Employee 101010
SELECT first_name, last_name
FROM employees
WHERE emp_no = '101010';

SELECT emp_no, CONCAT(first_name, ' ', last_name) AS Employee, hire_date AS 'Hire Date'
FROM employees
WHERE hire_date =
(SELECT hire_date
FROM employees
WHERE emp_no = '101010')
ORDER BY Employee ASC;
	-- 68 other employees were hired on the same day as employee 101010 (Demos Christ)
    
-- Q2: Find all the titles ever held by all current employees with the first name Aamod.
SELECT title Title, CONCAT(first_name, ' ', last_name) AS Employee
FROM titles
JOIN employees
USING (emp_no)
WHERE first_name = 'Aamod'
AND to_date > NOW();
	-- COMPLETE
    
-- Q3: How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT CONCAT(first_name, ' ', last_name) AS 'Former Employees', to_date AS 'Last Day'
FROM employees
JOIN dept_emp
USING (emp_no)
WHERE to_date <= NOW()
ORDER BY to_date DESC;
	-- 91479 employees
    
-- Q4: Find all the current department managers that are female. List their names in a comment in your code.
SELECT CONCAT(first_name, ' ', last_name) AS 'Department Manager', hire_date AS 'First Day'
FROM employees
JOIN dept_manager
USING (emp_no)
WHERE to_date >= NOW()
AND gender = 'F';
	-- COMPLETE
    
-- Q5: Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT CONCAT(first_name, ' ', last_name) AS Employee, salary Salary
FROM employees
JOIN salaries
USING (emp_no)
WHERE to_date > NOW()
AND salary > (SELECT ROUND(AVG(salary)) AS 'Company Salary AVG'
FROM salaries)
ORDER BY salary ASC; -- sort by ASC to see the lowest salary (63812)
	-- 154,540 employees currently make more than the average company salary
    
-- Number of employees currently working for the company (240,124)
SELECT CONCAT(first_name, ' ', last_name) AS Employee, to_date
FROM employees
JOIN dept_emp
USING (emp_no)
WHERE to_date > NOW()
;

-- Find AVG salary (63811)
SELECT ROUND(AVG(salary)) AS 'Company Salary AVG'
FROM salaries;

	-- COMPLETE
    
-- Q6: How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
-- Find the standard deviation within current salaries
SELECT ROUND(STD(salary), 2)
FROM salaries
WHERE to_date > NOW();

SELECT STDDEV(salary)
FROM salaries
WHERE to_date > NOW();

-- Every current salary (240,124; which matches the previous number of employees)
SELECT CONCAT(first_name, ' ', last_name) AS Employee, salary Salary
FROM employees
JOIN salaries
USING (emp_no)
WHERE to_date > NOW()
AND salary = (SELECT ROUND(STD(salary))
FROM salaries)
ORDER BY salary ASC;

-- Employee with highest salary
SELECT CONCAT(first_name, ' ', last_name) AS Employee, salary Salary
FROM employees
JOIN salaries
USING (emp_no)
WHERE to_date > NOW()
AND salary > (SELECT ROUND(AVG(salary)) AS 'Company Salary AVG'
FROM salaries)
ORDER BY salary DESC
LIMIT 1;

-- 83 employees have a salary wthin 1 STD of the current highest salary
SELECT CONCAT(first_name, ' ', last_name) AS Employee, salary Salary
FROM employees
JOIN salaries
USING (emp_no)
WHERE to_date > NOW()
AND salary >= '140910'
ORDER BY salary ASC;

-- 
SELECT COUNT(salary) AS Salary
FROM salaries
JOIN employees
USING (emp_no)
WHERE to_date > NOW()
AND salary > ((SELECT MAX(salary) Salary
FROM salaries
WHERE to_date > NOW())
LIMIT 1) - (SELECT ROUND(STD(salary))
FROM salaries
WHERE to_date > NOW())
ORDER BY salary ASC;

	-- COMPLETE
-- 2 STDs away? 1331
SELECT COUNT(salary) AS Salary
FROM salaries
JOIN employees
USING (emp_no)
WHERE to_date > NOW()
AND salary > (((SELECT MAX(salary) Salary
FROM salaries
WHERE to_date > NOW())
LIMIT 1) - (SELECT ROUND(STD(salary))
FROM salaries
WHERE to_date > NOW()) - (SELECT ROUND(STD(salary))
FROM salaries
WHERE to_date > NOW()));

SELECT CONCAT(first_name, ' ', last_name) AS Employee, salary Salary
FROM employees
JOIN salaries
USING (emp_no)
WHERE to_date > NOW()
AND salary >= '123600'
ORDER BY salary ASC;

	-- Hint You will likely use multiple subqueries in a variety of ways
	-- Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.

-- BONUS --

-- BQ1: Find all the department names that currently have female managers.
SELECT CONCAT(first_name, ' ', last_name) AS Employee, dept_ AS Department
FROM employees
WHERE gender ='F';

-- BQ2: Find the first and last name of the employee with the highest salary.
SELECT
FROM 
WHERE 
-- BQ3: Find the department name that the employee with the highest salary works in.
SELECT
FROM 
WHERE 