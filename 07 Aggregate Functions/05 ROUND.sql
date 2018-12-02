# Round to closest integer
SELECT 
    ROUND(AVG(salary))
FROM
    salaries;
    
# Round to two digits after decimal point
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;
    
# Exercises
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';