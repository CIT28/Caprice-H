-- starting the pow workflow
-- changes terminal output for readability 
.mode box
  
-- changes terminal output from standard output (stdout) to pow.txt file
.output '| cat >> pow-p2.txt'
  
-- updates the pow.txt with content in single quotes
.print 'testing setup'  
  
-- SQL command (query) to view all the column contents in the longlist table   
-- Copy your SQL command below here
.print 'count number of episodes released 2018–2023'
SELECT "id","title","air_date" FROM "episodes" WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';
.print 'row count'
SELECT COUNT(*) AS "rows" FROM "episodes" WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';

.print 'number of episodes released 2002–2007'
SELECT "id","title","air_date" FROM "episodes" WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31';
.print 'row count'
SELECT COUNT(*) AS "rows" FROM "episodes" WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31';


.print 'write an entire query for ids, titles, production codes ordered by production_code ASC'
SELECT "id","title","production_code" FROM "episodes" ORDER BY "production_code" ASC;
.print 'Row count'
SELECT COUNT(*) AS "rows" FROM "episodes";

.print 'find season 5 titles in reverse order'
SELECT "title" FROM "episodes" WHERE "season" = 5 ORDER BY "title" DESC;
.print 'Row count'
SELECT COUNT(*) AS "rows" FROM "episodes" WHERE "season" = 5;

.print 'count of unique episode titles'
SELECT COUNT(DISTINCT "title") AS "unique_titles" FROM "episodes";

.print 'topic containing "fractions" after 2005'
SELECT "title","topic","air_date" FROM "episodes" WHERE "topic" LIKE '%fractions%'   AND "air_date" >= '2006-01-01';
.print 'row count'
SELECT COUNT(*) AS "rows" FROM "episodes" WHERE "topic" LIKE '%fractions%' AND "air_date" >= '2006-01-01';

-- After each commit comment out the queries written and then continue to write your queries in this part of the file

-- changes back to stdout    
.output stdout  

-- bash command sqlite3 cyberchase.db < p2-q.sql