.output pow-mb.txt
.headers on
.mode box
-- final query only

.print '<--Query 1 avg salary by year-->'
SELECT
  "year" AS "year",
  ROUND(AVG("salary"), 2) AS "average salary"
FROM "salaries"
GROUP BY "year"
ORDER BY "year" DESC;

.print '<--Query 1 count-->'
SELECT COUNT(DISTINCT "year") AS "P(1)_count"
FROM "salaries";

.output stdout
-- bash: sqlite3 moneyball.db < mball-q.sql