SELECT *
FROM Student_Information_Table_1;

SELECT * 
FROM Teacher_Information_Table;

SELECT * 
FROM Class_Table;

SELECT * 
FROM Test_Table;

SELECT * 
FROM Scores_Table;

SELECT * 
FROM Enrolls_Table;

SELECT * 
FROM Student_Teacher_Table;


--Find all students first and last names
SELECT first_name, last_name
FROM Student_Information_Table_1;

--Find the first 5 students in the table by student id 
SELECT TOP 5 *
FROM Student_Information_Table_1;

--Find all students ordered by first_name
SELECT * 
FROM Student_Information_Table_1
ORDER BY first_name;

--Order students by descending birthday
SELECT * 
FROM Student_Information_Table_1
ORDER BY birth_day DESC;

--Find all the different departments that teachers teach 
SELECT DISTINCT department
FROM Teacher_Information_Table;

--Find all students with an 'a' in their first name
SELECT * FROM Student_Information_Table_1
WHERE LOWER(first_name) LIKE '%a%';

--Find the number of the math students born on or after April 1st, 2000
SELECT COUNT(Student_id)
FROM Student_Information_Table_1
WHERE studying = 'Math' AND birth_day > '2000-04-01';

--Find the average teacher salary 
SELECT AVG(salary_per_hour)
FROM Teacher_Information_Table;

--Wildcards. Find test id's with 50001
SELECT * 
FROM Scores_Table
WHERE test_id LIKE '%50001%';


--UNION. Create a list of all students and teachers id's and name the table accordingly
SELECT Student_id AS Student_Teacher_Names
FROM Student_Information_Table_1
UNION
SELECT Teacher_id
FROM Teacher_Information_Table;

--Joins 
SELECT Teacher_Information_Table.Teacher_id, Teacher_Information_Table.first_name, Class_Table.teacher_id, Class_Table.Class_id
FROM Teacher_Information_Table
JOIN Class_Table
ON Teacher_Information_Table.Teacher_id = Class_Table.teacher_id;

--Nested Query. Find the first and last names of students who's grades are above 75
SELECT Scores_Table.Student_id
FROM Scores_Table
WHERE Scores_Table.grade > 75;

SELECT Student_Information_Table_1.first_name, Student_Information_Table_1.last_name
FROM Student_Information_Table_1
	WHERE Student_Information_Table_1.Student_id IN (SELECT Scores_Table.Student_id
	FROM Scores_Table
	WHERE Scores_Table.grade > 75
);

--Triggers 
