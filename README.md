# sql-challenge
Module 9 Challenge


# DATA MODELING
## Natalie's Table Schema

Departments
-
dept_no string PK
dept_name varchar(200)

DeptEmp
-
emp_no int PK FK >- Employees.emp_no
dept_no string PK FK >- Departments.dept_no

DeptManager
-
dept_no string PK FK >- Departments.dept_no
emp_no int PK FK >- Employees.emp_no

Employees
-
emp_no int PK FK >- Salaries.emp_no
emp_title_id string FK >- Titles.title_id
birth_date date
first_name varchar(200)
last_name varchar(200)
sex char(1)
hire_date date

Titles
-
title_id string FK
title varchar(200)

Salaries
-
emp_no int PK 
salary int

# DATA ENGINEERING
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

# DATA ANALYSIS
-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM
    Employees e
JOIN
    Salaries s ON e.emp_no = s.emp_no;
	
-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT
    first_name,
    last_name,
    hire_date
FROM
    Employees
WHERE
    EXTRACT(YEAR FROM hire_date) = 1986;
	
-- 3. List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.

SELECT
    d.dept_no,
    d.dept_name,
    dm.emp_no,
    e.last_name,
    e.first_name
FROM
    Departments d
JOIN
    Dept_Manager dm ON d.dept_no = dm.dept_no
JOIN
    Employees e ON dm.emp_no = e.emp_no;
	
-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.

SELECT
    de.dept_no,
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    Employees e
JOIN
    Dept_Emp de ON e.emp_no = de.emp_no
JOIN
    Departments d ON de.dept_no = d.dept_no;
	
-- 5. List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.

SELECT
    first_name,
    last_name,
    sex
FROM
    Employees
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT
    e.emp_no,
    e.last_name,
    e.first_name
FROM
    Employees e
JOIN
    Dept_Emp de ON e.emp_no = de.emp_no
JOIN
    Departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';
	
-- 7. List each employee in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    Employees e
JOIN
    Dept_Emp de ON e.emp_no = de.emp_no
JOIN
    Departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');
	
-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).

SELECT
    last_name,
    COUNT(*) AS frequency
FROM
    Employees
GROUP BY
    last_name
ORDER BY
    frequency DESC;
