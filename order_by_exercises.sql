-- Q1: Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name.
-- What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT * 
FROM employees;

SELECT *
FROM employees
WHERE first_name = 'Irena' 
OR first_name = 'Vidya' 
OR first_name = 'Maya'
ORDER BY first_name DESC;
    -- QA: Irena Heusch, Vidya Awdeh
    
-- Q2: Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name.
-- What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT *
FROM employees
WHERE first_name = ('Irena' OR 'Vidya' OR 'Maya')
ORDER BY first_name;

SELECT *
FROM employees
WHERE first_name = 'Irena' 
OR first_name = 'Vidya' 
OR first_name = 'Maya'
ORDER BY first_name, last_name;
    -- QA: Irena Acton, Vidya Zweizig
    
-- Q3: Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. 
-- What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT *
FROM employees
WHERE first_name = 'Irena' 
OR first_name = 'Vidya' 
OR first_name = 'Maya'
ORDER BY last_name, first_name;
    -- QA: Same as Q2
    
-- Q4: Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number.
-- What is the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name?
SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER by emp_no;
    -- QA: 899. 10021 Ramzi Erde, 499648 Tadahiro Erde
    
-- Q5: Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. 
-- What is the number of employees returned, the name of the newest employee, and the name of the oldest employee?
SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC;

SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY birth_date ASC;
    -- QA: 899. Teiji Eldridge, Piyush Erbe
    
-- Q6: Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result.
-- What is the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first?
SELECT *
FROm employees
WHERE birth_date LIKE '%12-25'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date ASC, hire_date DESC;

SELECT *
FROm employees
WHERE birth_date LIKE '%12-25'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY birth_date DESC, hire_date ASC;
   -- QA: 362. Khun Bernini, Douadi Pettis
    