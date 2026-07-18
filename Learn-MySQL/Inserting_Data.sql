-- Insert Without Specifying Column Names (Full Row Insert)
USE learndb;
CREATE TABLE emp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SELECT * FROM emp;
INSERT INTO emp VALUES(1, 'Alice', 'alice@example.com', 'Female', '1995-05-14', DEFAULT);

-- insert data into specific columns
INSERT INTO emp (name, email, gender, date_of_birth) VALUES
('Bob', 'bob@example.com', 'Male', '1990-11-23');
