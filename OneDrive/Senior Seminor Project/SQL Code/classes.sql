DROP TABLE IF EXISTS classes

CREATE TABLE classes (
	classID SERIAL PRIMARY KEY,
	class_name VARCHAR(90),
	total_student_count SMALLINT
	

);

INSERT INTO classes (class_name, total_student_count) VALUES
	('CS101', 20)


SELECT * FROM classes