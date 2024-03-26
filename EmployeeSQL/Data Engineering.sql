-- Create New Table 1
CREATE TABLE Departments (
	dept_no VARCHAR,
	dept_name VARCHAR
);

select *
from departments
limit 5;

-- Create New Table 2
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR
);

select *
from dept_emp
limit 5;

-- Create New Table 3
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT
);

select *
from dept_manager
limit 5;

-- Create New Table 4
CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

select *
from employees
limit 5;

-- Create New Table 5
CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

select *
from salaries
limit 5;

-- Create New Table 6
CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
);

select *
from titles