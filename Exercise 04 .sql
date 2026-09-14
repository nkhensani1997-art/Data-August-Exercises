--EX04-TABLES
--TABLE 01 -USERS
--CREATE CATALOG 
CREATE CATALOG IF NOT EXISTS join_ex04;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS join_ex04.ex04;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS join_ex04.ex04.users (
  id INT,
  user_name STRING,
  country STRING
 
);

--INSERT INTO TABLE
INSERT INTO TABLE  join_ex04.ex04.users VALUES 
(1,'Nomvula','Johannesburg'),
(2,'David','Cape Town'),
(3,'Anale','Durban'),
(4,'Kabelo','Pretoria'),
(5,'Lerato','Port Elizabeth');

--SHOW TABLE
SELECT * FROM join_ex04.ex04.users;

--TABLE 02 - PLANES
--CREATE CATALOG 
CREATE CATALOG IF NOT EXISTS join_ex04;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS join_ex04.ex04;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS join_ex04.ex04.planes (
  plan_id INT,
  plane_name STRING,
  monthly_price INT
 
);

--INSERT INTO TABLE
INSERT INTO TABLE  join_ex04.ex04.planes VALUES 
(10,'Basic',79),
(11,'Standard',129),
(12,'Premium',199),
(13,'Family',249),
(14,'Mobile',59);
--SHOEW TABLE
SELECT * FROM join_ex04.ex04.planes;

--TABLE 03 - SUMBSCIPTIONS
--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS join_ex04;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS join_ex04.ex04;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS join_ex04.ex04.subscriptions (
  subscription_id INT,
  user_id INT,
  plan_id INT,
  start_date DATE
);
--INSERT INTO TABLE
INSERT INTO  join_ex04.ex04.subscriptions VALUES 
(501,1,10,'2026-01-15'),
(502,2,11,'2026-02-01'),
(503,1,12,'2026-03-10'),
(504,6,11,'2026-03-20'),
(505,3,13,'2026-04-05');

--SHOW TABLE
SELECT * FROM join_ex04.ex04.subscriptions;

--TABLE 04 - SHOWS
--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS join_ex04;
--CREATE SCHEMA
CREATE SCHEMA IF NOT EXISTS join_ex04.ex04;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS join_ex04.ex04.shows (
  show_id INT,
  show_title STRING,
  genre STRING
  
);
--INSERT INTO TABLE
INSERT INTO  TABLE join_ex04.ex04.shows VALUES 
(701,'Comedy Hour','Comedy'),
(702,'Crime Time','Drama'),
(703,'Tech Tales','Documentary'),
(704,'Cooking Lab','Lifestyle'),
(706,'Wild Earth','Documentary');

--SHOW TABLE 
SELECT * FROM join_ex04.ex04.shows;

--TABLE 05 - VIEWING_SESSIONS 

--CREATE CATALOG
CREATE CATALOG IF NOT EXISTS join_ex04;
--CREATE SCHEMA 
CREATE SCHEMA IF NOT EXISTS join_ex04.ex04;
--CREATE TABLE
CREATE TABLE IF NOT EXISTS join_ex04.ex04.viewing_sessions (
  session_id INT,
  user_id INT,
  show_id INT,
  watch_minutes INT
);
--INSERT INTO TABLE 
INSERT INTO TABLE join_ex04.ex04.viewing_sessions VALUES 
(901,1,701,45),
(902,2,703,30),
(903,1,702,60),
(904,7,701,20),
(905,3,705,90);

--SHOW TABLE
SELECT * FROM join_ex04.ex04.viewing_sessions;


--QUESTIONS 01-15

-- Q1: Show every user who has a subscription. Match users to subscriptions.

SELECT 

    u.id AS user_id, 
     u.user_name, 
     s.subscription_id,  
      s.start_date

FROM join_ex04.ex04.users u 

INNER JOIN join_ex04.ex04.subscriptions s

    ON u.id = s.user_id;



-- Q2: Show every subscription with its matching plan name and monthly price.

SELECT 

    s.subscription_id, 
    s.user_id, 
    p.plane_name AS plan_name,
    p.monthly_price

FROM join_ex04.ex04.subscriptions s

INNER JOIN join_ex04.ex04.planes p 

    ON s.plan_id = p.plan_id;



-- Q3: Show every viewing session that has a matching show. Include the show title and genre.

SELECT 

    v.session_id, 
    v.user_id, 
    s.show_title, 
    s.genre, 
    v.watch_minutes

FROM join_ex04.ex04.viewing_sessions v

INNER JOIN join_ex04.ex04.shows s 

    ON v.show_id = s.show_id;



-- Q4: Show every viewing session with the user who watched it. Only show sessions with a matching user.

SELECT 

    u.user_name, 
    u.country, 
    v.session_id, 
     v.show_id, 
     v.watch_minutes

FROM join_ex04.ex04.users u

INNER JOIN join_ex04.ex04.viewing_sessions v 

    ON u.id = v.user_id;



-- Q5: Show users along with their subscriptions, the plan name, and the price. Use only users who have both a subscription and a valid plan.

SELECT 

    u.user_name, 
    u.country, 
    p.plane_name,
    p.monthly_price,
    s.start_date

FROM join_ex04.ex04.users u

INNER JOIN join_ex04.ex04.subscriptions s 

    ON u.id = s.user_id

INNER JOIN join_ex04.ex04.planes p 

    ON s.plan_id = p.plan_id;



--LEFT JOIN 

-- Q6: Show every user and any subscriptions they have. Users without subscriptions must still appear.

SELECT 

    u.id AS user_id, 
    u.user_name, 
    s.subscription_id, 
    s.start_date

FROM join_ex04.ex04.users u

LEFT JOIN join_ex04.ex04.subscriptions s 

    ON u.id = s.user_id;



-- Q7: Show every plan and the subscriptions on it. Plans with no subscribers must still appear.

SELECT 

    p.plan_id, 
    p.plane_name AS plane_name, 
    s.subscription_id, 
    s.user_id

FROM join_ex04.ex04.planes p

LEFT JOIN join_ex04.ex04.subscriptions s 

    ON p.plan_id = s.plan_id;



-- Q8: Show every show and any viewing sessions on it. Shows that were never watched must still appear.

SELECT 

    s.show_id, 
    s.show_title, 
    v.session_id,
     v.watch_minutes

FROM join_ex04.ex04.shows s

LEFT JOIN join_ex04.ex04.viewing_sessions v 

    ON s.show_id = v.show_id;



-- Q9: Show every viewing session and the user who watched it. Sessions referencing users that do not exist must still appear (with NULL user details).

SELECT 

    v.session_id, 
    v.show_id, 
    v.watch_minutes, 
    u.id AS user_id, 
    u.user_name

FROM join_ex04.ex04.viewing_sessions v

LEFT JOIN join_ex04.ex04.users u 

    ON v.user_id = u.id;



-- Q10: Show every user, the plan they are on (if any), and the monthly price. Users without a subscription must still appear.

SELECT 

    u.user_name, 
    u.country, 
    p.plane_name AS plan_name,
    p.monthly_price

FROM join_ex04.ex04.users u

LEFT JOIN join_ex04.ex04.subscriptions s 

    ON u.id = s.user_id

LEFT JOIN join_ex04.ex04.planes p 

    ON s.plan_id = p.plan_id;





-- Q11: Show every user and every subscription, including users without subscriptions AND subscriptions referencing users that do not exist.

SELECT 

    COALESCE(u.id, s.user_id) AS user_id, 
    u.user_name, 
    s.subscription_id, 
    s.start_date

FROM join_ex04.ex04.users u

FULL OUTER JOIN join_ex04.ex04.subscriptions s 

    ON u.id = s.user_id;



-- Q12: Show every plan and every subscription, including plans without subscribers AND any subscription referencing a plan that does not exist.

SELECT 

    p.plan_id, 
    p.plane_name AS plan_name, 
    s.subscription_id,
    s.user_id

FROM join_ex04.ex04.planes p

FULL OUTER JOIN join_ex04.ex04.subscriptions s 

    ON p.plan_id = s.plan_id;



-- Q13: Show every show and every viewing session, including shows that were never watched AND sessions referencing shows that do not exist.

SELECT 

    s.show_id, 
    s.show_title, 
    v.session_id, 
    v.watch_minutes

FROM join_ex04.ex04.shows s

FULL OUTER JOIN join_ex04.ex04.viewing_sessions v 

    ON s.show_id = v.show_id;



-- Q14: Show every user and every viewing session, including users with no sessions AND sessions referencing users who do not exist.

SELECT 

    COALESCE(u.id, v.user_id) AS user_id, 
    u.user_name, 
    v.session_id,
     v.show_id, 
     v.watch_minutes

FROM join_ex04.ex04.users u

FULL OUTER JOIN join_ex04.ex04.viewing_sessions v 

    ON u.id = v.user_id;



-- Q15: Show every user, every subscription, and every plan in one query using FULL OUTER JOIN throughout.

SELECT 

    COALESCE(u.id, s.user_id) AS user_id, 

    u.user_name, 

    s.subscription_id, 

    COALESCE(p.plan_id, s.plan_id) AS plan_id, 

    p.plane_name As plan_name

FROM join_ex04.ex04.users u

FULL OUTER JOIN join_ex04.ex04.subscriptions s 

    ON u.id = s.user_id

FULL OUTER JOIN join_ex04.ex04.planes  p 

    ON s.plan_id = p.plan_id;

--BONUS QUESTION 
--01
--Users 4 Kabelo and 5 Lerato.

--02
--Subsciption 504 .

--03
--Shows 704 Cooking Lab and 706 Wild Earth.

--04
--Viewing session 905

--05
--Plan 14 Mobile 



