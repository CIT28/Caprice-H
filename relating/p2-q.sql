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
.print 'INNER JOIN sea_lions with migrations on id'
SELECT * 
FROM "sea_lions"
JOIN "migrations"
ON "migrations"."id" = "sea_lions"."id";

.print 'LEFT OUTER JOIN all sea_lions with any of the matching migrations'
SELECT *
FROM "sea_lions"
LEFT JOIN "migrations"
  ON "migrations"."id" = "sea_lions"."id";

.print 'every row from both tables, matched when possible'
SELECT * FROM "sea_lions"
FULL JOIN "migrations" ON "migrations"."id" = "sea_lions"."id";

.print 'NATURAL JOIN: join on all same-named columns automatically'
SELECT * FROM "sea_lions"
NATURAL JOIN "migrations";



-- .print '<----->'




-- After each commit comment out the queries written and then continue to write your queries in this part of the file

-- changes back to stdout    
.output stdout  

-- bash command sqlite3 sea_lions.db < p2-q.sql > pow-p2.txt
