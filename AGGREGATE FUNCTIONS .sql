--CREATE CATALOG 
CREATE CATALOG IF NOT EXISTS aggregate;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS aggregate.data;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS aggregate.data.sales( 
    sales_id INT,
    product STRING,
    category STRING,
    quantity INT,
    price INT
);
--INSERT INTO
INSERT INTO aggregate.data.sales VALUES 
(1, 'Laptop', 'Electronics', 2, 800),
(2,'Laptop', 'Electronics', 5, 20),
(3,'Shirt', 'Electronics', 3, 50),
(4,'Shirt', 'Funiture', 2, 300),
(5,'Shirt', 'Funiture',4,150),
(6,'Monitor', 'Electronics', 2,400);


--SHOW TABLE
SELECT * FROM aggregate.data.sales;

--QUESTIONS 
--01
SELECT  
COUNT(*) AS total_records
FROM aggregate.data.sales;
--02
SELECT
SUM(quantity) AS total_quantity
FROM aggregate.data.sales;
--03
SELECT 
AVG(price) AS average_price
FROM aggregate.data.sales;
--04
SELECT
MIN(price) AS lowest_price
FROM aggregate.data.sales;
--05
SELECT
MAX(price) AS highest_price
FROM aggregate.data.sales;
--06
SELECT
SUM(quantity * price) AS total_revenue
FROM aggregate.data.sales;
--07
SELECT   category, SUM(quantity) AS total_quantity
FROM aggregate.data.sales;
