# CROSS JOIN
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

# Old Join syntax w/o WHERE clause results in CROSS JOIN
SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;

# (INNER) JOIN without ON statement interpreted as CROSS JOIN
# NOT good practice to use JOIN w/o ON; use CROSS JOIN explicity
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

# Exclude dept_no from CROSS JOIN if manager of that dept
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    dm.dept_no <> d.dept_no
ORDER BY dm.emp_no , d.dept_no;

# INNER + CROSS JOIN
SELECT 
    e.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
		JOIN
	employees e ON dm.emp_no = e.emp_no
WHERE
    dm.dept_no <> d.dept_no
ORDER BY dm.emp_no , d.dept_no;

# Exercises
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    d.dept_no = 'd009'
ORDER BY dm.dept_no;

SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no <= 10010
ORDER BY e.emp_no, d.dept_no;















