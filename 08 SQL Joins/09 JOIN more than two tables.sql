SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
;

# Exercises
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    dept_manager m
        LEFT JOIN
    employees e ON m.emp_no = e.emp_no
        JOIN
    titles t ON m.emp_no = t.emp_no
        AND m.from_date = t.from_date
        JOIN
    departments d ON m.dept_no = d.dept_no;
    
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    dept_manager m
        LEFT JOIN
    employees e ON m.emp_no = e.emp_no
        JOIN
    titles t ON m.emp_no = t.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
WHERE
    t.title = 'Manager';