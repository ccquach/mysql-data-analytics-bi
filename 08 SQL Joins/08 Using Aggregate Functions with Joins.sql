SELECT 
    e.gender, AVG(s.salary) AS average_salary
FROM
    employees e
        LEFT JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;

SELECT 
    e.emp_no, e.gender, AVG(s.salary) AS average_salary
FROM
    employees e
        LEFT JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY e.gender;