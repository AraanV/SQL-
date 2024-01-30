--INSERT Triggers

USE master;
SELECT Student_id,first_name,last_name,birth_day,studying INTO Test_Table1
FROM Student_Information_Table_1;

CREATE TABLE StudentLogs(
	Student_id int,
	status varchar(30)
);


CREATE TRIGGER Test_Table1_INSERT 
ON Test_Table1
	AFTER INSERT 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Student_id int
	SELECT @Student_id = Student_id FROM INSERTED;

	INSERT INTO StudentLogs (Student_id, status)
	VALUES(@Student_id, 'Inserted');
END;

INSERT INTO Test_Table1(Student_id,first_name,last_name,birth_day,studying) VALUES ('1010','Ryan','Howard','2000-07-29','Math');

SELECT * FROM StudentLogs;