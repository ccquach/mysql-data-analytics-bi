SELECT COUNT(emp_no)
FROM employees;

SELECT COUNT(first_name)
FROM employees
WHERE first_name IS NULL;

# Count distinct employee names
SELECT COUNT(DISTINCT first_name)
FROM employees;

# Exercises
SELECT COUNT(*)
FROM salaries
WHERE salary >= 100000;

SELECT COUNT(*)
FROM dept_manager;