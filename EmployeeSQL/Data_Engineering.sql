create table titles(
	titles_id varchar(10) Primary key,
	title varchar(50) Not null
);

select * from titles;


CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    birth_date VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

select * from employees;


CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

Select * from salaries;

Create table departments (
	dept_no varchar(10) primary key,
	dept_name varchar(50) not null
);

select * from departments;

Create table dept_emp (
	emp_no integer not null,
			foreign key (emp_no) references employees(emp_no),
	dept_no varchar(10) not null,
			foreign key (dept_no) references departments(dept_no)
			
);

select * from dept_emp;

create table dept_manager (
	dept_no varchar(10) not null,
			foreign key (dept_no) references departments(dept_no),
	emp_no integer primary key,
			foreign key (emp_no) references employees(emp_no)
			
);

select * from dept_manager