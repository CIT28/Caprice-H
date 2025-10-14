.mode box
.output pow-dese.txt
--queries below here
.print '<----->'
-- .print 'DESE tables and schema'
-- .tables
-- .schema


-- .print 'First 10 rows: districts'
-- SELECT * FROM "districts" LIMIT 10;

-- .print 'First 10 rows: graduation_rates'
-- SELECT * FROM "graduation_rates" LIMIT 10;

-- .print 'First 10 rows: staff_evaluations'
-- SELECT * FROM "staff_evaluations" LIMIT 10;

-- .print 'First 10 rows: expenditures'
-- SELECT * FROM "expenditures" LIMIT 10;

-- .print 'First 10 rows: schools'
-- SELECT * FROM "schools" LIMIT 10;

-- .print '<----->'
-- .print '<----->'
-- .print 'names + cities of all PUBLIC schools in MA'
-- SELECT "name", "city"
-- FROM "schools"
-- WHERE "type" = 'Public School'
--   AND "state" = 'MA';

-- .print 'Q1 COUNT'
-- SELECT COUNT(*) AS "Q1 COUNT"
-- FROM "schools"
-- WHERE "type" = 'Public School'
--   AND "state" = 'MA';
.print '<----->'
.print ‘districts no longer operational'
SELECT "name"
FROM "districts"
WHERE "name" LIKE '%(non-op)';

.print ‘q2 COUNT'
SELECT COUNT(*) AS "Q2 COUNT"
FROM "districts"
WHERE "name" LIKE '%(non-op)';

-- .print 'query 1'
-- .print 'find the names and cities of all public schools in Massachusetts'


-- SELECT "name", "city", "type"
-- FROM "schools"
-- WHERE "type" LIKE '%Public School%';

-- .print 'Count for query 1'
-- .print 'Count results'

-- SELECT COUNT(*) AS 'Pub School Count' FROM (
--     SELECT "name", "city", "type"
--     FROM "schools"
--     WHERE "type" = '%Public School%'
-- );

-- .print 'DESE query 1 Schools per type'

-- SELECT "type", COUNT(*) AS "school_count"
-- FROM "schools"
-- GROUP BY "type"
-- ORDER BY "school_count" DESC, "type" ASC;

-- .print 'DESE query 1 COUNT'
-- SELECT COUNT(*) AS "Q1 COUNT"
-- FROM (
--   SELECT "type"
--   FROM "schools"
--   GROUP BY "type"
-- );


-- .print 'Count schools per district, sort by count, show top 10'
-- SELECT d."name" AS "district",
--        COUNT(s."id") AS "school_count"
-- FROM "districts" d
-- JOIN "schools"   s ON s."district_id" = d."id"
-- GROUP BY d."name"
-- ORDER BY "school_count" DESC, "district" ASC
-- LIMIT 10;

-- --  how many districts appear in the grouped result
-- SELECT COUNT(*) AS "Q2 COUNT"
-- FROM (
--   SELECT d."name"
--   FROM "districts" d
--   JOIN "schools"   s ON s."district_id" = d."id"
--   GROUP BY d."name"
-- );


-- .print '<----->'
-- .print ' top cities by number of schools'
-- SELECT "city", COUNT(*) AS "school_count"
-- FROM "schools"
-- GROUP BY "city"
-- ORDER BY "school_count" DESC, "city" ASC
-- LIMIT 10;

-- .print ‘query2 COUNT'

-- SELECT COUNT(*) AS "Q2 COUNT"
-- FROM ( SELECT "city" FROM "schools" GROUP BY "city" );

-- .print '<----->'
-- .print ‘schools per district'
-- SELECT d."name" AS "district", COUNT(s."id") AS "school_count"
-- FROM "districts" d
-- JOIN "schools" s ON s."district_id" = d."id"
-- GROUP BY d."name"
-- ORDER BY "school_count" DESC, "district" ASC;

-- .print ‘query 3 COUNT'
-- SELECT COUNT(*) AS "Q3 COUNT"
-- FROM (
--   SELECT d."name"
--   FROM "districts" d
--   JOIN "schools" s ON s."district_id" = d."id"
--   GROUP BY d."name"
-- );

-- .print 'the two columns we need'
-- SELECT s."id" AS "school_id",
--        gr."graduated"
-- FROM "schools" s
-- JOIN "graduation_rates" gr ON gr."school_id" = s."id"
-- ORDER BY gr."graduated" DESC
-- LIMIT 15;


-- .print 'query 3 COUNT'
-- SELECT COUNT(*) AS "Q4 COUNT"
-- FROM (
--   SELECT s."id"
--   FROM "schools" s
--   JOIN "graduation_rates" gr ON gr."school_id" = s."id"
-- ) ;

-- .print '<----->'
-- .print 'query 5 top ZIP codes by number of schools'

-- SELECT "zip",
--        COUNT(*) AS "school_count"
-- FROM "schools"
-- GROUP BY "zip"
-- ORDER BY "school_count" DESC, "zip" ASC
-- LIMIT 10;

-- .print 'query 5 COUNT'
-- SELECT COUNT(*) AS "Q5 COUNT"
-- FROM (
--   SELECT "zip"
--   FROM "schools"
--   GROUP BY "zip"
-- );

-- .print '<----->'
-- .print 'districts that are with >=5 schools'

-- SELECT d."name" AS "district",
--        COUNT(s."id") AS "school_count"
-- FROM "districts" d
-- JOIN "schools" s ON s."district_id" = d."id"
-- GROUP BY d."name"
-- HAVING COUNT(s."id") >= 5
-- ORDER BY "school_count" DESC, "district" ASC;

-- .print 'Query 6 COUNT'
-- SELECT COUNT(*) AS "Q6 COUNT"
-- FROM (
--   SELECT d."name"
--   FROM "districts" d
--   JOIN "schools" s ON s."district_id" = d."id"
--   GROUP BY d."name"
--   HAVING COUNT(s."id") >= 5
-- ) ;

-- .print 'The average district per-pupil expenditure last year'
-- SELECT
--     AVG(per_pupil_expenditure) AS "Average District Per-Pupil Expenditure"
-- FROM 
--     expenditures;

-- SELECT
--     COUNT(*) AS "Number of Districts"
-- FROM 
--     expenditures;


.print '<----->'

SELECT city, COUNT(*) AS number_of_public_schools
FROM schools
GROUP BY city
ORDER BY number_of_public_schools DESC, city ASC
LIMIT 10;



.output stdout
-- bash command sqlite3 dese.db < dese-q.sql