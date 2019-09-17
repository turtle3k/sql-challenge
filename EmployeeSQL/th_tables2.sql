-- Create the first table
DROP TABLE employees;
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

-- Insert the data (from CSV, in \data folder), then query all fields
SELECT * FROM employees LIMIT(10);


-- Create tables for the other CSV files
DROP TABLE departments
CREATE TABLE departments (
	dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(20) NOT NULL
);

-- Insert the data (from CSV, in \data folder), then query all fields
SELECT * FROM departments;

-- Create the next table
DROP TABLE dept_emp;
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp LIMIT(10);

DROP TABLE dept_manager;
CREATE TABLE dept_manager (
	dept_no VARCHAR(5) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp LIMIT(20);

DROP TABLE salaries;
CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	salary MONEY NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries LIMIT(10);

DROP TABLE titles;
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(25) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM titles LIMIT(10);

