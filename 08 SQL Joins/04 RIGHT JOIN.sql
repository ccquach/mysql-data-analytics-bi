SELECT
	m.dept_no,
    m.emp_no,
    d.dept_name
FROM dept_manager_dup m
RIGHT JOIN 
	departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

# above RIGHT JOIN result equates to below LEFT JOIN result
SELECT
	d.dept_no,
    m.emp_no,
    d.dept_name
FROM departments_dup d
LEFT JOIN 
	dept_manager_dup m ON d.dept_no = m.dept_no
ORDER BY d.dept_no;