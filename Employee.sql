-- Create the Employees table
CREATE TABLE employees (
    emp_no SERIAL PRIMARY KEY,
    emp_title_id VARCHAR(5),
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1),
    hire_date DATE
);

-- Create the Salaries table
CREATE TABLE salaries (
    emp_no INT,
    salary INT,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create the Titles table
CREATE TABLE titles (
    title_id VARCHAR(5) NOT NULL PRIMARY KEY,
    title VARCHAR(50)
);

-- Create the Departments table
CREATE TABLE departments (
    dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create the Dept_Manager table with a named composite primary key constraint
CREATE TABLE dept_manager (
    dept_no VARCHAR(5),
    emp_no INT,
    CONSTRAINT dept_mgr_pk PRIMARY KEY(emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create the Dept_Emp table with a named composite primary key constraint
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(5),
    CONSTRAINT dept_emp_p PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


--Data Analysis
--List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    e.sex, 
    s.salary
FROM 
    employees e
JOIN 
    salaries s ON e.emp_no = s.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT 
    first_name, 
    last_name, 
    hire_date
FROM 
    employees
WHERE 
    EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    dm.dept_no, 
    d.dept_name, 
    dm.emp_no, 
    e.last_name, 
    e.first_name
FROM 
    dept_manager dm
JOIN 
    employees e ON dm.emp_no = e.emp_no
JOIN 
    departments d ON dm.dept_no = d.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
    de.dept_no, 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    d.dept_name
FROM 
    dept_emp de
JOIN 
    employees e ON de.emp_no = e.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT 
    first_name, 
    last_name, 
    sex
FROM 
    employees
WHERE 
    first_name = 'Hercules' 
    AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name, 
    d.dept_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT 
    last_name, 
    COUNT(*) AS frequency
FROM 
    employees
GROUP BY 
    last_name
ORDER BY 
    frequency DESC;
