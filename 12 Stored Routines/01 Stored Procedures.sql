USE employees;

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
	SELECT * FROM employees
    LIMIT 1000;
END$$

DELIMITER ;

CALL employees.select_employees();

# Can exclude database name since called "USE employees" earlier
CALL select_employees();

# Delete procedure (no parentheses!)
DROP PROCEDURE select_employees;

# Exercises
DROP PROCEDURE IF EXISTS avg_employee_salary;

DELIMITER $$
CREATE PROCEDURE avg_employee_salary()
BEGIN
	SELECT ROUND(AVG(salary), 2) AS avg_employee_salary
    FROM salaries;
END$$

DELIMITER ;

CALL employees.avg_employee_salary();