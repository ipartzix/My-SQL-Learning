CREATE TABLE Client_Master (
    Client_no VARCHAR(5),
    Name VARCHAR(20) NOT NULL,
    Address1 VARCHAR(30),
    State VARCHAR(30),
    City VARCHAR(15),

    CONSTRAINT pk_client PRIMARY KEY (Client_no),
    CONSTRAINT chk_clientno CHECK (Client_no LIKE 'C%'),
    CONSTRAINT uk_client_name UNIQUE (Name),
    CONSTRAINT chk_city CHECK (City IN ('Delhi', 'Mumbai', 'Chennai'))
);


INSERT INTO Client_Master VALUES
('C01','Ivaan','Church Rd','Maharashtra','Mumbai'),
('C02','Vandana','St.Mary Rd','Tamil Nadu','Chennai'),
('C03','Pramada','Mall Rd','Maharashtra','Mumbai'),
('C04','Basu','Church Rd','Maharashtra','Mumbai'),
('C05','Ravi','Chandni',NULL,'Delhi'),
('C06','Rukmini','Mall Rd','Maharashtra','Mumbai');




CREATE TABLE Products_Master (
    Product_no VARCHAR(10),
    Description VARCHAR(20) NOT NULL,
    Qty_on_hand INT,
    Sell_price DECIMAL(8,2) NOT NULL,
    Cost_price DECIMAL(8,2) NOT NULL,

    CONSTRAINT pk_product PRIMARY KEY (Product_no),
    CONSTRAINT chk_product_no CHECK (Product_no LIKE 'P%'),
    CONSTRAINT uk_product_desc UNIQUE (Description),
    CONSTRAINT chk_qty CHECK (Qty_on_hand > 10)
);

INSERT INTO Products_Master
VALUES ('P01','1.44 Floppies',100,525.00,500.00),
       ('P02','Monitors',25,12000.00,11280.00),
       ('P03','Mouse',20,1050.00,1000.00),
       ('P04','1.22 floppies',100,525.00,500.00),
       ('P05','Keyboards',15,3150.00,3050.00),
       ('P06','Cd drive',14,5250.00,5100.00);

CREATE TABLE Sales_Order (
    S_order_no VARCHAR(10),
    S_order_date DATE,
    Client_no VARCHAR(5),
    Salesman_no VARCHAR(10),
    Product_no VARCHAR(10),

    CONSTRAINT pk_sales_order PRIMARY KEY (S_order_no),
    CONSTRAINT chk_order_no CHECK (S_order_no LIKE 'O%'),
    CONSTRAINT chk_salesman_no CHECK (Salesman_no LIKE 'S%'),

    CONSTRAINT fk_client
        FOREIGN KEY (Client_no)
        REFERENCES Client_Master(Client_no),

    CONSTRAINT fk_product
        FOREIGN KEY (Product_no)
        REFERENCES Products_Master(Product_no)
);

INSERT INTO Sales_Order
VALUES ('O19001','1996-01-12','C01','S01','P01');
INSERT INTO Sales_Order
VALUES ('O19002','1996-01-25','C02','S02','P02');
INSERT INTO Sales_Order
VALUES ('O19003','1996-02-18','C03','S03','P03');
INSERT INTO Sales_Order
VALUES ('O19004','1996-04-03','C01','S01','P04');
INSERT INTO Sales_Order
VALUES ('O19005','1996-05-20','C04','S02','P05');
INSERT INTO Sales_Order
VALUES ('O19006','1996-05-24','C05','S04','P06');

ALTER TABLE Client_Master
MODIFY Address1 VARCHAR(30) NOT NULL;

SHOW COLUMNS FROM Client_Master;


SELECT Product_no,
       Description,
       Sell_price,
       Cost_price,
       (Sell_price - Cost_price) AS Profit
FROM Products_Master;

SELECT
    Product_no,
    Description,
    (Qty_on_hand * Cost_price) AS Total_Cost_Price
FROM Products_Master;

SELECT *
FROM Client_Master
WHERE Name LIKE 'I%';

SELECT *
FROM Client_Master
WHERE Name LIKE 'R%i';

SELECT *
FROM Client_Master
WHERE Name LIKE '__a_a%';

SELECT *
FROM Client_Master
WHERE Name LIKE '%aa%';

SELECT *
FROM Client_Master
WHERE Name LIKE '____';

SELECT *
FROM Client_Master
WHERE State IS NULL;

SELECT *
FROM Sales_Order
WHERE S_order_date > '1996-01-31';


UPDATE Sales_Order
SET
    S_order_date = '1996-07-24',
    Product_no = 'P06',
    Salesman_no = 'S04'
WHERE Client_no = 'C01';

UPDATE Client_Master
SET City = 'Delhi'
WHERE Client_no = 'C05';

ALTER TABLE Client_Master
MODIFY Client_no VARCHAR(15);


ALTER TABLE Sales_Order
MODIFY Client_no VARCHAR(15);

DELETE FROM Sales_Order
WHERE Client_no = 'C02';

DELETE FROM Client_Master
WHERE Client_no = 'C02';


DELETE FROM Sales_Order
WHERE Product_no IN (
    SELECT Product_no
    FROM Products_Master
    WHERE Sell_price BETWEEN 1000 AND 10000
);


DELETE FROM Products_Master
WHERE Sell_price BETWEEN 1000 AND 10000;


CREATE TABLE Student_Course (
    Student_ID VARCHAR(10),
    Course_ID VARCHAR(10),
    Enrollment_Date DATE,

    CONSTRAINT pk_student_course PRIMARY KEY (Student_ID, Course_ID)
);


CREATE TABLE Course_Attendance (
    Student_ID VARCHAR(10),
    Course_ID VARCHAR(10),
    Attendance_Date DATE,
    Status VARCHAR(10),

    CONSTRAINT fk_student_course
    FOREIGN KEY (Student_ID, Course_ID)
    REFERENCES Student_Course(Student_ID, Course_ID)
);