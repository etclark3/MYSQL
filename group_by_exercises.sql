-- Q1: Use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? 
SELECT DISTINCT title 
FROM titles;
	-- QA: 7 

-- Q2: Find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name 
FROM employees 
WHERE last_name LIKE 'e%e' 
GROUP BY last_name;
	-- QA: 5 (Erde, Eldridge, Etalie, Erie, Erbe)

-- Q3: Find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT DISTINCT first_name, last_name 
FROM employees 
WHERE last_name 
LIKE 'e%e';
	-- QA: 846

-- Q4: Find the unique last names with a 'q' but not 'qu'. 
SELECT DISTINCT last_name
FROM employees 
WHERE last_name LIKE '%q%' 
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
	-- QA: 3; (Qiwen, Lindqvist, Chieq)
    
-- Q5: Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
SELECT last_name, COUNT(*) 
FROM employees 
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%' 
GROUP BY last_name;
	-- QA: Chieq 189, Lindqvist 190, Qiwen 168
    
-- Q6: Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT first_name, gender, count(*) FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
GROUP BY first_name, gender;
	-- QA: Vidya (151M, 81F), Irena (144M, 97F), Maya (146M, 90F)
    
-- Q7: Generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
SELECT
LOWER(
CONCAT(
SUBSTR(first_name, 1,1),
SUBSTR(last_name, 1,4),'_',
SUBSTR(birth_date, 6,2),
SUBSTR(birth_date, 3,2)
)) AS username,
COUNT(*) AS num
FROM employees
GROUP BY username
ORDER BY num DESC;
	-- QA: There are many duplicate usernames
    
-- Q8: Bonus: More practice with aggregate functions: --
   
   -- Q8A: Determine the historic average salary for each employee.
SELECT emp_no, CONCAT(first_name, ' ', last_name) AS Employee, ROUND(AVG(salary))
FROM salaries
JOIN employees
USING (emp_no)
GROUP BY emp_no;
 
    -- Q8B: Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.
SELECT dept_no, dept_name AS Department, COUNT(*)
FROM dept_emp
JOIN departments
USING (dept_no)
WHERE to_date > NOW()
GROUP BY dept_name
ORDER BY dept_no;

    -- Q8C: Determine how many different salaries each employee has had. This includes both historic and current.
SELECT emp_no, count(salary)
FROM salaries
GROUP BY emp_no;

    -- Q8D: Find the maximum salary for each employee.
SELECT CONCAT(first_name, ' ', last_name) AS Employee, emp_no, MAX(salary)
FROM salaries
JOIN employees
USING (emp_no)
GROUP BY emp_no;

    -- Q8E: Find the minimum salary for each employee.
SELECT CONCAT(first_name, ' ', last_name) AS Employee, emp_no, MIN(salary)
FROM salaries
JOIN employees
USING (emp_no)
GROUP BY emp_no;

    -- Q8F: Find the standard deviation of salaries for each employee.
SELECT emp_no, MIN(salary) AS 'MIN Salary', MAX(salary), ROUND(STD(salary),0), hire_date
FROM salaries
JOIN employees
USING (emp_no)
GROUP BY emp_no;

    -- Q8G: Find the max salary for each employee where that max salary is greater than $150,000.
select emp_no, max(salary) 
from salaries
GROUP BY emp_no
HAVING MAX(salary) > 150000
ORDER BY MAX(salary) DESC;

    -- Q8H: Find the average salary for each employee where that average salary is between $80k and $90k.
SELECT emp_no, CONCAT(first_name, ' ', last_name) AS Employee, ROUND(AVG(salary))
FROM salaries
JOIN employees
USING (emp_no)
GROUP BY emp_no
HAVING AVG(salary)
BETWEEN 80000 AND 90000;


