-- Create EMP table
CREATE TABLE EMP (
    E_ID INT PRIMARY KEY,
    FNAME VARCHAR(30) NOT NULL,
    LNAME VARCHAR(30) NOT NULL,
    HIRE_DATE DATE NOT NULL,
    JOB_ID VARCHAR(20) NOT NULL,
    SAL DECIMAL(8,2) NOT NULL,
    DEPT_ID INT CHECK (DEPT_ID >= 10)
);

SELECT * FROM EMP;

-- Insert records
INSERT INTO EMP VALUES
(198, 'Donald', 'Connell', '1999-06-21', 'SH_CLERK', 2600, 50),

(199, 'Douglas', 'Grant', '1998-01-13', 'SH_CLERK', 3000, 50),

(200, 'Jennifer', 'Whalen', '1987-09-17', 'AD_ASST', 4400, 10),

(201, 'Michael', 'Hartstein', '1999-01-19', 'IT_PROG', 6000, 20),

(202, 'Pat', 'Fay', '1989-10-25', 'AC_MGR', 6500, 20),

(203, 'Susan', 'Mavris', '1976-11-26', 'AD_VP', 7500, 40),

(204, 'Hermann', 'Baer', '1995-08-23', 'AD_PRES', 9500, 90),

(205, 'Shelley', 'Higgins', '1998-02-24', 'AC_MGR', 2300, 60),

(206, 'William', 'Gitz', '2001-03-12', 'IT_PROG', 5000, 60),

(100, 'Steven', 'King', '2002-06-15', 'AD_ASST', 8956, 100),

(101, 'Neena', 'Kochar', '2003-07-10', 'SH_CLERK', 3400, 30);

-- Display all records
SELECT * FROM EMP;


SELECT FNAME AS Employee_Name
FROM EMP
ORDER BY FNAME ASC;


SELECT FNAME AS Employee_Name
FROM EMP
ORDER BY FNAME DESC;

SELECT HIRE_DATE
FROM EMP
ORDER BY HIRE_DATE ASC;

SELECT *
FROM EMP
WHERE FNAME LIKE 'J%'
   OR FNAME LIKE 'M%'
ORDER BY LNAME;


SELECT
    MAX(SAL) AS Max,
    MIN(SAL) AS Min,
    AVG(SAL) AS Avg,
    SUM(SAL) AS Sum
FROM EMP;


SELECT
    MAX(SAL) AS Max,
    MIN(SAL) AS Min,
    AVG(SAL) AS Avg,
    SUM(SAL) AS Sum
FROM EMP;


SELECT
    JOB_ID,
    MAX(SAL) AS Highest_Salary,
    MIN(SAL) AS Lowest_Salary,
    AVG(SAL) AS Average_Salary,
    SUM(SAL) AS Total_Salary
FROM EMP
GROUP BY JOB_ID;



SELECT
    JOB_ID,
    COUNT(*) AS Number_of_Employees
FROM EMP
GROUP BY JOB_ID;


SELECT
    COUNT(*) AS Number_of_Managers
FROM EMP
WHERE JOB_ID IN ('AC_MGR', 'AD_VP', 'AD_PRES');


SELECT
    MAX(SAL) - MIN(SAL) AS Salary_Difference
FROM EMP;



SELECT
    MAX(SAL) AS Max_Salary,
    AVG(SAL) AS Avg_Salary
FROM EMP
WHERE JOB_ID = 'IT_PROG';



(
    SELECT FNAME
    FROM EMP
    ORDER BY FNAME ASC
    LIMIT 1
)
UNION ALL
(
    SELECT FNAME
    FROM EMP
    ORDER BY FNAME DESC
    LIMIT 1
);

SELECT
    MIN(HIRE_DATE) AS "First Hire_Date",
    MAX(HIRE_DATE) AS "Last Hire_Date"
FROM EMP;


SELECT
    MAX(SAL) AS Max_Salary,
    AVG(SAL) AS Avg_Salary
FROM EMP
WHERE JOB_ID = 'SH_CLERK';



SELECT
    DEPT_ID,
    MIN(SAL) AS Lowest_Salary
FROM EMP
GROUP BY DEPT_ID;
