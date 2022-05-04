SELECT teachers.name as teacher, max(cohorts.name) as cohort, count(assistance_requests.*) as total_assistances
FROM cohorts
JOIN students ON cohort_id = cohorts.id
JOIN assistance_requests ON student_id = students.id
JOIN teachers ON teachers.id = teacher_id
WHERE cohorts.name = 'JUL02'
GROUP BY teacher
;