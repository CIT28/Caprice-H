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



.print 'query 1'
.print 'find the names and cities of all public schools in Massachusetts'


SELECT "name", "city", "type"
FROM "schools"
WHERE "type" LIKE '%Public School%';

.print 'Count for query 1'
.print 'Count results'

SELECT COUNT(*) AS 'Pub School Count' FROM (
    SELECT "name", "city", "type"
    FROM "schools"
    WHERE "type" = '%Public School%'
);
.output stdout
-- bash command sqlite3 dese.db < dese-q.sql