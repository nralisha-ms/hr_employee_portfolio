USE hr_employee_portfolio;

----------------------------------------------------------------------------------------
-- Step 1: Basic HR analysis
----------------------------------------------------------------------------------------

-- Query 1: Total employees
SELECT
	COUNT(*) AS total_employees
FROM employees;
-- This query calculates the total number of employees.

-- Query 2: Active vs resigned employees
SELECT
	employment_status,
    COUNT(*) AS total_employees
FROM employees
GROUP BY employment_status;
-- This query compares active and resigned employees 

-- Query 3: Employees by department
SELECT
	d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM departments d
JOIN employees e
	ON d.department_id = e.department_id
GROUP BY d.department_name;
-- This query shows headcount by department, helping HR and maangement understand the workforce distribution

-- Query 4: Employees by office location
SELECT
	o.office_city,
    o.country,
    COUNT(e.employee_id) AS total_employee
FROM offices o
JOIN employees e
	ON o.office_id = e.office_id
GROUP BY o.office_city, o.country;
-- This query help analyze the employee distribution by office location to support workforce planning and office capacity decision.

----------------------------------------------------------------------------------------
-- Step 2: Self-join for manager hierarchy
----------------------------------------------------------------------------------------

-- Query 5: Employee and manager relationship
SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.job_title AS employee_job_title,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    m.job_title AS manager_job_title
FROM employees e
LEFT JOIN employees m
    ON e.reports_to = m.employee_id
ORDER BY manager_name, employee_name;
-- This query uses a self-join to match each employee with their manager using the reports_to field.

-- Query 6: Direct reports by manager
SELECT
	CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    m.job_title AS manager_job_title,
    COUNT(e.employee_id) AS total_direct_reports
FROM employees m
JOIN employees e
	ON m.employee_id = e.reports_to
GROUP BY manager_name, manager_job_title
ORDER BY total_direct_reports DESC;
-- This query counts the number of direct reports under each manager. It helps identify workload on each manager.alter

----------------------------------------------------------------------------------------
-- Step 7: Salary analysis
----------------------------------------------------------------------------------------

-- Query 7: Average salary by department
SELECT
	d.department_name,
    ROUND(AVG(e.salary), 2) AS avg_salary
FROM employees e
JOIN departments d
	ON e.department_id=d.department_id
WHERE e.employment_status = 'Active'
GROUP BY d.department_name
ORDER BY avg_salary DESC;
-- This query calculates average active employee salary by department to compare compensation levels accross organisation

-- Query 8: Total salary cost by department
SELECT
	d.department_name,
    COUNT(e.employee_id) AS active_headcount,
    ROUND(SUM(e.salary), 2) AS total_monthly_salary_cost
FROM employees e
JOIN departments d
	ON e.department_id = d.department_id
WHERE e.employment_status = 'Active'
GROUP BY d.department_name
ORDER BY total_monthly_salary_cost DESC;
-- This query calculates active headcount and total monthly salary by departments

-- Query 9: Highest paid employees
SELECT
	employee_id,
    CONCAT(first_name,' ',last_name) AS employee_name,
    job_title,
    salary
FROM employees
WHERE employment_status = 'Active'
ORDER BY salary DESC
LIMIT 10;
-- This query identifies the top 10 highest paid active employees in the organization

-- Query 10: Employees earning above department above average
WITH department_avg_salary AS (
	SELECT
		department_id,
        avg(salary) AS avg_department_salary
	FROM employees
    WHERE employment_status = 'Active'
    GROUP BY department_id
)

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.job_title,
    d.department_name,
    e.salary,
    ROUND(das.avg_department_salary, 2) AS avg_department_salary
FROM employees e
JOIN department_avg_salary das
    ON e.department_id = das.department_id
JOIN departments d
    ON e.department_id = d.department_id
WHERE e.employment_status = 'Active'
  AND e.salary > das.avg_department_salary
ORDER BY d.department_name, e.salary DESC;
-- This query help identifies employees earning above their department average using CTE function.

----------------------------------------------------------------------------------------
-- Step 8: Salary band classification
----------------------------------------------------------------------------------------

-- Query 11: Salary band using case when
SELECT
	employee_id,
    CONCAT(first_name,' ',last_name) AS employee_name,
    job_title,
    salary,
    CASE
		WHEN salary >=13000 THEN 'Director Level'
        WHEN salary >=9000 THEN 'Manager Level'
        WHEN salary >=6000 THEN 'Senior Level'
		WHEN salary >=4000 THEN 'Associate Level'
        ELSE 'Junior Level'
	END AS salary_band
FROM employees
WHERE employment_status = 'Active'
ORDER BY salary DESC;
-- This query classifies employees into salary bands using CASE WHEN logic. It helps workforce segmentation and compensation analysis.

-- Query 12: Match employees to job grades
SELECT
	e.employee_id,
    CONCAT(e.first_name,' ',e.last_name) AS employee_name,
    e.job_title,
    e.salary,
    jg.grade_name
FROM employees e
JOIN job_grades jg
	ON e.salary BETWEEN jg.min_salary AND jg.max_salary
WHERE e.employment_status = 'Active'
ORDER BY e.salary DESC;
-- This query joins employees to job grafe ranges based on salary. It demonstrates range-based joining and compensation classification.

----------------------------------------------------------------------------------------
-- Step 9: Window function queries
----------------------------------------------------------------------------------------

-- Query 13: Rank employees by salary within department
SELECT
	d.department_name,
    CONCAT(e.first_name,' ',e.last_name) AS employee_name,
    e.job_title,
    e.salary,
    RANK() OVER(
		PARTITION BY d.department_name
        ORDER BY e.salary DESC
	) AS salary_rank_in_department
FROM employees e
JOIN departments d
	ON e.department_id=d.department_id
WHERE e.employment_status = 'Active'
ORDER BY d.department_name, salary_rank_in_department;
-- This query uses a window function to rank employees by salary within each department

-- Query 14: Department salary contribution percentage
WITH department_salary AS (
    SELECT
        d.department_name,
        SUM(e.salary) AS department_salary_cost
    FROM employees e
    JOIN departments d
        ON e.department_id = d.department_id
    WHERE e.employment_status = 'Active'
    GROUP BY d.department_name
)
SELECT
    department_name,
    ROUND(department_salary_cost, 2) AS department_salary_cost,
    ROUND(
        department_salary_cost * 100.0 / SUM(department_salary_cost) OVER (),2
    ) AS salary_cost_percentage
FROM department_salary
ORDER BY salary_cost_percentage DESC;
-- This query analyzes hiring trends by department and year, showing where workforce expansion occurred.

----------------------------------------------------------------------------------------
-- Step 10: Hiring trend analysis
----------------------------------------------------------------------------------------

-- Query 15:  Employees hired by year
SELECT
	YEAR(hire_date) AS hire_year,
    COUNT(employee_id) AS total_hires
FROM employees
GROUP BY hire_date
ORDER BY hire_year;
-- This query shows employee hiring trends by year, helping HR understand workforce growth over time.

-- Query 16: Employees hired by department and year
SELECT
	YEAR(e.hire_date) AS hire_year,
    d.department_name,
    COUNT(e.employee_id) AS total_hires
FROM employees e
JOIN departments d
	ON e.department_id = d.department_id
GROUP BY hire_year, department_name
ORDER BY hire_year, total_hires DESC;
-- This query analyzes hiring trends by department and year, showing where workforce expansion occurred.

----------------------------------------------------------------------------------------
-- Step 11: Final advanced HR summary query
----------------------------------------------------------------------------------------

-- Query 17: Department workforce and salary summary
WITH department_summary AS (
    SELECT
        d.department_name,
        COUNT(e.employee_id) AS total_employees,
        SUM(CASE WHEN e.employment_status = 'Active' THEN 1 ELSE 0 END) AS active_employees,
        SUM(CASE WHEN e.employment_status = 'Resigned' THEN 1 ELSE 0 END) AS resigned_employees,
        ROUND(AVG(CASE WHEN e.employment_status = 'Active' THEN e.salary END), 2) AS avg_active_salary,
        ROUND(SUM(CASE WHEN e.employment_status = 'Active' THEN e.salary ELSE 0 END), 2) AS total_active_salary_cost
    FROM employees e
    JOIN departments d
        ON e.department_id = d.department_id
    GROUP BY d.department_name
)

SELECT
    department_name,
    total_employees,
    active_employees,
    resigned_employees,
    avg_active_salary,
    total_active_salary_cost,
    RANK() OVER (ORDER BY total_active_salary_cost DESC) AS salary_cost_rank
FROM department_summary
ORDER BY salary_cost_rank;
-- This query summarizes workforce and salary performance by department, including total employees, active employees, resigned employees, average salary, total salary cost, and salary cost ranking.


