# Pattern matching sequence of characters
SELECT *
FROM employees
WHERE first_name LIKE ('Mar%');

SELECT *
FROM employees
WHERE first_name LIKE ('%ar');

SELECT *
FROM employees
WHERE first_name LIKE ('%ar%');

# Pattern matching single character
SELECT *
FROM employees
WHERE first_name LIKE ('Mar_');

# NOT LIKE
SELECT *
FROM employees
WHERE first_name NOT LIKE ('%Mar%');

# MySQL is case INSENSITIVE
SELECT *
FROM employees
WHERE first_name NOT LIKE ('%Mar%');

SELECT *
FROM employees
WHERE first_name NOT LIKE ('%MAR%');

SELECT *
FROM employees
WHERE first_name NOT LIKE ('%mar%');

# Exercises
SELECT *
FROM employees
WHERE first_name LIKE ('mark%');

SELECT *
FROM employees
WHERE hire_date LIKE ('%2000%');

SELECT *
FROM employees
WHERE emp_no LIKE ('1000_');