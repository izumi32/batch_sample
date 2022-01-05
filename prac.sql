SELECT E.emp_id, E.emp_name, E.dept_id, D.dept_name
FROM Employees E INNER JOIN Departments D
ON E.dept_id = D.dept_id;

SELECT E.emp_id, E.emp_name, E.dept_id, D.dept_name
FROM Departments D LEFT OUTER JOIN Employees E
ON E.dept_id = D.dept_id;

SELECT D1.digit * 10 + D2.digit AS num
FROM Digits D1 CROSS JOIN Digits D2
ORDER BY D1.digit, D2.digit;
