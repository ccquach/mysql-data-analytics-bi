# (INNER) JOIN
SELECT
	m.dept_no,
    m.emp_no,
    d.dept_name
FROM dept_manager_dup m
INNER JOIN 
	departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

# WHERE
SELECT
	m.dept_no,
    m.emp_no,
    d.dept_name
FROM 
	dept_manager_dup m,
	departments_dup d
WHERE m.dept_no = d.dept_no
ORDER BY m.dept_no;

# Exercises
SELECT
	dm.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    e.hire_date
FROM
	dept_manager dm,
    employees e
WHERE dm.emp_no = e.emp_no;