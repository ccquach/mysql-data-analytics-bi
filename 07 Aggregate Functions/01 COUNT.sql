SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    COUNT(salary)
FROM
    salaries;
    
SELECT 
    COUNT(from_date)
FROM
    salaries;
    
SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;
    
# Asterisk counts all values, INCLUDING null (null excluded by default)
SELECT 
    COUNT(*)
FROM
    salaries;
    
# Exercises
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;