-- Function definition taken from User-Defined Functions lesson
USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
BEGIN
	DECLARE v_avg_salary DECIMAL(10,2);
    
    BEGIN
		DECLARE v_avg_salary_2 DECIMAL(10,2);
    END;
    
    SELECT
		AVG(s.salary)
	INTO v_avg_salary_2 FROM
		employees e
			JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.emp_no = p_emp_no;
        
	-- Returns an error
	RETURN v_avg_salary_2;
END$$

DELIMITER ;

-- Returns error
SELECT v_avg_salary