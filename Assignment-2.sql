CREATE DATABASE school;

USE school;

CREATE TABLE Student (
    Roll INT(5),
    Name VARCHAR(30),
    Age INT(5),
    Course VARCHAR(5),
    Math DECIMAL(6,2),
    Physics DECIMAL(6,2),
    Computer DECIMAL(6,2),
    Birthday DATE
);
SELECT * FROM Student;

DESCRIBE Student;

CREATE TABLE MSc AS
SELECT *
FROM Student
WHERE 1 = 0;
SELECT * FROM MSc;
DESCRIBE MSc;

CREATE TABLE MCA AS
SELECT
    Roll,
    Name AS First_Name,
    Age,
    Course AS Department,
    Math,
    Physics,
    Computer,
    Birthday
FROM Student
WHERE 1 = 0;
DESCRIBE MCA;
INSERT INTO Student (Roll, Name, Age, Course, Math, Physics, Computer, Birthday)
VALUES
(1, 'Rahul', 19, 'BCA', 79.5, 67, 89, '1993-06-15'),
(2, 'Kunal', 21, 'BCA', 68, 76, 59.5, '1991-08-16'),
(3, 'Aditi', 20, 'MSc', 90, 73, 56, '1992-09-20'),
(4, 'Sumit', 20, 'MCA', 57.5, 78, 81, '1991-12-07'),
(5, 'Anirban', 22, 'MCA', 80, 68, 63, '1994-09-15'),
(6, 'Kumkum', 21, 'BCA', 72, 54.5, 60, '1995-02-08'),
(7, 'Suman', 21, 'BCA', 91.5, 32, 61, '1994-03-10'),
(8, 'Rohit', 22, 'MSc', 85, 76, 92, '1992-04-19');
SELECT * FROM Student;
SELECT *
FROM Student
WHERE Roll = 5;
SELECT Roll, Name, Math, Physics, Computer
FROM Student;
SELECT *
FROM Student
WHERE Course = 'BCA';
DESC Student;
DESC MCA;
SELECT Course, Roll, Name, Age, Math, Physics, Computer, Birthday
FROM Student;
UPDATE Student
SET Math = 95
WHERE Roll = 7;
UPDATE MCA
SET First_Name = 'Sumitava'
WHERE Roll = 4;
DELETE FROM Student
WHERE Roll = 2;
DELETE FROM Student;
SELECT * FROM Student;