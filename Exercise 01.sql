--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS exercises;
--CREATE SCHEMA 
CREATE SCHEMA IF NOT EXISTS exercises.ex01;
--CREATE TABLE 
CREATE TABLE IF NOT EXISTS exercises.ex01.employees01(
    id INT,
    first_name STRING,
    last_name STRING,
    department STRING,
    salary INT,
    hire_date DATE,
    city STRING
);
--INSERT INTO
INSERT INTO TABLE exercises.ex01.employees01 VALUES 
(1,'Alice','Green','IT',70000,'2020-01-10','Johannesburg'),
(2,'Brian','Lee','HR',45000,'2019-03-22','Cape Town'),
(3,'Cathy','Zulu','Finance',65000,'2018-07-18','Durban'),
(4,'David','Mokoena','Marketing',50000,'2021-11-05','Pretoria'),
(5,'Eva','Naidoo','IT',72000,'2017-09-30','Johannesburg');

SELECT* FROM exercises.ex01.employees01;

-- QUESTION ONE 
SELECT       id, 
            first_name,
             last_name, 
             department,
             salary, 
             hire_date,
              city
 FROM exercises.ex01.employees01;

--QUESTION TWO 
SELECT DISTINCT  department
FROM exercises.ex01.employees01;

--QUESTION THREE 
SELECT       first_name,
            last_name
FROM        exercises.ex01.employees01
ORDER BY    salary DESC;       

--QUESTION FOUR 

SELECT     id,
           first_name,
           last_name,
           salary
        
FROM       exercises.ex01.employees01
ORDER BY   salary DESC
LIMIT       3;

--QUESTION FIVE

SELECT     id,
            first_name,
            last_name,
            department
FROM        exercises.ex01.employees01
WHERE       department = 'IT';

--QUESTION SIX - 
SELECT      id,
            first_name,
            last_name,
            department,
            salary
FROM        exercises.ex01.employees01 
WHERE       department = 'Finance'
AND         salary > 60000;

--QUESTION SEVEN
SELECT     id,
            first_name,
            last_name,
            department
FROM        exercises.ex01.employees01
WHERE       department = 'HR'
OR         department = 'Marketing';

--QUESTION EIGHT 
SELECT   id,
        first_name,
        last_name,
        department
FROM   exercises.ex01.employees01
WHERE  department <> 'IT';	

--QUESTION NINE
SELECT  id,
        first_name,
        last_name,
        department
FROM     exercises.ex01.employees01
WHERE   department IN ('IT','Marketing','Finance');

--QUESTION TEN 
SELECT   id,
         first_name,
         last_name,
         department,
         salary,
         city
FROM     exercises.ex01.employees01
WHERE    department = 'IT' 
AND      salary > 65000
AND      city = 'Johannesburg';
