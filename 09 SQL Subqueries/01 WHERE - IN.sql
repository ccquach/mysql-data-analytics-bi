SELECT 
    *
FROM
    dept_manager;
    
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            m.emp_no
        FROM
            dept_manager m)
;

# Exercises
SELECT 
    m.*
FROM
    dept_manager m
WHERE
    m.emp_no IN (SELECT 
            e.emp_no
        FROM
            employees e
        WHERE
            e.hire_date BETWEEN '1990-01-01' AND '1995-01-01')
;