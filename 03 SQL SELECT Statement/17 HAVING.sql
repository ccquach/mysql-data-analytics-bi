SELECT *
FROM employees
WHERE hire_date >= '2000-01-01';

SELECT *
FROM employees
HAVING hire_date >= '2000-01-01';

# Expect error
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    COUNT(first_name) > 250
GROUP BY first_name
ORDER BY first_name;

# Expect 193 rows returned
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING
    COUNT(first_name) > 250
ORDER BY first_name;

# Exercises
SELECT 
    *
FROM
    salaries
WHERE
    salary > 120000;
    
SELECT 
    *, AVG(salary) AS avg_salary
FROM
    salaries
WHERE
    salary > 120000
GROUP BY emp_no
ORDER BY emp_no;

SELECT 
    *, AVG(salary) AS avg_salary
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;