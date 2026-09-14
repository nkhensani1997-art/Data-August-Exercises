--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS exercises;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS exercises.ex03;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS exercises.ex03.products03 (
    product_id INT,
    product_name STRING,
    price DECIMAL(10,2)
);

--INSERT INTO
INSERT INTO TABLE exercises.ex03.products03 VALUES
 (1,'Laptop',1200.00),
 (2,'Phone',800.00),
 (3,'Keyboard',45.00),
 (4,'Monitor',300.00),
 (5,'Mouse',25.00);

 --SHOW TABLE
 SELECT* FROM exercises.ex03.products03;

 --QUESTION 01 
 SELECT    product_name,
           price,

CASE 
           WHEN price > 1000 THEN 'Expensive' 
           WHEN price BETWEEN 100 AND 1000 THEN 'Mid_range' 
           WHEN price < 100 THEN 'Budget'

END AS     price_category
         
FROM      exercises.ex03.products03;


--ORDERS TABLE
--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS exercises;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS exercises.ex03;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS exercises.ex03.orders03 (
    order_id INT,
    customer_name STRING,
    amount DECIMAL(10,2)
);
--INSERT INTO
INSERT INTO TABLE exercises.ex03.orders03 VALUES
 (1,'Alice',150.00),
 (2,'Bob',500.00),
 (3,'Charlie',999.99),
 (4,'Diana',45.50),
 (5,'Ethan',1200.00);

 --SHOW TABLE
 SELECT* FROM exercises.ex03.orders03;

--QUESTION 02
SELECT    customer_name,
           amount,
CASE   
           WHEN amount > 1000 THEN 'High Value' 
           WHEN amount BETWEEN 500 AND 999.99 THEN 'Medium Value' 
           WHEN amount < 500 THEN 'Low Value'

END AS    order_value_category
FROM      exercises.ex03.orders03;

--EMPLOYEES TABLE
--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS exercises;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS exercises.ex03;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS exercises.ex03.employees03 (
    emp_id INT,
    emp_name STRING,
    department STRING,
    salary INT
);

--INSERT INTO
INSERT INTO TABLE exercises.ex03.employees03 VALUES
 (1,'John','IT',85000),
 (2,'Sara','HR',60000),
 (3,'Mark','IT',75000),
 (4,'Lucy','Finance',95000),
 (5,'Tom','HR',55000);

--SHOW TABLE
SELECT* FROM exercises.ex03.employees03;

--QUESTION 03
SELECT    emp_name,
          department,
          salary,
CASE   
           WHEN department = 'IT' AND salary > 80000 THEN 'Senior IT' 
           WHEN department = 'HR' AND salary > 55000 THEN 'Experienced HR' 
          ELSE 'Staff'
          END AS     position_level
FROM      exercises.ex03.employees03;

--STUDENTS TABLE
--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS exercises;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS exercises.ex03;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS exercises.ex03.students03 (
    student_id INT,
    student_name STRING,
    score INT
   
);

--INSERT INTO
INSERT INTO TABLE exercises.ex03.students03 VALUES
 (1,'Anna',92),
 (2,'Ben',76),
 (3,'Cara',59),
 (4,'David',83),
 (5,'Ella',68);

--SHOW TABLE
SELECT* FROM exercises.ex03.students03;

--QUESTION 04
SELECT    student_name,
          score,
CASE   
           WHEN score > 90 THEN '

--DELIVERIES TABLE 05
--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS exercises;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS exercises.ex03;
--CREATE A TABLE
CREATE TABLE IF NOT EXISTS exercises.ex03.deliveries03 (
    delivery_id INT,
    delivery_time_minutes INT
    
);

--INSERT INTO
INSERT INTO TABLE exercises.ex03.deliveries03 VALUES
 (1,45),
 (2,80),
 (3,30),
 (4,65),
 (5,100);

--SHOW TABLE
SELECT* FROM exercises.ex03.deliveries03;


--QUESTION 05
SELECT    delivery_id,
          delivery_time_minutes,

CASE    
          WHEN delivery_time_minutes <= 30 THEN 'Fast'
          WHEN delivery_time_minutes BETWEEN 31 AND 60 THEN 'On Time'
          WHEN delivery_time_minutes > 60 THEN 'Late'
END AS   performance
FROM     exercises.ex03.deliveries03;

--TICKET TABLE 06
--CREATE CATALOG 
CREATE CATALOG IF NOT EXISTS exercises;
--CREAET SCHEMA 
CREATE SCHEMA IF NOT EXISTS exercises.ex03;
--CREATE TABLE 
CREATE TABLE IF NOT EXISTS exercises.ex03.ticket (      
        ticket_id INT,
       issue_type STRING,
       priority INT 
 );

--INSERT INTO
INSERT INTO  exercises.ex03.ticket VALUES 
(1,'Login issue',1),
(2,'Server down',3),
(3,'Slow system',2),
(4,'Email error',2),
(5,'Password reset',1);

SELECT * FROM exercises.ex03.ticket;
 
--QUESTION 06
SELECT     issue_type,
           priority,
CASE      
           WHEN priority = 3 THEN 'High'
           WHEN priority = 2 THEN 'Medium'
           WHEN priority = 1 THEN 'Low'

END AS     priority_label
FROM       exercises.ex03.ticket;

--ATTENDANCE TABLE 07
--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS   exercises;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS exercises.ex03;
--CREATE TABLE 
CREATE TABLE IF NOT EXISTS  exercises.ex03.attendance (
    student_id INT,
    days_present INT,
    total_days INT
);

--INSERT INTO
INSERT INTO TABLE exercises.ex03.attendance VALUES
 (1,45,50),
 (2,30,50),
 (3,48,50),
 (4,25,50),
 (5,50,50);

--SHOW TABLE
SELECT* FROM exercises.ex03.attendance;

--QUESTION 07
SELECT    student_id,
          (days_present/total_days)*100 AS attendance_percentage,
    CASE 
         WHEN (days_present / total_days) * 100 >= 90 THEN 'Excellent'
         WHEN (days_present / total_days) * 100 BETWEEN 75 AND 89.99 THEN 'Good'
         WHEN (days_present / total_days) *100 < 75 THEN 'Need Improvements'

END AS   attendance_status
FROM      exercises.ex03.attendance;

--PRODUCTS_INVENTORY 08
--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS exercises;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS exercises.ex03;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS exercises.ex03.products_inventory (
    product_id INT,
    stock_qty INT
   
);

--INSERT INTO
INSERT INTO TABLE exercises.ex03.products_inventory VALUES
 (1,5),
 (2,0),
 (3,25),
 (4,10),
 (5,3);

 --SHOW TABLE
 SELECT * FROM exercises.ex03.products_inventory;

--QUESTION 08
SELECT    product_id, stock_qty,
    CASE 
         WHEN stock_qty = 0 THEN 'Out of  Stock'
         WHEN stock_qty BETWEEN 1 AND 5 THEN 'Low Stock'
         WHEN stock_qty > 5 THEN 'In Stock'
    END AS stock_status
FROM      exercises.ex03.products_inventory;


--PAYMENTS 10
--CREATE CATALOG 
CREATE CATALOG IF NOT EXISTS exercises;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS exercises.ex03;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS exercises.ex03.payments (
    payment_id INT,
    amount DECIMAL(10,2),
    payment_method STRING
   
);

--INSERT INTO
INSERT INTO TABLE exercises.ex03.payments VALUES
 (1,50.00,'Card'),
 (2,200.00,'Cash'),
 (3,150.00,'Card'),
 (4,75.00,'PayPal'),
 (5,300.00,'Cash');

 --SHOW TABLE 
 SELECT* FROM exercises.ex03.payments;

--QUESTION 10
SELECT    payment_id,
          payment_method,
          amount,
    CASE 
         WHEN payment_method = 'Cash' AND amount >= 200  THEN 'Eligible for Discount'
      
ELSE     'Not Eligible'
END AS    discount_eligibility
FROM      exercises.ex03.payments;






