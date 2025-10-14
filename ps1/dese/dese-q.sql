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
.print '<----->'
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

.print '<----->'
.print ‘schools per district'
SELECT d."name" AS "district", COUNT(s."id") AS "school_count"
FROM "districts" d
JOIN "schools" s ON s."district_id" = d."id"
GROUP BY d."name"
ORDER BY "school_count" DESC, "district" ASC;

.print ‘query 3 COUNT'
SELECT COUNT(*) AS "Q3 COUNT"
FROM (
  SELECT d."name"
  FROM "districts" d
  JOIN "schools" s ON s."district_id" = d."id"
  GROUP BY d."name"
);

.output stdout
-- bash command sqlite3 dese.db < dese-q.sql