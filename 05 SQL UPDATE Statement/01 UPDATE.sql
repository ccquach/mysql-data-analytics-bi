SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999909;
    
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

# WHERE clause important - if excluded, all records updated!
SET autocommit=0;
START TRANSACTION;
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;
    
-- Save dataset as we see it (so we can rollback after example)
COMMIT;

-- Exclude WHERE clause to see results (expect all records to be updated)
UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';
    
-- Revert to last commit
ROLLBACK;

-- Rebuild dup table if ROLLBACK fails
TRUNCATE TABLE departments_dup;

INSERT INTO departments_dup (dept_no, dept_name)
SELECT *
FROM departments;

# Exercises
SELECT 
    *
FROM
    departments
ORDER BY dept_no DESC;

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_name = 'Business Analysis';