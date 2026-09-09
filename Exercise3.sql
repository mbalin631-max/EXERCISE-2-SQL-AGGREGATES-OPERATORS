--We are creating a Catalog (database) 
CREATE CATALOG IF NOT EXISTS career;

CREATE SCHEMA IF NOT EXISTS career.industry;

CREATE TABLE IF NOT EXISTS career.industry.students (
student_id INT, student_name STRING, age INT, department STRING
);

INSERT INTO career.industry.students VALUES (1, 'Alice', 20, 'IT'), (2, 'Bob', 22, 'HR'), (3, 'Charlie', 21, 'IT'), (4, 'Diana', 23, 'Finance'), (5, 'Eve', 22, 'HR');

SELECT* FROM career.industry.students;

-- QUESTION 1: List all distinct departments in the table
SELECT DISTINCT department
FROM career.industry.students;

-- QUESTION 2: Get the average age of students per department
SELECT department, AVG(age) AS average_age
FROM career.industry.students
GROUP BY department;

-- QUESTION 3: Show departments with more than 1 student
SELECT department, COUNT(*) AS student_count
FROM career.industry.students
GROUP BY department
HAVING student_count > 1;

-- QUESTION 4: Get all students whose age is between 21 and 23
SELECT *
FROM career.industry.students
WHERE age BETWEEN 21 AND 23;

-- QUESTION 5: List all students in the IT or HR department who are older than 21
SELECT * 
FROM career.industry.students
WHERE department IN ('IT', 'HR') AND age > 21;


DROP TABLE career.industry.students;

CREATE OR REPLACE TABLE career.industry.students (
student_id INT, student_name STRING, age INT, department STRING
);


INSERT INTO career.industry.students VALUES (1, 'Alice', 20, 'IT'), (2, 'Bob', 22, 'HR'), (3, 'Charlie', 21, 'IT'), (4, 'Diana', 23, 'Finance'), (5, 'Eve', 22, 'HR');


SELECT * FROM career.industry.students;

 --QUESTION 1: List all distinct departments in the table
SELECT DISTINCT department
FROM career.industry.students;

--QUESTION 2: Get the average age of students per department
SELECT department, AVG(age) AS average_age
FROM career.industry.students
GROUP BY department;

 --QUESTION 3: Show departments with more than 1 student
SELECT department, COUNT(*) AS student_count
FROM career.industry.students
GROUP BY department
HAVING student_count > 1;

--QUESTION 4: Get all students whose age is between 21 and 23
SELECT *
FROM career.industry.students
WHERE age BETWEEN 21 AND 23;

--QUESTION 5: List all students in the IT or HR department who are older than 21
SELECT * 
FROM career.industry.students
WHERE department IN ('IT', 'HR') AND age > 21;


CREATE CATALOG IF NOT EXISTS career;

CREATE SCHEMA IF NOT EXISTS career.student;

CREATE TABLE IF NOT EXISTS career.student.courses (
course_id INT, course_name STRING, department STRING, credits INT
);

INSERT INTO career.student.courses VALUES (101, 'SQL Basics', 'IT', 3), (102, 'Python', 'IT', 4), (103, 'Data Science', 'IT', 4), (104, 'Excel', 'Finance', 2), (105, 'Statistics', 'HR', 3);

SELECT * FROM career.student.courses;

--QUESTION 6: Show total credits per department, only for departments with more than 5 credits
SELECT department,
SUM(credits) AS total_credits
FROM career.student.courses
GROUP BY department HAVING SUM(credits) > 5;

--QUESTION 7: List all courses that do not have 4 credits
SELECT *
FROM career.student.courses
WHERE credits != 4;

--QUESTION 8: Show the top 3 courses by credits in descending order
SELECT course_id, 
course_name, 
credits
FROM career.student.courses
ORDER BY credits DESC
LIMIT 3;


CREATE CATALOG IF NOT EXISTS career;

CREATE SCHEMA IF NOT EXISTS career.student;

CREATE TABLE IF NOT EXISTS career.student.enrollments (
enrollment_id INT, student_id INT, course_id INT, grade INT
);

INSERT INTO career.student.enrollments VALUES (1, 1, 101, 85), (2, 2, 102, 78), (3, 3, 103, 90), (4, 4, 104, 88), (5, 5, 105, 82);

SELECT * FROM career.student.enrollments;


--QUESTION 9: Get the maximum, minimum, and average grade across all enrollments
SELECT MAX(grade) AS max_grade,
MIN(grade) AS min_grade,
AVG(grade) AS avg_grade
FROM career.student.enrollments;

--QUESTION 10: Count how many enrollments exist per course
SELECT course_id,
COUNT(enrollment_id) AS enrollment_count
FROM career.student.enrollments
GROUP BY course_id;



CREATE CATALOG IF NOT EXISTS career;

CREATE SCHEMA IF NOT EXISTS career.industry;

CREATE TABLE IF NOT EXISTS career.industry.salaries (
employee_id INT, name STRING, department STRING, salary INT, bonus INT
);

INSERT INTO career.industry.salaries VALUES (1, 'Tom', 'IT', 60000, 5000), (2, 'Jerry', 'HR', 55000, 4000), (3, 'Spike', 'Finance', 70000, 6000), (4, 'Tyke', 'IT', 62000, 5500), (5, 'Butch', 'HR', 54000, 3500);

SELECT * FROM career.industry.salaries;

--QUESTION 11: Find total salary and bonus per department
SELECT department,
SUM(salary) AS total_salary,
SUM(bonus) AS total_bonus
FROM career.industry.salaries
GROUP BY department;

--QUESTION 12: Show departments where average salary is above 55000
SELECT department,
AVG(salary) AS avg_salary
FROM career.industry.salaries
GROUP BY department
HAVING avg_salary > 55000;

--QUESTION 13: List employees whose salary plus bonus is greater than 60000
SELECT *
FROM career.industry.salaries
WHERE salary + bonus > 60000;



CREATE CATALOG IF NOT EXISTS career;

CREATE SCHEMA IF NOT EXISTS career.industry;

CREATE TABLE IF NOT EXISTS career.industry.projects (
project_id INT, project_name STRING, department STRING, budget INT
);

INSERT INTO career.industry.projects VALUES (1, 'AI App', 'IT', 120000), (2, 'Payroll System', 'Finance', 80000), (3, 'Dashboard', 'IT', 150000), (4, 'Website', 'Marketing', 60000), (5, 'HR Portal', 'HR', 50000);

SELECT * FROM career.industry.projects;

--QUESTION 14: Show total and average budget per department. Only include departments with average budget above 70000
SELECT department,
SUM(budget) AS total_budget,
AVG(budget) AS avg_budget
FROM career.industry.projects
GROUP BY department
HAVING avg_budget > 70000;

--QUESTION 15: List all projects with budgets between 50000 and 120000, excluding the marketing department
SELECT *
FROM career.industry.projects
WHERE budget BETWEEN 50000 AND 120000 AND department != 'Marketing';
