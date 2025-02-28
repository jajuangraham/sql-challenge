__List the employee number, last name, first name, sex, and salary of each employee 

SELECT emp_no, last_name, first_name, sex,
	(SELECT salaries.salary
	FROM salaries
	WHERE employees.emp_no = salaries.emp_no) AS "Salary"
FROM employees;

__List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '1986';


__List the manager of each department along with their department number, department name, employee number, last name, and first name 
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no::VARCHAR = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;


__List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no,
    (SELECT d.dept_name
     FROM departments d
     WHERE de.dept_no::VARCHAR = d.dept_no) AS dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no;


__List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'employees';


__List each employee in the Sales department, including their employee number, last name, and first name
SELECT de.emp_no, e.last_name, e.first_name
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
WHERE de.dept_no::VARCHAR = 'd007';


__List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT de.emp_no, e.last_name, e.first_name,
    (SELECT d.dept_name
     FROM departments d
     WHERE CAST(de.dept_no AS VARCHAR) = d.dept_no) AS dept_name
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
WHERE CAST(de.dept_no AS VARCHAR) = 'd007'  -- Sales department
OR CAST(de.dept_no AS VARCHAR) = 'd005';  -- Dev department



__List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS "Count of Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Count of Last Name" DESC;