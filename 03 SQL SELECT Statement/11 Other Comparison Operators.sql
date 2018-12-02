# Not equal to
SELECT *
FROM employees
WHERE first_name != 'mark';

SELECT *
FROM employees
WHERE first_name <> 'mark';

# Greater than
SELECT *
FROM employees
WHERE hire_date > '2000-01-01';

# Less than
SELECT *
FROM employees
WHERE hire_date < '1985-02-01';

# Exercises
SELECT *
FROM employees
WHERE gender = 'F' AND hire_date >= '2000-01-01';

SELECT *
FROM salaries
WHERE salary > 150000;