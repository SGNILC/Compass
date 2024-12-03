DROP IF TABLE EXISTS Topic

CREATE TABLE topics (
	topicID SERIAL PRIMARY KEY,
	topic_name VARCHAR(90)
);

INSERT INTO topics (topic_name) VALUES
	('DS & Algorithms'),
	('Machine Learning'),
	('Other')
	
SELECT * FROM topics