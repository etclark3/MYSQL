-- Write the appropriate USE statements to switch databases as necessary.

-- 1: SELECT statements

Select all columns from the actor table.
Select only the last_name column from the actor table.
Select only the film_id, title, and release_year columns from the film table.
-- 2: DISTINCT operator

Select all distinct (different) last names from the actor table.
Select all distinct (different) postal codes from the address table.
Select all distinct (different) ratings from the film table.
-- 3: WHERE clause

Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.
Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.
Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.
Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.
Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".
Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.
Select all columns minus the password column from the staff table for rows that contain a password.
Select all columns minus the password column from the staff table for rows that do not contain a password.
-- 4: IN operator

Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.
Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)
Select all columns from the film table for films rated G, PG-13 or NC-17.
-- 5: BETWEEN operator

Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005.
Select the film_id, title, and descrition columns from the film table for films where the length of the description is between 100 and 120.
-- 6: LIKE operator

Select the following columns from the film table for rows where the description begins with "A Thoughtful".
Select the following columns from the film table for rows where the description ends with the word "Boat".
Select the following columns from the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.
-- 7: LIMIT Operator

Select all columns from the payment table and only include the first 20 rows.
Select the payment date and amount columns from the payment table for rows where the payment amount is greater than 5, and only select rows whose zero-based index in the result set is between 1000-2000.
Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200.
-- 8: ORDER BY statement

Select all columns from the film table and order rows by the length field in ascending order.
Select all distinct ratings from the film table ordered by rating in descending order.
Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order.
Select the title, description, special features, length, and rental duration columns from the film table for the first 10 films with behind the scenes footage under 2 hours in length and a rental duration between 5 and 7 days, ordered by length in descending order.
-- 9: JOINs

Select customer first_name/last_name and actor first_name/last_name columns from performing a left join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
Label customer first_name/last_name columns as customer_first_name/customer_last_name
Label actor first_name/last_name columns in a similar fashion.
returns correct number of records: 620
Select the customer first_name/last_name and actor first_name/last_name columns from performing a /right join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
returns correct number of records: 200
Select the customer first_name/last_name and actor first_name/last_name columns from performing an inner join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
returns correct number of records: 43
Select the city name and country name columns from the city table, performing a left join with the country table to get the country name column.
Returns correct records: 600
Select the title, description, release year, and language name columns from the film table, performing a left join with the language table to get the "language" column.
Label the language.name column as "language"
Returns 1000 rows
Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table, performing 2 left joins with the address table then the city table to get the address and city related columns.
returns correct number of rows: 2

-- Q1: Display the first and last names in all lowercase of all the actors.
-- Q2: You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you could use to obtain this information?
-- Q3: Find all actors whose last name contain the letters "gen":
-- Q4: Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
-- Q5: Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:
-- Q6: List the last names of all the actors, as well as how many actors have that last name.
-- Q7: List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
-- Q8: You cannot locate the schema of the address table. Which query would you use to re-create it?
-- Q9: Use JOIN to display the first and last names, as well as the address, of each staff member.
-- Q10: Use JOIN to display the total amount rung up by each staff member in August of 2005.
-- Q11: List each film and the number of actors who are listed for that film.
-- Q12: How many copies of the film Hunchback Impossible exist in the inventory system?
-- Q13: The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
-- Q14: Use subqueries to display all actors who appear in the film Alone Trip.
-- Q15: You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.
-- Q16: Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.
-- Q17: Write a query to display how much business, in dollars, each store brought in.
-- Q18: Write a query to display for each store its store ID, city, and country.
-- Q19: List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)