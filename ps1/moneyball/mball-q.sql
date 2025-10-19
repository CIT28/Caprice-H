.output pow-mb.txt
.headers on
.mode box
-- final query only

.print '<--Query 5 teams Satchel Paige played for-->'
SELECT
  t."name" AS "team"
FROM "teams" t
JOIN "performances" pf ON pf."team_id" = t."id"
JOIN "players"      p  ON p."id"       = pf."player_id"
WHERE p."last_name" = 'Paige'
  AND (p."first_name" = 'Satchel' OR p."first_name" = 'Leroy')
GROUP BY t."name"
ORDER BY t."name" ASC;

.print '<--Query 5 count-->'
SELECT COUNT(*) FROM (
  SELECT t."name"
  FROM "teams" t
  JOIN "performances" pf ON pf."team_id" = t."id"
  JOIN "players"      p  ON p."id"       = pf."player_id"
  WHERE p."last_name" = 'Paige'
    AND (p."first_name" = 'Satchel' OR p."first_name" = 'Leroy')
  GROUP BY t."name"
);




-- .print '<--Query 4 50 lowest-paid players in 2001-->'
-- SELECT
--   p."first_name",
--   p."last_name",
--   s."salary"
-- FROM "salaries" s
-- JOIN "players"  p ON p."id" = s."player_id"
-- WHERE s."year" = 2001
-- ORDER BY s."salary" ASC, p."first_name" ASC, p."last_name" ASC, p."id" ASC
-- LIMIT 50;

-- .print '<--Query 4 count-->'
-- SELECT COUNT(*) FROM (
--   SELECT 1
--   FROM "salaries" s
--   JOIN "players"  p ON p."id" = s."player_id"
--   WHERE s."year" = 2001
--   ORDER BY s."salary" ASC, p."first_name" ASC, p."last_name" ASC, p."id" ASC
--   LIMIT 50
-- );

-- .print '<--Query 3 Ken Griffey Jr and HR by year-->'
-- SELECT
--   pf."year" AS "year",
--   pf."HR"   AS "home runs"
-- FROM "performances" pf
-- JOIN "players" p ON p."id" = pf."player_id"
-- WHERE p."first_name" = 'Ken'
--   AND p."last_name"  = 'Griffey'
--   AND p."birth_year" = 1969
-- ORDER BY pf."year" DESC;

-- .print '<--Query 3 count-->'
-- SELECT COUNT(*) FROM (
--   SELECT pf."year"
--   FROM "performances" pf
--   JOIN "players" p ON p."id" = pf."player_id"
--   WHERE p."first_name" = 'Ken'
--     AND p."last_name"  = 'Griffey'
--     AND p."birth_year" = 1969
-- );


-- .print '<--Query 2 Cal Ripken jr salary by year-->'
-- SELECT
--   s."year"   AS "year",
--   s."salary" AS "salary"
-- FROM "salaries" s
-- JOIN "players" p ON p."id" = s."player_id"
-- WHERE p."first_name" = 'Cal'
--   AND p."last_name"  = 'Ripken'
--   AND p."birth_year" = 1960
-- ORDER BY s."year" DESC;

-- .print '<--Query 2 count-->'
-- SELECT COUNT(*) FROM (
--   SELECT s."year"
--   FROM "salaries" s
--   JOIN "players" p ON p."id" = s."player_id"
--   WHERE p."first_name" = 'Cal'
--     AND p."last_name"  = 'Ripken'
--     AND p."birth_year" = 1960
-- );


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