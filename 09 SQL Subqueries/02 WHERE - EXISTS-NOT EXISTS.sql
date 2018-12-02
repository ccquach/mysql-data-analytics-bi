SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager m
        WHERE
            m.emp_no = e.emp_no)
;

# Bad practice to sort queries preceding final version of dataset
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager m
        WHERE
            m.emp_no = e.emp_no
        ORDER BY emp_no)
;

# Good practice to sort final version of dataset
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager m
        WHERE
            m.emp_no = e.emp_no)
ORDER BY emp_no
;

# Exercises
SELECT 
    e.*
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            titles t
        WHERE
            t.emp_no = e.emp_no
                AND t.title = 'Assistant Engineer')
;