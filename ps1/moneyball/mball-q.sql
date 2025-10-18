.output pow-a.txt
.headers on
.mode box
--queries below here
.print '<--Query 1 average player salary by year-->'
SELECT
  "year" AS "year",
  ROUND(AVG("salary"), 2) AS "average salary"
FROM "salaries"
GROUP BY "year"
ORDER BY "year" DESC;

.print '<--Query 1 count-->'
SELECT COUNT(DISTINCT "year") AS "P(1)_count"
FROM "salaries";

.print '<--Query Variation-->'



.print '<--Query variation count-->'




-- .print 'moneyball tables and schema'
-- .tables
-- .schema




.output stdout
-- bash command sqlite3 moneyball.db < w11-q.sql