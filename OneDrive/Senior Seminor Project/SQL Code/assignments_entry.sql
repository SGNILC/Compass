DROP TABLE IF EXISTS assignments

CREATE TABLE assignment (
	assignmentID SERIAL PRIMARY KEY,
	ass_name VARCHAR(90),
	ass_grade CHAR(1),
	date_assigned date,
	due_date DATE,
	submission_status CHAR(1),
	late_status BOOL,
	studentid SMALLINT REFERENCES students(studentid)
);

ALTER TABLE assignmentsentry
ADD COLUMN points SMALLINT 

SELECT percentage_upperbound INTO m FROM grades WHERE gradeid = 1 

do
$$
declare
   m smallint;
   n smallint;
begin
   -- select the number of actors from the actor table
   select percentage_upperbound
   into m
   from grades
   where gradeid = 5;
   select percentage_lowerbound
   into n
   from grades
   where gradeid = 5;
   -- show the number of actors
   raise notice 'm %', m;
   raise notice 'n %', n;
   UPDATE assignmentsentry
	SET points = floor(RANDOM() * (m-n+1) + n)::int
	WHERE ass_grade LIKE 'F';
end;
$$;

UPDATE assignmentsentry
SET points = null
WHERE ass_grade LIKE 'A'


SELECT 
	studentid,
	ass_grade,
	points
FROM assignmentsEntry
WHERE studentid = 1 OR studentid = 2
ORDER BY studentid


INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'A', '2024-11-08', '2024-11-12', '1', FALSE, 1),
('Data Structures Quiz', 'B', '2024-11-09', '2024-11-13', '0', TRUE, 1),
('Operating Systems Case Study', 'C', '2024-11-10', '2024-11-16', '1', FALSE, 1),
('Web Development Project', 'B', '2024-11-11', '2024-11-15', '0', TRUE, 1),
('Machine Learning Presentation', 'A', '2024-11-12', '2024-11-18', '1', FALSE, 1),
('Algorithm Analysis Report', 'A', '2024-11-08', '2024-11-12', '1', FALSE, 2),
('Data Structures Quiz', 'C', '2024-11-09', '2024-11-13', '0', TRUE, 2),
('Operating Systems Case Study', 'B', '2024-11-10', '2024-11-16', '1', TRUE, 2),
('Web Development Project', 'D', '2024-11-11', '2024-11-15', '0', FALSE, 2),
('Machine Learning Presentation', 'F', '2024-11-12', '2024-11-18', '1', FALSE, 2);
-- StudentID 3
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'B', '2024-11-08', '2024-11-12', '1', TRUE, 3),
('Data Structures Quiz', 'A', '2024-11-09', '2024-11-13', '0', FALSE, 3),
('Operating Systems Case Study', 'C', '2024-11-10', '2024-11-16', '1', FALSE, 3),
('Web Development Project', 'D', '2024-11-11', '2024-11-15', '0', TRUE, 3),
('Machine Learning Presentation', 'F', '2024-11-12', '2024-11-18', '1', TRUE, 3);

-- StudentID 4
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'C', '2024-11-08', '2024-11-12', '1', FALSE, 4),
('Data Structures Quiz', 'B', '2024-11-09', '2024-11-13', '0', TRUE, 4),
('Operating Systems Case Study', 'A', '2024-11-10', '2024-11-16', '1', TRUE, 4),
('Web Development Project', 'B', '2024-11-11', '2024-11-15', '0', FALSE, 4),
('Machine Learning Presentation', 'C', '2024-11-12', '2024-11-18', '1', FALSE, 4);

-- StudentID 5
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'A', '2024-11-08', '2024-11-12', '0', FALSE, 5),
('Data Structures Quiz', 'D', '2024-11-09', '2024-11-13', '1', TRUE, 5),
('Operating Systems Case Study', 'B', '2024-11-10', '2024-11-16', '0', TRUE, 5),
('Web Development Project', 'A', '2024-11-11', '2024-11-15', '1', FALSE, 5),
('Machine Learning Presentation', 'C', '2024-11-12', '2024-11-18', '1', FALSE, 5);

-- StudentID 6
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'A', '2024-11-08', '2024-11-12', '0', FALSE, 6),
('Data Structures Quiz', 'F', '2024-11-09', '2024-11-13', '1', TRUE, 6),
('Operating Systems Case Study', 'A', '2024-11-10', '2024-11-16', '0', TRUE, 6),
('Web Development Project', 'A', '2024-11-11', '2024-11-15', '1', FALSE, 6),
('Machine Learning Presentation', 'B', '2024-11-12', '2024-11-18', '1', FALSE, 6);

-- StudentID 7
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'A', '2024-11-08', '2024-11-12', '1', FALSE, 7),
('Data Structures Quiz', 'B', '2024-11-09', '2024-11-13', '0', TRUE, 7),
('Operating Systems Case Study', 'C', '2024-11-10', '2024-11-16', '1', TRUE, 7),
('Web Development Project', 'D', '2024-11-11', '2024-11-15', '1', FALSE, 7),
('Machine Learning Presentation', 'B', '2024-11-12', '2024-11-18', '0', FALSE, 7);

-- StudentID 8
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'B', '2024-11-08', '2024-11-12', '1', TRUE, 8),
('Data Structures Quiz', 'C', '2024-11-09', '2024-11-13', '1', FALSE, 8),
('Operating Systems Case Study', 'A', '2024-11-10', '2024-11-16', '0', FALSE, 8),
('Web Development Project', 'C', '2024-11-11', '2024-11-15', '0', TRUE, 8),
('Machine Learning Presentation', 'D', '2024-11-12', '2024-11-18', '1', TRUE, 8);

-- StudentID 9
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'C', '2024-11-08', '2024-11-12', '1', FALSE, 9),
('Data Structures Quiz', 'A', '2024-11-09', '2024-11-13', '0', TRUE, 9),
('Operating Systems Case Study', 'B', '2024-11-10', '2024-11-16', '1', FALSE, 9),
('Web Development Project', 'D', '2024-11-11', '2024-11-15', '1', TRUE, 9),
('Machine Learning Presentation', 'C', '2024-11-12', '2024-11-18', '1', FALSE, 9);

-- StudentID 10
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'A', '2024-11-08', '2024-11-12', '0', FALSE, 10),
('Data Structures Quiz', 'B', '2024-11-09', '2024-11-13', '1', TRUE, 10),
('Operating Systems Case Study', 'D', '2024-11-10', '2024-11-16', '1', FALSE, 10),
('Web Development Project', 'A', '2024-11-11', '2024-11-15', '0', TRUE, 10),
('Machine Learning Presentation', 'B', '2024-11-12', '2024-11-18', '1', FALSE, 10);

-- StudentID 11
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'B', '2024-11-08', '2024-11-12', '1', FALSE, 11),
('Data Structures Quiz', 'C', '2024-11-09', '2024-11-13', '0', TRUE, 11),
('Operating Systems Case Study', 'A', '2024-11-10', '2024-11-16', '0', FALSE, 11),
('Web Development Project', 'C', '2024-11-11', '2024-11-15', '1', TRUE, 11),
('Machine Learning Presentation', 'A', '2024-11-12', '2024-11-18', '1', FALSE, 11);

-- StudentID 12
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'D', '2024-11-08', '2024-11-12', '1', TRUE, 12),
('Data Structures Quiz', 'C', '2024-11-09', '2024-11-13', '1', FALSE, 12),
('Operating Systems Case Study', 'B', '2024-11-10', '2024-11-16', '1', FALSE, 12),
('Web Development Project', 'A', '2024-11-11', '2024-11-15', '0', TRUE, 12),
('Machine Learning Presentation', 'B', '2024-11-12', '2024-11-18', '1', TRUE, 12);

-- StudentID 13
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'A', '2024-11-08', '2024-11-12', '0', TRUE, 13),
('Data Structures Quiz', 'B', '2024-11-09', '2024-11-13', '1', FALSE, 13),
('Operating Systems Case Study', 'C', '2024-11-10', '2024-11-16', '0', FALSE, 13),
('Web Development Project', 'D', '2024-11-11', '2024-11-15', '0', TRUE, 13),
('Machine Learning Presentation', 'A', '2024-11-12', '2024-11-18', '1', FALSE, 13);

-- StudentID 14
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'C', '2024-11-08', '2024-11-12', '0', FALSE, 14),
('Data Structures Quiz', 'D', '2024-11-09', '2024-11-13', '1', TRUE, 14),
('Operating Systems Case Study', 'A', '2024-11-10', '2024-11-16', '1', FALSE, 14),
('Web Development Project', 'B', '2024-11-11', '2024-11-15', '0', FALSE, 14),
('Machine Learning Presentation', 'C', '2024-11-12', '2024-11-18', '1', TRUE, 14);

-- StudentID 15
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'B', '2024-11-08', '2024-11-12', '1', TRUE, 15),
('Data Structures Quiz', 'A', '2024-11-09', '2024-11-13', '0', FALSE, 15),
('Operating Systems Case Study', 'B', '2024-11-10', '2024-11-16', '1', TRUE, 15),
('Web Development Project', 'A', '2024-11-11', '2024-11-15', '1', FALSE, 15),
('Machine Learning Presentation', 'D', '2024-11-12', '2024-11-18', '0', TRUE, 15);

-- StudentID 16
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'A', '2024-11-08', '2024-11-12', '1', FALSE, 16),
('Data Structures Quiz', 'B', '2024-11-09', '2024-11-13', '0', TRUE, 16),
('Operating Systems Case Study', 'C', '2024-11-10', '2024-11-16', '1', TRUE, 16),
('Web Development Project', 'A', '2024-11-11', '2024-11-15', '0', FALSE, 16),
('Machine Learning Presentation', 'B', '2024-11-12', '2024-11-18', '1', TRUE, 16);

-- StudentID 17
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'C', '2024-11-08', '2024-11-12', '1', TRUE, 17),
('Data Structures Quiz', 'A', '2024-11-09', '2024-11-13', '1', FALSE, 17),
('Operating Systems Case Study', 'D', '2024-11-10', '2024-11-16', '0', TRUE, 17),
('Web Development Project', 'B', '2024-11-11', '2024-11-15', '1', FALSE, 17),
('Machine Learning Presentation', 'C', '2024-11-12', '2024-11-18', '0', TRUE, 17);

-- StudentID 18
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'B', '2024-11-08', '2024-11-12', '1', FALSE, 18),
('Data Structures Quiz', 'C', '2024-11-09', '2024-11-13', '0', TRUE, 18),
('Operating Systems Case Study', 'A', '2024-11-10', '2024-11-16', '1', FALSE, 18),
('Web Development Project', 'D', '2024-11-11', '2024-11-15', '1', TRUE, 18),
('Machine Learning Presentation', 'B', '2024-11-12', '2024-11-18', '0', FALSE, 18);

-- StudentID 19
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'C', '2024-11-08', '2024-11-12', '0', TRUE, 19),
('Data Structures Quiz', 'D', '2024-11-09', '2024-11-13', '1', FALSE, 19),
('Operating Systems Case Study', 'B', '2024-11-10', '2024-11-16', '1', TRUE, 19),
('Web Development Project', 'A', '2024-11-11', '2024-11-15', '0', TRUE, 19),
('Machine Learning Presentation', 'C', '2024-11-12', '2024-11-18', '1', TRUE, 19);

-- StudentID 20
INSERT INTO assignments (ass_name, ass_grade, date_assigned, due_date, submission_status, late_status, studentid) VALUES
('Algorithm Analysis Report', 'A', '2024-11-08', '2024-11-12', '1', FALSE, 20),
('Data Structures Quiz', 'B', '2024-11-09', '2024-11-13', '1', TRUE, 20),
('Operating Systems Case Study', 'C', '2024-11-10', '2024-11-16', '0', TRUE, 20),
('Web Development Project', 'D', '2024-11-11', '2024-11-15', '0', FALSE, 20),
('Machine Learning Presentation', 'B', '2024-11-12', '2024-11-18', '1', FALSE, 20);

SELECT * FROM assignmentsEntry

