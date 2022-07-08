SELECT * FROM dept_manager; -- emp_no , dept_no , from_date , to_date
DESCRIBE dept_manager;
-- employees (emp_no)
-- departments (dept_no)
-- dept_emp (emp_no, dept_no, from_date, to_date)
-- salaries (emp_no , from_date , to_date)

SELECT * FROM departments; -- dept_no, dept_name
DESCRIBE departments; -- PRI, UNI
-- employees (NA)
-- dept_emp (dept_no)
-- dept_manager (dept_no)
-- salaries (NA)

SELECT * FROM employees; -- emp_no , birth_date , first_name , last_name , gender , hire_date
DESCRIBE employees; -- PRI
--  dept_manager (emp_no)
-- departments (NA)
-- dept_emp (emp_no)
-- salaries (emp_no)

SELECT * FROM dept_emp; -- emp_no , dept_no , from_date , to_date
DESCRIBE dept_emp;
-- employees (emp_no)
-- departments (dept_no)
-- dept_manager (emp_no, dept_no, from_date, to_date)
-- salaries (emp_no , from_date , to_date)
SELECT dept_no, COUNT(dept_no)
FROM dept_emp;

SELECT * FROM salaries; -- emp_no , salary , from_date , to_date
SELECT salary FROM salaries
ORDER BY salary DESC;
DESCRIBE salaries;
-- employees (emp_no)
-- dept_manager (emp_no , from_date , to_date)
-- departments (NA)
-- dept_emp (mp_no , from_date , to_date)

SELECT * FROM titles; -- emp_no , title , from_date , to_date
DESCRIBE titles;

-- EXAMPLE --
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10004;
-- EXAMPLE --

-- Q1: Write a query that shows each department along with the name of the current manager for that department. 
SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Dept Manager'
FROM dept_manager
JOIN departments
USING (dept_no)
JOIN employees
USING (emp_no)
WHERE to_date >= NOW()
ORDER BY dept_name ASC;
	-- COMPLETE

-- Q2: Find the name of all departments currently managed by women.
SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Overlord'
FROM dept_manager
JOIN departments
USING (dept_no)
JOIN employees
USING (emp_no)
WHERE to_date >= NOW()
AND gender = 'F'
ORDER BY 'Department Overlord' ASC;
	-- COMPLETE
    
-- Q3: Find the current titles of employees currently working in the Customer Service department. <titles , dept_emp , departments>
SELECT title AS Title, COUNT(title) AS Number
FROM titles
JOIN dept_emp
USING (emp_no)
JOIN employees
USING (emp_no)
JOIN departments
USING (dept_no)
WHERE dept_emp.to_date >= NOW()
AND dept_name = 'Customer Service'
GROUP BY titles.title;
	-- COMPLETE

-- Q4: Find the current salary of all current managers. <salaries , employees , department_manager , dept_name>
SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Supreme Leader', salary AS Cash
FROM departments
JOIN dept_manager
USING (dept_no)
JOIN employees
USING (emp_no)
JOIN salaries
USING (emp_no)
WHERE dept_manager.to_date > NOW() 
AND salaries.to_date > NOW();
	-- COMPLETE

-- Q5: Find the number of current employees in each department. <departments, employees>
SELECT dept_name AS 'Department Name', COUNT(dept_name) AS Employees
FROM departments
JOIN dept_manager
USING (dept_no)
JOIN employees
USING (emp_no)
JOIN dept_emp
USING (dept_no)
WHERE dept_emp.to_date > NOW()
GROUP BY dept_name
ORDER BY Employees DESC;
	-- COMPLETE
    
-- Q6: Which department has the highest average salary? Hint: Use current not historic information.
SELECT dept_name AS 'Department', AVG(salary) AS 'Department Avg'
FROM departments
JOIN dept_emp
USING (dept_no)
JOIN salaries
USING (emp_no)
WHERE salaries.to_date > NOW()
AND dept_emp.to_date > NOW()
GROUP BY dept_name
ORDER BY 'Department Avg' DESC;
	-- COMPLETE. Sales has the highest average salary
    
-- Q7: Who is the highest paid employee in the Marketing department?
SELECT CONCAT(first_name, ' ', last_name) AS Employee, Salary
FROM departments
JOIN dept_emp
USING (dept_no)
JOIN salaries AS s
USING (emp_no)
JOIN employees
USING (emp_no)
WHERE s.to_date > NOW() AND dept_name = 'Marketing'
ORDER BY salary DESC -- could stop here
LIMIT 1;
	-- COMPLETE. Akemi Warwick
    
-- Q8: Which current department manager has the highest salary?
SELECT CONCAT(first_name, ' ', last_name) AS Employee, dept_name AS Department, salary AS 'Salary'
FROM dept_manager dm
JOIN departments
USING (dept_no)
JOIN salaries AS s
USING (emp_no)
JOIN employees
USING (emp_no)
WHERE s.to_date > NOW()
AND dm.to_date > NOW()
ORDER BY salary DESC;
	-- COMPLETE. Vishwani Minakawa, $106,491
    
-- Q9: Determine the average salary for each department. Use all salary information and round your results.
SELECT dept_name AS 'Department', ROUND(AVG(salary), 2) AS 'Department Avg'
FROM departments
JOIN dept_emp
USING (dept_no)
JOIN salaries
USING (emp_no)
WHERE salaries.to_date > NOW()
GROUP BY dept_name
ORDER BY 'Department Avg' DESC;
	-- COMPLETE
    
-- Bonus: Find the names of all current employees, their department name, and their current manager's name.

	-- NOT COMPLETE
    