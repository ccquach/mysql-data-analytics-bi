# Get average salary of each department manager
SELECT 
    m.dept_no,
    d.dept_name,
    ROUND(AVG(s.salary)) AS average_salary
FROM
    dept_manager m
        JOIN
    salaries s ON m.emp_no = s.emp_no
        AND m.from_date = s.from_date
        JOIN
    departments d ON m.dept_no = d.dept_no
GROUP BY m.dept_no
HAVING average_salary > 60000
ORDER BY average_salary DESC
;

# Exercises
SELECT 
    e.gender, COUNT(m.emp_no) AS manager_count
FROM
    dept_manager m
        JOIN
    employees e ON m.emp_no = e.emp_no
GROUP BY e.gender
;