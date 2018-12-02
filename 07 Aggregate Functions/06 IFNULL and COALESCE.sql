SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

# Modify departments_dup table and insert data
ALTER TABLE departments_dup
MODIFY dept_name VARCHAR(40) NULL;

ALTER TABLE departments_dup
ADD COLUMN dept_manager VARCHAR(40) NULL;

UPDATE departments_dup 
SET 
    dept_name = NULL
WHERE
    dept_no = 'd010';
    
INSERT INTO departments_dup (dept_no)
VALUES ('d011');

# IFNULL()
SELECT 
    dept_no,
    IFNULL(dept_name, 'Dept name not provided') AS dept_name
FROM
    departments_dup
ORDER BY dept_no;

# COALESCE()
SELECT 
    dept_no,
    COALESCE(dept_name, 'Dept name not provided') AS dept_name
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup
ORDER BY dept_no;

# Use COALESCE to create placeholder values
SELECT 
    dept_no, dept_name, COALESCE('dept manager name') AS fake_col
FROM
    departments_dup;
    
# Exercises
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name, 'Dept name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no;