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