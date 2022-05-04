-- -- deletes all data and rebuilds tables. only use if necessary
-- DROP TABLE IF EXISTS assignments, assignment_submissions;

CREATE TABLE assignments (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  content TEXT,
  day INTEGER,
  chapter INTEGER,
  duration INTEGER
);

CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  duration INTEGER,
  submission_date DATE
);

-- -- populate tables with example data
-- \i seeds/assignments_seeds.sql
-- \i seeds/assignment_submissions_seeds.sql