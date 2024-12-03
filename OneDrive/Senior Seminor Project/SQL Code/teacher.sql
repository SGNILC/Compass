DROP TABLE IF EXISTS teacher

CREATE TABLE teacher (
	teacherID SERIAL PRIMARY KEY,
	first_name VARCHAR(90),
	last_name VARCHAR(90),
	total_student_count SMALLINT,
	classID INTEGER REFERENCES classes (classid)
	
	
);

 -- make classID a foreign key
ALTER TABLE teacher
ADD FOREIGN KEY (classID) REFERENCES classes(classID)

INSERT INTO teacher (first_name, last_name, total_student_count, classid) VALUES
	('John', 'Anderson', 20, 1)

SELECT * FROM teacher

SELECT 
	t.first_name,
	c.class_name
FROM 
	teacher as t JOIN classes as c ON (t.classid = c.classid)