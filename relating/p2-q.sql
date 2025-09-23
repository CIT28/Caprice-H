-- starting the pow workflow
-- changes terminal output for readability 
.mode box
  
-- changes terminal output from standard output (stdout) to pow.txt file
.output '| cat >> pow-p2.txt'
-- .print '<----->'  
-- updates the pow.txt with content in single quotes
.print 'testing setup'  
  
-- SQL command (query) to view all the column contents in the longlist table   
-- Copy your SQL command below here
-- .print '<----->'  
---.tables
---.schema
-- .print 'INNER JOIN sea_lions with migrations on id'
-- SELECT * 
-- FROM "sea_lions"
-- JOIN "migrations"
-- ON "migrations"."id" = "sea_lions"."id";

-- .print 'LEFT OUTER JOIN all sea_lions with any of the matching migrations'
-- SELECT *
-- FROM "sea_lions"
-- LEFT JOIN "migrations"
--   ON "migrations"."id" = "sea_lions"."id";

-- .print 'every row from both tables, matched when possible'
-- SELECT * FROM "sea_lions"
-- FULL JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";

-- .print 'NATURAL JOIN: join on all same-named columns automatically'
-- SELECT * FROM "sea_lions"
-- NATURAL JOIN "migrations";

.print 'show all translator names'
SELECT "name" FROM "translators";

.print 'show all author names'
SELECT "name" FROM "authors";

.print 'combine translator and author names no duplicates'
SELECT "name" FROM "translators"
UNION
SELECT "name" FROM "authors";

.print 'show authors with label'
SELECT 'author' AS "profession", "name" FROM "authors";

.print 'combine authors and translators with labels'
SELECT 'author' AS "profession", "name" FROM "authors"
UNION
SELECT 'translator' AS "profession", "name" FROM "translators";

.print 'names those that are both authors and translators'
SELECT "name" FROM "authors"
INTERSECT
SELECT "name" FROM "translators";

.print 'authors who are not translators'
SELECT "name" FROM "authors"
EXCEPT
SELECT "name" FROM "translators";

.print 'find book ids translated by Sophie Hughes'
SELECT "book_id" FROM "translated" WHERE "translator_id" = (
    SELECT "id" FROM "translators" WHERE "name" = 'Sophie Hughes'
);

.print 'find the books translated by both Sophie Hughes and Margaret Jull Costa'
SELECT "book_id" FROM "translated" WHERE "translator_id" = (
    SELECT "id" FROM "translators" WHERE "name" = 'Sophie Hughes'
)
INTERSECT
SELECT "book_id" FROM "translated" WHERE "translator_id" = (
    SELECT "id" FROM "translators" WHERE "name" = 'Margaret Jull Costa'
);


-- .print '<----->'




-- After each commit comment out the queries written and then continue to write your queries in this part of the file

-- changes back to stdout    
.output stdout  

-- bash command sqlite3 sqlite3 longlist.db < p2-q.sql > pow-p2.txt
