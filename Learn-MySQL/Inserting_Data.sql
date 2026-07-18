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

-- insert data into specific columns ( its better ) use
INSERT INTO emp (name, email, gender, date_of_birth) VALUES
('Bob', 'bob@example.com', 'Male', '1990-11-23');


-- or for multiple rows:
INSERT INTO emp (name, email, gender, date_of_birth) VALUES
('Boc', 'bcs@example.com', 'Male', '1890-11-23'),
('Charlie', 'charlie@example.com', 'Other', '1988-02-17');

INSERT INTO emp (name, email, gender, date_of_birth) VALUES
('Charlie', 'charlie@example.com', 'Other', '1988-02-17'),
('David', 'david@example.com', 'Male', '2000-08-09'),
('Eva', 'eva@example.com', 'Female', '1993-12-30');

