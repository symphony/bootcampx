SELECT students.name as name, students.start_date as start_date, cohorts.name as cohort_name, cohorts.start_date as cohort_start_date
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.start_date <> students.start_date
;