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
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date 
FROM dept_manager dm
JOIN employees e
ON (dm.emp_no = e.emp_no)
JOIN departments d
ON (dm.dept_no = d.dept_no)
ORDER BY dept_no;

-- 4. Department of each employee, employee number, last, first, & dept name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e
ON (de.emp_no = e.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no);

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