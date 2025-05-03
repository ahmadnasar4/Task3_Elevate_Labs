select * from employees;


--1. SELECT, WHERE, ORDER BY, GROUP BY--


-- SELECT all employees with salary greater than 60,000, ordered by hire date
SELECT first_name, last_name, salary, hire_date
FROM employees
WHERE salary > 60000
ORDER BY hire_date;

-- SELECT the total salary by department
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC;





--2. JOINS (INNER, LEFT, RIGHT)--


-- INNER JOIN between employees and departments on department_id
SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- LEFT JOIN to get all employees and their department, even if no department
SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

-- RIGHT JOIN to get all departments and the employees working in them, even if no employees
SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;





--3. Subqueries--

-- Subquery: Get employees whose salary is higher than the average salary
SELECT first_name, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);







--4. Aggregate Functions (SUM, AVG)--

-- Use SUM to calculate total salary for each department
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- Use AVG to calculate the average salary across all employees
SELECT AVG(salary) AS average_salary
FROM employees;





--5. Create Views for Analysis --


-- Create a view to analyze employee salaries
CREATE VIEW employee_salary_view AS
SELECT first_name, last_name, salary, department_id
FROM employees;

-- Query the view for employees with salary above average
SELECT * FROM employee_salary_view
WHERE salary > (SELECT AVG(salary) FROM employee_salary_view);




--6. Optimize Queries with Indexes--

-- Create an index on department_id to speed up queries involving department_id
CREATE INDEX idx_department_id ON employees(department_id);

-- Create an index on salary to speed up queries involving salary
CREATE INDEX idx_salary ON employees(salary);







