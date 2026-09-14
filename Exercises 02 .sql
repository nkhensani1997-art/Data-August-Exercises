--CREATE CATALOG 
CREATE CATALOG IF NOT EXISTS exercises_02;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS exercises_02.classwork;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS exercises_02.classwork.students01 (
    student_id INT,
    name STRING,
    age INT,
    department STRING
    );
--INSERT INTO TABLE 
INSERT INTO TABLE exercises_02.classwork.students01 VALUES 
(1, 'Alice', 20, 'IT'), 
(2, 'Bob', 22, 'HR'), 
(3, 'Charlie',21, 'IT'),
(4,'Diana',23,'Finance'),
(5,'Eve',22,'HR');
--SHOW TABLE 
SELECT* FROM exercises_02.classwork.students01;

--QUESTION ONE
SELECT DISTINCT department
FROM           exercises_02.classwork.students01;

--QUESTION TWO
SELECT          department ,
                AVG(age) AS avg_age
FROM            exercises_02.classwork.students01
GROUP BY        department;

--QUESTION THREE
SELECT          department,
                COUNT(*)AS student_count
FROM            exercises_02.classwork.students01
GROUP BY        department
HAVING        student_count > 1;

--QUESTION FOUR
SELECT        student_id,
              name,
              age,
              department
FROM          exercises_02.classwork.students01
WHERE         age BETWEEN 21 AND 23;

--QUESTION FIVE 
SELECT        student_id,
              name,
              age,
              department
FROM          exercises_02.classwork.students01
WHERE         department IN ('IT','HR'	)
              AND age > 21;


--COURSES TABLE
--CREATE CATLOG
CREATE CATALOG IF NOT EXISTS exercises_02;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS exercises_02.classwork;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS exercises_02.classwork.courses (
    course_id INT,
    course_name STRING,
    department STRING,
    credits INT
    );
--INSERT INTO TABLE
INSERT INTO TABLE exercises_02.classwork.courses VALUES 
(101,'SQL Basics','IT',3),
(102,'Python','IT',4),
(103,'Data Science','IT',4),
(104,'Excel','Finance',2),
(105,'Statistics','HR',3);
--SHOW TABLE 
SELECT* FROM exercises_02.classwork.courses;


--QUESTION SIX
SELECT     department,
           SUM(credits) AS total_credits
FROM        exercises_02.classwork.courses
GROUP BY    department;
HAVING    total_credits > 5;

--QUESTION SEVEN
SELECT     course_id,
           course_name,
           department,
           credits
FROM        exercises_02.classwork.courses
WHERE      credits <>4;

--QUESTION EIGHT
SELECT     course_id,
           course_name,
           credits
FROM        exercises_02.classwork.courses
ORDER BY    credits DESC LIMIT 3;

--ENROLLMENT TABLE
--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS exercises_02;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS exercises_02.classwork;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS exercises_02.classwork.enrollment (
    enrollment_id INT,
    student_id INT,
    course_id INT,
    grade   INT
    );
--INSERT INTO TABLE
INSERT INTO TABLE exercises_02.classwork.enrollment VALUES 
(1,1,101,85),
(2,2,102,78),
(3,3,103,90),
(4,4,104,88),
(5,5,105,82);
--SHOW TABLE
SELECT * FROM exercises_02.classwork.enrollment;

--QUESTION NINE
SELECT     
           
FROM        
GROUP BY    
HAVING    
--QUESTION TEN 
SELECT 
FROM


--SALARIES TABLE
--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS exercises_02;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS exercises_02.classwork;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS exercises_02.classwork.salaries (
      employee_id INT,
      name STRING,
      department STRING,
      salary INT,
      bonus INT
);

--INSERT INTO TABLE
INSERT INTO TABLE exercises_02.classwork.salaries VALUES
(1,'Tom','IT',60000,5000),
(2,'Jerry','HR',55000,4000),
(3,'Spike','Finance',70000,6000),
(4,'Tyke','IT',62000,5500),
(5,'Butch','HR',54000,3500);

--SHOW TABLE
SELECT * FROM exercises_02.classwork.salaries;

--QUESTION ELEVEN
SELECT     department,
           SUM(salary) AS total_salary,
           SUM(bonus) AS total_salary
FROM exercises_02.classwork.salaries
GROUP BY department;

--QUESTION TWELVE
SELECT     department,
           AVG (salary) AS  avg_salary

FROM       exercises_02.classwork.salaries
GROUP BY   department
HAVING     AVG(salary) > 55000;
--QUESTION THIRTEEN 
SELECT     employee_id,
           name,
           salary,
           bonus,
           (salary + bonus) AS total_compensation
FROM  exercises_02.classwork.salaries
WHERE (salary + bonus) > 60000;

--PROJECTS TABLE
--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS exercises_02;
--CREATE SCHEMA 
CREATE SCHEMA IF NOT EXISTS exercises_02.classwork;
--CREATE TABLE 
CREATE TABLE IF NOT EXISTS exercises_02.classwork.projects (
    project_id INT,
    project_name STRING,
    department STRING,
    budget INT
);
--INSERT TABLE
INSERT INTO TABLE exercises_02.classwork.projects VALUES
(1,'AI App','IT',120000),
(2,'Payroll System','Finance',80000),
(3,'Dashboard','IT',150000),
(4,'Website','Marketing',60000),
(5,'HR Portal','HR',50000);

--SHOW TABLE
SELECT * FROM exercises_02.classwork.projects;

DROP TABLE exercises_02.classwork.projects;

--QUESTION FOURTEEN
SELECT  department,
       SUM(budget) AS total_budget,
       AVG(budget) AS avg_budget

FROM    exercises_02.classwork.projects
GROUP BY department 
HAVING AVG(budget)>70000;
--QUESTION FIFTEEN
SELECT     project_id,
           project_name,
           department,
           budget

FROM      exercises_02.classwork.projects
WHERE     budget BETWEEN 50000 AND 120000 AND department <>'Marketing';
