CREATE TABLE EMP1 (
    ID INT PRIMARY KEY,
    Name VARCHAR(15),
    Basic INT,
    Designation VARCHAR(10),
    Age INT
);
INSERT INTO EMP1 VALUES
(1, 'Rohit', 6700, 'Manager', 24),
(2, 'Sunil', 6200, 'Engineer', 27),
(3, 'Payal', 6300, 'Engineer', 25),
(4, 'Kunal', 6700, 'Trainee', 28),
(5, 'Sunita', 6230, 'Trainee', 26),
(6, 'Bimal', 7000, 'Trainee', 25);
ALTER TABLE EMP1
ADD COLUMN Skills VARCHAR(10),
ADD COLUMN DOB DATE;
UPDATE EMP1
SET
  Skills = CASE ID
    WHEN 1 THEN 'Java'
    WHEN 2 THEN 'Python'
    WHEN 3 THEN 'SQL'
    WHEN 4 THEN 'C++'
    WHEN 5 THEN 'HTML'
    WHEN 6 THEN 'Testing'
  END,
  DOB = CASE ID
    WHEN 1 THEN '2000-01-10'
    WHEN 2 THEN '1998-03-15'
    WHEN 3 THEN '1999-07-22'
    WHEN 4 THEN '1997-12-07'
    WHEN 5 THEN '1999-09-19'
    WHEN 6 THEN '2000-02-03'
  END;
CREATE TABLE EMP_trainee AS
SELECT ID AS Emp_id, Name, Basic, Designation, Age
FROM EMP1 WHERE 1 = 0;
INSERT INTO EMP_trainee (Emp_id, Name, Basic, Designation, Age)
SELECT ID, Name, Basic, Designation, Age
FROM EMP1
WHERE Designation = 'Trainee';
SELECT * FROM EMP1;
SELECT * FROM EMP_trainee;
DESCRIBE EMP1;
DESCRIBE EMP_trainee;
DESCRIBSE EMP1;
SELECT * FROM EMP1;
UPDATE EMP1
SET Basic = Basic + 500
WHERE Designation = 'Engineer';
SELECT * FROM EMP1;
ALTER TABLE EMP1
RENAME COLUMN Age TO Age_in_years;
DESCRIBE EMP1;
ALTER TABLE EMP_trainee
DROP COLUMN Age;
DESCRIBE EMP_trainee;
RENAME TABLE EMP1 TO EMP_Mgr_Engr;
SHOW TABLES;
TRUNCATE TABLE EMP_Mgr_Engr;
SELECT * FROM EMP_Mgr_Engr;