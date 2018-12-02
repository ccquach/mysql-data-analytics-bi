SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

SELECT
	m.dept_no,
    m.emp_no,
    d.dept_name
FROM dept_manager_dup m
INNER JOIN 
	departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

# Exercises
SELECT
	m.emp_no,
    e.first_name,
    e.last_name,
    m.dept_no,
    e.hire_date
FROM dept_manager m
JOIN 
	employees e ON m.emp_no = e.emp_no
ORDER BY m.emp_no;