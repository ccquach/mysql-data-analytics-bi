USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
BEGIN
	DECLARE v_avg_salary DECIMAL(10,2);
    
    SELECT
		AVG(s.salary)
	INTO v_avg_salary FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.emp_no = p_emp_no;
        
	RETURN v_avg_salary;
END$$

DELIMITER ;

-- Test function
SELECT f_emp_avg_salary(11300);

-- Invoke function as column inside SELECT statement
SET @v_emp_no = 11300;
SELECT
	emp_no,
    first_name,
    last_name,
    f_emp_avg_salary(@v_emp_no) AS avg_salary
FROM 
	employees
WHERE 
	emp_no = @v_emp_no
;

SELECT
	emp_no,
    first_name,
    last_name,
    f_emp_avg_salary(emp_no) AS avg_salary
FROM 
	employees
LIMIT 100
;

/*
  Error when creating function: 
  This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in its declaration and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)
*/
SET GLOBAL log_bin_trust_function_creators = 1;



# Exercises
USE employees;
DROP FUNCTION IF EXISTS f_emp_info;

DELIMITER $$
CREATE FUNCTION f_emp_info (p_first_name VARCHAR(14), p_last_name VARCHAR(16)) RETURNS DECIMAL(10,2)
BEGIN
	DECLARE v_salary DECIMAL(10,2);
    
    SELECT
		s.salary
	INTO v_salary FROM
		employees e
			JOIN
		(
			SELECT
				emp_no,
				MAX(from_date) AS max_from_date
			FROM
				salaries
			GROUP BY emp_no
		) AS d ON e.emp_no = d.emp_no
			JOIN
		salaries s ON e.emp_no = s.emp_no AND s.from_date = d.max_from_date
	WHERE
		e.first_name =  p_first_name AND e.last_name = p_last_name
	;

	RETURN v_salary;
END$$

DELIMITER ;

-- Expect function to return salary = 84672 for emp_no = 10018;
SELECT f_emp_info('Kazuhide', 'Peha');

SELECT * FROM employees LIMIT 100;
SELECT * FROM salaries WHERE emp_no = 10018 ORDER BY from_date DESC;

SELECT
	s.salary
FROM
	employees e
		JOIN
	(
		SELECT
			emp_no,
            MAX(from_date) AS max_from_date
		FROM
			salaries
		GROUP BY emp_no
    ) AS d ON e.emp_no = d.emp_no
		JOIN
	salaries s ON e.emp_no = s.emp_no AND s.from_date = d.max_from_date
WHERE
	e.first_name = 'Kazuhide' AND e.last_name = 'Peha'
;

# Course solution
USE employees;
DROP FUNCTION IF EXISTS f_emp_info;

DELIMITER $$
CREATE FUNCTION f_emp_info (p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10,3)
BEGIN
	DECLARE v_max_from_date DATE;
    DECLARE v_salary DECIMAL(10,2);
    
	SELECT
		MAX(s.from_date)
	INTO v_max_from_date FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE e.first_name = p_first_name 
		AND e.last_name = p_last_name
	;
        
	 SELECT
		s.salary
	 INTO v_salary FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE e.first_name = p_first_name 
		AND e.last_name = p_last_name 
        AND s.from_date = v_max_from_date
	;

	RETURN v_salary;
END$$

DELIMITER ;















