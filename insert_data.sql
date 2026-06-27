-- Step 1: Create database

CREATE DATABASE hr_employee_portfolio;
USE hr_employee_portfolio; 

-- Step 2: Create tables

CREATE TABLE offices (
    office_id INT PRIMARY KEY,
    office_city VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    job_title VARCHAR(100),
    department_id INT,
    office_id INT,
    reports_to INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    employment_status VARCHAR(50),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (office_id) REFERENCES offices(office_id),
    FOREIGN KEY (reports_to) REFERENCES employees(employee_id)
);

CREATE TABLE job_grades (
    grade_id INT PRIMARY KEY,
    grade_name VARCHAR(50),
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2)
);

-- Step 3: Insert dummy data

INSERT INTO offices VALUES
(1, 'Kuala Lumpur', 'Malaysia'),
(2, 'Penang', 'Malaysia'),
(3, 'Johor Bahru', 'Malaysia'),
(4, 'Singapore', 'Singapore');

INSERT INTO departments VALUES
(1, 'Executive Management'),
(2, 'Human Resource'),
(3, 'Finance'),
(4, 'Information Technology'),
(5, 'Sales'),
(6, 'Customer Support');

INSERT INTO job_grades VALUES
(1, 'Junior', 2500.00, 3999.99),
(2, 'Associate', 4000.00, 5999.99),
(3, 'Senior', 6000.00, 8999.99),
(4, 'Manager', 9000.00, 12999.99),
(5, 'Director', 13000.00, 20000.00);

INSERT INTO employees VALUES
(1001, 'Amira', 'Hassan', 'Chief Executive Officer', 1, 1, NULL, 18000.00, '2020-01-15', 'Active'),
(1002, 'Daniel', 'Lee', 'HR Director', 2, 1, 1001, 13500.00, '2020-03-01', 'Active'),
(1003, 'Mei', 'Tan', 'Finance Director', 3, 1, 1001, 14000.00, '2020-04-10', 'Active'),
(1004, 'Ravi', 'Kumar', 'IT Director', 4, 1, 1001, 15000.00, '2020-05-20', 'Active'),
(1005, 'Sarah', 'Ismail', 'Sales Director', 5, 1, 1001, 14500.00, '2020-06-12', 'Active'),
(1006, 'Aiman', 'Rahman', 'HR Manager', 2, 1, 1002, 9500.00, '2021-01-05', 'Active'),
(1007, 'Farah', 'Yusof', 'Finance Manager', 3, 2, 1003, 9800.00, '2021-02-08', 'Active'),
(1008, 'Jason', 'Lim', 'IT Manager', 4, 1, 1004, 10500.00, '2021-03-15', 'Active'),
(1009, 'Nurul', 'Aziz', 'Sales Manager', 5, 3, 1005, 9700.00, '2021-04-18', 'Active'),
(1010, 'Hakim', 'Omar', 'Support Manager', 6, 2, 1004, 9200.00, '2021-05-22', 'Active'),
(1011, 'Liyana', 'Zain', 'HR Executive', 2, 1, 1006, 5200.00, '2022-01-10', 'Active'),
(1012, 'Adam', 'Wong', 'Payroll Executive', 2, 1, 1006, 4800.00, '2022-02-14', 'Active'),
(1013, 'Kavitha', 'Nair', 'Accountant', 3, 2, 1007, 5600.00, '2022-03-20', 'Active'),
(1014, 'Imran', 'Salleh', 'Financial Analyst', 3, 2, 1007, 6200.00, '2022-04-11', 'Active'),
(1015, 'Nadia', 'Kamal', 'Data Analyst', 4, 1, 1008, 6500.00, '2022-05-09', 'Active'),
(1016, 'Wei', 'Chen', 'Software Engineer', 4, 1, 1008, 7200.00, '2022-06-16', 'Active'),
(1017, 'Sofia', 'Rahim', 'Network Engineer', 4, 4, 1008, 7600.00, '2022-07-25', 'Active'),
(1018, 'Arif', 'Hamid', 'Sales Executive', 5, 3, 1009, 5000.00, '2022-08-02', 'Active'),
(1019, 'Mira', 'Jalil', 'Account Executive', 5, 3, 1009, 5400.00, '2022-09-06', 'Active'),
(1020, 'Ben', 'Tan', 'Support Analyst', 6, 2, 1010, 4200.00, '2022-10-12', 'Active'),
(1021, 'Hana', 'Yee', 'Support Analyst', 6, 2, 1010, 4300.00, '2022-11-18', 'Active'),
(1022, 'Rafiq', 'Azman', 'Junior Developer', 4, 1, 1008, 3800.00, '2023-01-09', 'Active'),
(1023, 'Chloe', 'Ng', 'Marketing Sales Associate', 5, 4, 1009, 4600.00, '2023-02-13', 'Active'),
(1024, 'Yusof', 'Ibrahim', 'HR Assistant', 2, 1, 1006, 3200.00, '2023-03-17', 'Active'),
(1025, 'Priya', 'Menon', 'Finance Assistant', 3, 2, 1007, 3500.00, '2023-04-21', 'Resigned');

-- Step 4: Validate data

SELECT * FROM offices;
SELECT * FROM departments;
SELECT * FROM job_grades;
SELECT * FROM employees;

-- Step 5: Check row counts

SELECT 'offices' AS table_name, COUNT(*) AS total_rows FROM offices
UNION ALL
SELECT 'departments', COUNT(*) FROM departments
UNION ALL
SELECT 'job_grades', COUNT(*) FROM job_grades
UNION ALL
SELECT 'employees', COUNT(*) FROM employees;



