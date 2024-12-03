DROP TABLE IF EXISTS gpa

CREATE TABLE gpa (
	gpaID SERIAL PRIMARY KEY,
	letter_grade CHAR(1),
	gpaVal DECIMAL(2,1) 
);

INSERT INTO gpa (letter_grade, gpaVal) VALUES
 ('A', 3.7),
 ('B', 2.7),
 ('C', 1.7),
 ('D', 0.7),
 ('F', 0.0)

SELECT * FROM gpa