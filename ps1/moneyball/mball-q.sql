.output pow-mb.txt
.headers on
.mode box
-- final query only

.print '<--Query 2 Cal Ripken jr salary by year-->'
SELECT
  s."year"   AS "year",
  s."salary" AS "salary"
FROM "salaries" s
JOIN "players" p ON p."id" = s."player_id"
WHERE p."first_name" = 'Cal'
  AND p."last_name"  = 'Ripken'
  AND p."birth_year" = 1960
ORDER BY s."year" DESC;

.print '<--Query 2 count-->'
SELECT COUNT(*) FROM (
  SELECT s."year"
  FROM "salaries" s
  JOIN "players" p ON p."id" = s."player_id"
  WHERE p."first_name" = 'Cal'
    AND p."last_name"  = 'Ripken'
    AND p."birth_year" = 1960
);









-- .print '<--Query 1 avg salary by year-->'
-- SELECT
--   "year" AS "year",
--   ROUND(AVG("salary"), 2) AS "average salary"
-- FROM "salaries"
-- GROUP BY "year"
-- ORDER BY "year" DESC;

-- .print '<--Query 1 count-->'
-- SELECT COUNT(DISTINCT "year") AS "P(1)_count"
-- FROM "salaries";

.output stdout
-- bash: sqlite3 moneyball.db < mball-q.sql