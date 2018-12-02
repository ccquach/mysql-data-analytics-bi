SELECT first_name
FROM employees;

# GROUP BY can be used to get distinct values but processes slower than SELECT DISTINCT
SELECT first_name
FROM employees
GROUP BY first_name;

SELECT DISTINCT first_name
FROM employees;

# GROUP BY with aggregate functions
SELECT first_name, COUNT(first_name)
FROM employees
GROUP BY first_name
ORDER BY first_name;