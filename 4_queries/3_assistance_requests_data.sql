SELECT  teachers.name AS teacher_name,
        students.name AS student_name,
        assignments.name AS assignment_name,
        completed_at-started_at AS duration
FROM assistance_requests
JOIN assignments ON assignments.id = assignment_id
JOIN students ON students.id = student_id
JOIN teachers ON teachers.id = teacher_id
ORDER BY duration
;