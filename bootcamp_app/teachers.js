require('dotenv').config();
const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.PG_USER,
  password: process.env.KEY,
  host: process.env.HOST,
  database: process.env.DB
});

let [,, cohort = 'JUL'] = [...process.argv];
cohort = `${cohort.toUpperCase()}%`;
pool.query(`
SELECT teachers.name as name, max(cohorts.name) as cohort
FROM cohorts
JOIN students ON cohort_id = cohorts.id
JOIN assistance_requests ON student_id = students.id
JOIN teachers ON teachers.id = teacher_id
WHERE cohorts.name LIKE $1
GROUP BY teachers.name
;`, [cohort])
  .then(res => {
    res.rows.forEach(teacher => {
      console.log(`${teacher.cohort}: ${teacher.name}`);
    });
  })
  .catch(err => console.error('query error', err.stack));

pool.connect();