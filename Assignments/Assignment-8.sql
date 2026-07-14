-- ===========================================
-- Assignment 8 (MySQL Version)
-- ===========================================

-- ===========================================
-- Create Table
-- ===========================================

CREATE TABLE Employee_Details (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    job_id VARCHAR(20),
    salary DECIMAL(10,2),
    commission_pct DECIMAL(5,2),
    department_id INT,
    hire_date DATE
);

-- ===========================================
-- Insert Data
-- ===========================================

INSERT INTO Employee_Details
(employee_id, first_name, last_name, job_id, salary, commission_pct, department_id, hire_date)
VALUES
(101,'Steven','King','AD_PRES',24000,NULL,90,'2003-06-17'),
(102,'Neena','Kochhar','AD_VP',17000,NULL,90,'2005-09-21'),
(103,'Lex','De Haan','AD_VP',17000,NULL,90,'2001-01-13'),
(104,'Alexander','Hunold','IT_PROG',9000,NULL,60,'2006-01-03'),
(105,'Bruce','Ernst','IT_PROG',6000,NULL,60,'2007-05-21'),
(106,'David','Austin','SA_REP',8000,0.15,80,'2005-06-25'),
(107,'Valli','Pataballa','SA_REP',7000,0.10,80,'2006-02-05'),
(108,'Diana','Lorentz','ST_CLERK',4200,NULL,50,'2007-02-07'),
(109,'Nancy','Greenberg','FI_MGR',12000,NULL,100,'2002-08-17'),
(110,'Daniel','Faviet','ST_CLERK',3500,NULL,50,'2002-08-16'),
(111,'John','Chen','FI_ACCOUNT',8200,NULL,100,'2005-09-28'),
(112,'Ismael','Sciarra','FI_ACCOUNT',7700,NULL,100,'2005-09-30'),
(113,'Jose','Manuel','PU_CLERK',3100,NULL,30,'2007-03-10'),
(114,'Luis','Popp','PU_CLERK',6900,NULL,30,'2007-12-07'),
(115,'Karen','Colmenares','SH_CLERK',2500,NULL,20,'2007-08-10');

SELECT * FROM Employee_Details;

-- ===========================================
-- Question 1
-- ===========================================

SELECT LOWER(first_name) AS first_name
FROM Employee_Details
WHERE department_id IN (20,50,80);

-- ===========================================
-- Question 2
-- ===========================================

SELECT UPPER(last_name) AS last_name
FROM Employee_Details
WHERE department_id IN (10,110,60);

-- ===========================================
-- Question 3
-- ===========================================

SELECT CONCAT(
UPPER(LEFT(LOWER(job_id),1)),
LOWER(SUBSTRING(job_id,2,1)),
'_',
UPPER(LEFT(SUBSTRING(job_id,4),1)),
LOWER(SUBSTRING(job_id,5))
) AS job_id
FROM Employee_Details;

-- ===========================================
-- Question 4
-- ===========================================

SELECT CONCAT(first_name,' ',last_name) AS Name
FROM Employee_Details;

-- ===========================================
-- Question 5
-- ===========================================

SELECT last_name,
LENGTH(last_name) AS length
FROM Employee_Details
WHERE commission_pct IS NOT NULL;

-- ===========================================
-- Question 6
-- ===========================================

SELECT first_name,
LOCATE('a',LOWER(first_name)) AS position_of_a
FROM Employee_Details;

-- ===========================================
-- Question 7
-- ===========================================

SELECT
CONCAT(first_name,' ',last_name) AS employee_name,
LENGTH(last_name) AS last_name_length,
LOCATE('a',LOWER(last_name)) AS position_of_a
FROM Employee_Details
WHERE job_id LIKE '%CLERK%';

-- ===========================================
-- Question 8
-- ===========================================

SELECT
LPAD(CAST(salary AS CHAR),10,'$') AS left_padded_salary,
RPAD(CAST(salary AS CHAR),10,'$') AS right_padded_salary
FROM Employee_Details;

-- ===========================================
-- Question 9
-- ===========================================

SELECT
first_name,
TRIM(BOTH 'e' FROM first_name) AS Trimmed
FROM Employee_Details
WHERE LOWER(first_name) LIKE '%e%';

-- ===========================================
-- Question 10
-- ===========================================

SELECT department_id,
salary,
hire_date
FROM Employee_Details
WHERE LENGTH(first_name)=6;

-- ===========================================
-- Question 11
-- ===========================================

SELECT
job_id,
LOCATE('e',LOWER(first_name)) AS position_of_e
FROM Employee_Details
WHERE LOWER(first_name) LIKE '%e%';

-- ===========================================
-- Question 12
-- ===========================================

SELECT last_name
FROM Employee_Details
WHERE SUBSTRING(job_id,4,3)='REP';

-- ===========================================
-- Question 13
-- ===========================================

SELECT employee_id,
MOD(salary,3000) AS remainder
FROM Employee_Details
WHERE job_id='SA_REP';

-- ===========================================
-- Question 14
-- ===========================================

SELECT CONCAT('$',FORMAT(salary,2)) AS salary
FROM Employee_Details;

-- ===========================================
-- Question 15
-- ===========================================

SELECT CONCAT('$',FORMAT(salary,0)) AS salary
FROM Employee_Details
WHERE department_id IN (60,90,110);

-- ===========================================
-- Question 16
-- ===========================================

SELECT
last_name,
IFNULL(CAST(commission_pct AS CHAR),'No Commission') AS COMM
FROM Employee_Details;

-- ===========================================
-- Question 17
-- ===========================================

SELECT
employee_id,
ROUND(DATEDIFF(CURDATE(),hire_date)) AS days_elapsed
FROM Employee_Details;

-- ===========================================
-- Question 18
-- ===========================================

SELECT
employee_id,
ROUND(DATEDIFF(CURDATE(),hire_date)/7,2) AS weeks_elapsed
FROM Employee_Details;

-- ===========================================
-- Question 19
-- ===========================================

SELECT
employee_id,
ROUND(DATEDIFF(CURDATE(),hire_date)/365) AS years_elapsed
FROM Employee_Details;

-- ===========================================
-- Question 20
-- ===========================================

SELECT
CONCAT(first_name,' ',last_name) AS employee_name,
TIMESTAMPDIFF(MONTH,hire_date,CURDATE()) AS MONTHS_WORKED
FROM Employee_Details;

-- ===========================================
-- Question 21
-- ===========================================

SELECT
CONCAT(first_name,' ',last_name) AS employee_name,
LAST_DAY(hire_date) AS last_day
FROM Employee_Details;

-- ===========================================
-- Question 22
-- ===========================================

SELECT
CONCAT(first_name,' ',last_name) AS employee_name,
YEAR(hire_date) AS hire_year
FROM Employee_Details;

-- ===========================================
-- Question 23
-- ===========================================

SELECT DATE_ADD(CURDATE(), INTERVAL 5 MONTH) AS FUTURE_DATE;

-- ===========================================
-- Question 24
-- ===========================================

SELECT
CONCAT(first_name,' ',last_name) AS name,
DAYNAME(hire_date) AS day,
hire_date AS joining_date
FROM Employee_Details;

-- ===========================================
-- Question 25
-- ===========================================

SELECT
employee_id,
(salary*12 + IFNULL(commission_pct,0)) AS annual_salary,
ROUND((salary*12 + IFNULL(commission_pct,0)),2) AS rounded_annual_salary
FROM Employee_Details;