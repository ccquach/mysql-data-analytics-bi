SELECT 
    SUM(salary)
FROM
    salaries;
    
# Exercises
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';