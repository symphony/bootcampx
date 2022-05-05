require('dotenv').config();
const { Pool } = require('pg');
let [,, cohort = 'MAR', limit = 5] = [...process.argv];
cohort = `%${cohort}%`;

const pool = new Pool({
  user: process.env.PG_USER,
  password: process.env.KEY,
  host: process.env.HOST,
  database: process.env.DB
});

pool.query(`
SELECT students.id as id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`, [cohort, limit])
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohort`);
    });
  })
  .catch(err => console.error('query error', err.stack));

pool.connect();