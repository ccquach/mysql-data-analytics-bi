SELECT *
FROM employees
WHERE last_name = 'Denis' AND gender = 'M' OR gender = 'F';

SELECT *
FROM employees
WHERE last_name = 'Denis' AND (gender = 'M' OR gender = 'F');

# Exercises
SELECT *
FROM employees
WHERE gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');