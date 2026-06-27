\# HR Employee Analysis Using SQL



\## Project Overview



This project analyzes HR employee data using SQL and dummy workforce datasets. The analysis focuses on evaluating workforce distribution, employee hierarchy, salary structure, department performance, and hiring trends to support human resource and management decision-making.



The project simulates a real-world HR management system using relational database design and business-focused SQL analysis.



\---



\## Objectives



\* Analyze workforce distribution across departments and office locations

\* Identify employee-manager reporting relationships

\* Evaluate salary distribution and department payroll costs

\* Classify employees into salary grades

\* Analyze hiring trends over time

\* Generate HR insights using SQL



\---



\## Dataset Overview



The project uses dummy HR data with 4 relational tables:



\* offices

\* departments

\* employees

\* job\_grades



\---



\## Tools \& Technologies



\* MySQL

\* SQL

\* GitHub

\* Relational Database Design



\---



\## SQL Concepts Used



\* SELECT

\* WHERE

\* JOINs

\* LEFT JOINs

\* Self JOIN

\* BETWEEN

\* GROUP BY

\* ORDER BY

\* COUNT

\* SUM

\* AVG

\* CASE WHEN

\* Common Table Expressions (CTEs)

\* Window Functions

\* Ranking Functions

\* Salary Classification

\* Workforce KPI Calculations



\---



\## Database Schema



!\[ER Diagram](screenshots/er\_diagram.png)



\---



\## Project Structure



```text

HR-Employee-Analysis/

│

├── README.md

├── schema.sql

├── insert\_data.sql

├── analysis\_queries.sql

├── insights.md

│

└── screenshots/

&#x20;   ├── er\_diagram.png

&#x20;   ├── workforce\_summary.png

&#x20;   ├── employees\_by\_department.png

&#x20;   ├── employee\_manager\_hierarchy.png

&#x20;   ├── direct\_reports\_by\_manager.png

&#x20;   ├── average\_salary\_by\_department.png

&#x20;   ├── salary\_rank\_by\_department.png

&#x20;   └── department\_workforce\_salary\_summary.png

```



\---



\## Key Analysis \& Results



\### Workforce Summary



Provides an overview of the organization's workforce, including total employees and employment status.



!\[Workforce Summary](screenshots/workforce\_summary.png)



\---



\### Employees by Department



Displays workforce distribution across departments to identify headcount concentration.



!\[Employees by Department](screenshots/employees\_by\_department.png)



\---



\### Employee-Manager Hierarchy



Uses a SQL self join to identify reporting relationships between employees and their managers.



!\[Employee Manager Hierarchy](screenshots/employee\_manager\_hierarchy.png)



\---



\### Direct Reports by Manager



Counts the number of employees reporting directly to each manager to evaluate management span of control.



!\[Direct Reports by Manager](screenshots/direct\_reports\_by\_manager.png)



\---



\### Average Salary by Department



Compares average employee salary across departments to evaluate compensation differences.



!\[Average Salary by Department](screenshots/average\_salary\_by\_department.png)



\---



\### Salary Ranking by Department



Ranks employees by salary within each department using SQL window functions.



!\[Salary Ranking](screenshots/salary\_rank\_by\_department.png)



\---



\### Final Department Workforce \& Salary Summary



Comprehensive department-level workforce analysis including:



\* total employees

\* active employees

\* resigned employees

\* average salary

\* total salary cost

\* salary cost ranking



!\[Department Workforce Summary](screenshots/department\_workforce\_salary\_summary.png)



\---



\## Business Insights



\* Workforce distribution highlights departments with the highest staffing levels.

\* Self-join analysis provides a clear reporting hierarchy between employees and managers.

\* Salary analysis identifies departments with higher payroll costs and compensation levels.

\* Salary ranking helps compare employee compensation within the same department.

\* Hiring trend analysis supports workforce planning and future recruitment strategies.

\* Department salary cost analysis enables management to better understand payroll allocation across the organization.



\---



\## Business Recommendations



\* Monitor department headcount to ensure balanced workforce allocation.

\* Review departments with high payroll costs to optimize resource planning.

\* Evaluate manager span of control to maintain effective team structures.

\* Use salary band analysis to support fair compensation and promotion planning.

\* Track hiring trends regularly to improve long-term workforce planning.



\---



\## Future Improvements



\* Develop an interactive HR dashboard using Power BI

\* Integrate employee performance evaluation data

\* Add employee turnover and attrition analysis

\* Implement stored procedures and database triggers

\* Build predictive models for employee attrition using Python



\---



\## Author



Ash — Data Analytics Graduate focused on SQL, Business Intelligence, and IT Analytics.



