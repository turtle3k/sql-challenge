-- Create a new table
CREATE TABLE departments (
	dept_no VARCHAR(5) NOT NULL,
	dept_name VARCHAR(20) NOT NULL
);

-- Insert the data (from CSV, in \data folder), then query all fields
SELECT *
FROM departments;

-- Create tables for the other CSV files
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(5),
	from_date DATE,
	to_date DATE
);

SELECT * FROM dept_emp LIMIT(10);

CREATE TABLE dept_manager (
	emp_no VARCHAR(5),
	dept_no INT,
	from_date DATE,
	to_date DATE
);

SELECT * FROM dept_manager LIMIT(10);
--DROP TABLE dept_manager;

CREATE TABLE employees (
	emp_no INT,
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(25),
	gender VARCHAR(1),
	hire_date DATE
);

SELECT * FROM employees LIMIT(10);

CREATE TABLE salaries (
	emp_no INT,
	salary MONEY,
	from_date DATE,
	to_date DATE
);

SELECT * FROM salaries LIMIT(10);

CREATE TABLE titles (
	emp_no INT,
	title VARCHAR(25),
	from_date DATE,
	to_date DATE
);

SELECT * FROM titles LIMIT(10);

-- Run queries to get requested info
-- 1. Employee details:
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

-- 2. Employees hired in 1986
-- https://www.postgresql.org/message-id/39527922.D0C8E9F2%40austin.rr.com
SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year',hire_date) = 1986;

-- 3. Manager of each department with additional info


-- 4. Department of each employee, employee number, last, first, & dept name


-- 5. All employees whose first name is "Hercules" & last begins w/ "B"
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. Sales dept employees - emp#, last, first & dept name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e, departments AS d
WHERE emp_no IN 
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no
	IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
		)
);

-- 7. Employees in Sales and Development departments
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e, departments AS d
WHERE emp_no IN 
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no
	IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales' OR dept_name = 'Development'
		)
);

-- 8. list frequency count (desc order) of employee last names
SELECT last_name, count(last_name) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;


-- Epilogue
SELECT *
FROM employees
WHERE emp_no = 499942;