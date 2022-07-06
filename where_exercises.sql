-- Q1: Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
SELECT * FROM employees WHERE first_name IN ('Irena','Vidya','Maya');
	-- QA: 709

-- Q2: Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
SELECT * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
	-- QA: 709

-- Q3: Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
SELECT * FROM employees WHERE gender = 'M' AND (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya');
	-- QA: 441
    
-- Q4: Find all employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
SELECT * FROM employees WHERE last_name LIKE 'e%';
	-- QA: 7330
    
-- Q5: Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E.
SELECT * FROM employees WHERE last_name LIKE '%e' OR last_name LIKE 'e%';
	-- QA: 30,723

-- Q6: How many employees have a last name that ends with E, but does not start with E?
SELECT * FROM employees WHERE last_name LIKE '%e' AND last_name NOT LIKE 'e%';
	-- QA: 23,393
    
-- Q7: Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E.
SELECT * FROM employees WHERE last_name LIKE 'e%e';
	-- QA: 899

-- Q8: How many employees' last names end with E, regardless of whether they start with E?
SELECT * FROM employees WHERE last_name LIKE '%e';
	-- QA: 24,292
 
-- Q9: Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
	-- QA: 50000, removed limit and now 135,214

-- Q10: Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
SELECT * FROM employees WHERE birth_date LIKE '%12-25';
	-- Q9A: 842

-- Q11: Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%12-25';
	-- Q10A: 362

-- Q12: Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
SELECT * FROM employees WHERE last_name LIKE '%q%';
	-- Q11A: 1873

-- Q13: Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
	-- Q12A: 547