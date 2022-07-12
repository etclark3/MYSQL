USE leavitt_1859;
USE employees;
-- 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. 
CREATE TEMPORARY TABLE leavitt_1859.employees_with_department AS
SELECT CONCAT(first_name, ' ', last_name) AS Employee, dept_name
FROM employees
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no);
        
SELECT *
FROM employees_with_department;

USE leavitt_1859;
SELECT * FROM employees_with_department LIMIT 10;

-- 1.a Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
ALTER TABLE employees_with_department ADD full_name VARCHAR(30);

-- 1.b Update the table so that full name column contains the correct data
UPDATE employees_with_department SET full_name = CONCAT(first_name, ' ', last_name);

-- 1.c Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP first_name;
ALTER TABLE employees_with_departments DROP last_name;

-- 1.d What is another way you could have ended up with this same table? 
	-- concat(ed) first_name and last_name (did that originally)

-- 2.a Create a temporary table based on the payment table from the sakila database.
USE sakila;
CREATE TEMPORARY TABLE leavitt_1859.pay(
SELECT * FROM payment);

USE leavitt_1859;

SELECT * 
FROM pay;

-- 2.b Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
ALTER TABLE pay ADD newamount INT;

UPDATE pay SET newamount = amount*100;

SELECT * FROM pay LIMIT 5;

ALTER TABLE pay DROP amount;

-- 3. Find out how the current average pay in each department compares to the overall current pay for everyone at the company. In order to make the comparison easier, you should use the Z-score for salaries. In terms of 
-- salary, what is the best department right now to work for? The worst?
USE employees;

CREATE TEMPORARY TABLE leavitt_1859.paytable(
SELECT dept_name AS Department, AVG(salaries.salary) as 'AVG Salary'
FROM departments
JOIN dept_emp 
USING (dept_no)
JOIN salaries 
USING (emp_no)
WHERE dept_emp.to_date > NOW()
AND salaries.to_date > NOW()
GROUP BY dept_name);
