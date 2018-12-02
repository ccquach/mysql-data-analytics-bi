SELECT
	emp_no,
    first_name,
    last_name,
	CASE
		WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
	employees;
    
-- Alternative syntax
SELECT
	emp_no,
    first_name,
    last_name,
	CASE gender
		WHEN 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
	employees;
    
-- Cannot use alternative syntax with values that cannot be compared, such as NULL
SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE 
		WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM 
	employees e
		LEFT JOIN
	dept_manager dm ON dm.emp_no = e.emp_no
WHERE
	e.emp_no > 109990;

-- All records return with 'Employee' (wrong syntax)
SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE dm.emp_no 
		WHEN NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM 
	employees e
		LEFT JOIN
	dept_manager dm ON dm.emp_no = e.emp_no
WHERE
	e.emp_no > 109990;
		
-- IF construct
SELECT
	emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS gender
FROM
	employees;
    
-- Multiple WHEN expressions
SELECT
	dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
		WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30,000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised by more than $20,000 but less than $30,000'
        ELSE 'Salary was raised by less than $20,000'
    END AS salary_increase
FROM
	dept_manager dm
		JOIN
	employees e ON e.emp_no = dm.emp_no
		JOIN
	salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;



# Exercises
-- #1
SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
	IF(dm.emp_no IS NULL, 'Employee', 'Manager') AS is_manager
FROM employees e
	LEFT JOIN
		dept_manager dm ON dm.emp_no = e.emp_no
WHERE e.emp_no > 109990;

-- #2
SELECT
	dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    IF(MAX(s.salary) - MIN(s.salary) > 30000, 
		'Salary raise higher than $30,000',
        'Salary raise NOT higher than $30,000'
	) AS salary_increase
FROM 
	dept_manager dm
		LEFT JOIN
	employees e ON e.emp_no = dm.emp_no
		LEFT JOIN
	salaries s ON s.emp_no = dm.emp_no
GROUP BY
	dm.emp_no;
	
SELECT
	dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
		WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary raise higher than $30,000'
        ELSE 'Salary raise NOT higher than $30,000'
    END AS salary_increase
FROM 
	dept_manager dm
		LEFT JOIN
	employees e ON e.emp_no = dm.emp_no
		LEFT JOIN
	salaries s ON s.emp_no = dm.emp_no
GROUP BY
	dm.emp_no;

-- #3
SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    IF(MAX(d.to_date) = '9999-01-01', 'Is still employed', 'Not an employee anymore') AS current_employee
FROM
	employees e
		LEFT JOIN
	dept_emp d ON d.emp_no = e.emp_no
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 100;

SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE MAX(d.to_date)
		WHEN '9999-01-01' THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM
	employees e
		LEFT JOIN
	dept_emp d ON d.emp_no = e.emp_no
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 100;
    
-- #3 Course Solution
SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE 
		WHEN MAX(d.to_date) > SYSDATE() THEN 'Is still employed'
        ELSE 'Not an employee anymore'
    END AS current_employee
FROM
	employees e
		LEFT JOIN
	dept_emp d ON d.emp_no = e.emp_no
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 100;