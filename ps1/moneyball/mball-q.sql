.output pow-a.txt
.headers on
.mode box
--queries below here
-- .print '<--Query 1 average player salary by year-->'
-- SELECT
--   "year" AS "year",
--   ROUND(AVG("salary"), 2) AS "average salary"
-- FROM "salaries"
-- GROUP BY "year"
-- ORDER BY "year" DESC;

-- .print '<--Query 1 count-->'
-- SELECT COUNT(DISTINCT "year") AS "P(1)_count"
-- FROM "salaries";
.print '<--Query 3 Ken Griffey Jr. HR by year-->'

SELECT
  pf."year" AS "year",
  pf."HR"   AS "home runs"
FROM "performances" pf
JOIN "players" p ON p."id"=pf."player_id"
WHERE p."first_name"='Ken' AND p."last_name"='Griffey' AND p."birth_year"=1969
ORDER BY pf."year" DESC;



-- SELECT
--   s."year"   AS "year",
--   s."salary" AS "salary"
-- FROM "salaries" s
-- WHERE s."player_id" IN (
--   SELECT p."id"
--   FROM "players" p
--   WHERE p."first_name"='Cal' AND p."last_name"='Ripken' AND p."birth_year"=1960
-- )
-- ORDER BY s."year" DESC;

.print '<--Query 3 count-->'

SELECT COUNT(*) AS "P(3)_count"
FROM "performances" pf
JOIN "players" p ON p."id"=pf."player_id"
WHERE p."first_name"='Ken' AND p."last_name"='Griffey' AND p."birth_year"=1969;


-- SELECT COUNT(*) AS "P(2)_count"
-- FROM "salaries" s
-- WHERE s."player_id" IN (
--   SELECT p."id"
--   FROM "players" p
--   WHERE p."first_name"='Cal' AND p."last_name"='Ripken' AND p."birth_year"=1960
-- );

.print '<--Query Variation-->'

SELECT "id","first_name","last_name","birth_year"
FROM "players"
WHERE "first_name"='Ken' AND "last_name"='Griffey';


-- SELECT "id","first_name","last_name","birth_year"
-- FROM "players"
-- WHERE "first_name"='Cal' AND "last_name"='Ripken';

.print '<--Query variation count-->'
-- SELECT COUNT(*) AS "rows"
-- FROM "players"
-- WHERE "first_name"='Cal' AND "last_name"='Ripken';

SELECT COUNT(*) AS rows
FROM "players"
WHERE "first_name"='Ken' AND "last_name"='Griffey';


-- .print 'moneyball tables and schema'
-- .tables
-- .schema




.output stdout
-- bash command sqlite3 moneyball.db < w11-q.sql