create database learndb;
use learndb ;

create table users(
    id INT AUTO_INCREMENT PRIMARY KEY  ,
    name VARCHAR(100) NOT NULL ,
    email VARCHAR(100) NOT NULL ,
    gender ENUM('Male','Female','Other'),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SELECT  * FROM users;


-- (--) use for comment

-- for complete table delete we do drop

-- DROP DATABASE learndb ;

-- select specific columns

SELECT name, email FROM users;


-- Renaming a Table

-- To rename an existing table:

RENAME TABLE users TO customers;

-- To rename it back:

RENAME TABLE customers TO users;


SELECT  * FROM users;

-- Altering a Table


-- Add a Column
ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
-- Drop a Column
ALTER TABLE users DROP COLUMN is_active;

SELECT * FROM users;

-- Modify a Column Type
ALTER TABLE users MODIFY COLUMN name VARCHAR(150);


SELECT * FROM users;



-- Move a Column to the First Position


-- To move a column (e.g., email) to the first position:
ALTER TABLE users MODIFY COLUMN email VARCHAR(100) FIRST;
-- To move a column after another column (e.g., move gender after name):
ALTER TABLE users MODIFY COLUMN gender ENUM('Male', 'Female', 'Other') AFTER name;