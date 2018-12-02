# Exercises - set up duplicate tables

/*
	departments_dup
*/
# Modify schema
ALTER TABLE departments_dup
DROP COLUMN dept_manager;

# Modify constraints
ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(40) NULL;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

# Modify records
INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');

DELETE FROM departments_dup
WHERE dept_no = 'd002';

INSERT INTO departments_dup (dept_no)
VALUES ('d010'), ('d011');

# View changes
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

/*
	dept_manager_dup
*/
DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
	emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES (999904, '2017-01-01'),
       (999905, '2017-01-01'),
	   (999906, '2017-01-01'),
       (999907, '2017-01-01');
       
DELETE FROM dept_manager_dup
WHERE
    dept_no = 'd001';

SELECT 
    *
FROM
    dept_manager_dup;