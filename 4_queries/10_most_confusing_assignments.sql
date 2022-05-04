SELECT assignments.id as id, name, day, chapter, count(assignment_submissions.*) as total_requests
FROM assignments
JOIN assignment_submissions ON assignment_id = assignments.id
GROUP BY assignments.id
ORDER BY total_requests desc
;