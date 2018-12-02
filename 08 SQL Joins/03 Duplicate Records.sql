# duplicate records
INSERT INTO dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO departments_dup
VALUES ('d009', 'Customer Service');

# check 'dept_manager_dup' and 'departments_dup'
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

# w/o duplicates 20 records; w/ duplicates returns 25 rows
SELECT
	m.dept_no,
    m.emp_no,
    d.dept_name
FROM dept_manager_dup m
INNER JOIN departments_dup d
ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

# remove duplicates by grouping by 'emp_no' 
# (the field that differs most among records)
SELECT
	m.dept_no,
    m.emp_no,
    d.dept_name
FROM dept_manager_dup m
INNER JOIN departments_dup d
ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;