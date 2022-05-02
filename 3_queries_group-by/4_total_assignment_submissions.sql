SELECT cohorts.name as cohort_name, COUNT(*) as total_submissions
FROM cohorts
JOIN students ON cohort_id = cohorts.id
JOIN assignment_submissions ON student_id = students.id
GROUP BY cohorts.name
ORDER BY total_submissions DESC
;