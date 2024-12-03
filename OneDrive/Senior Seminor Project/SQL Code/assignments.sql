DROP TABLE IF EXISTS assignments

CREATE TABLE assignments (
	assignmentID SERIAL PRIMARY KEY,
	ass_name VARCHAR(90),
	date_assigned date,
	due_date DATE
);

ALTER TABLE assignments
ADD COLUMN topic SMALLINT

UPDATE assignments
SET topic = '1'
WHERE ass_name LIKE '%Alg%' OR ass_name LIKE '%Data%'



INSERT INTO assignments (ass_name, date_assigned, due_date) VALUES
('Algorithm Analysis Report', '2024-11-08', '2024-11-12'),
('Data Structures Quiz', '2024-11-09', '2024-11-13'),
('Operating Systems Case Study', '2024-11-10', '2024-11-16'),
('Web Development Project', '2024-11-11', '2024-11-15'),
('Machine Learning Presentation', '2024-11-12', '2024-11-18')

SELECT * FROM assignments ORDER BY assignmentid ASC
