-- starting the pow workflow
-- changes terminal output for readability 
.mode box
  
-- changes terminal output from standard output (stdout) to pow.txt file
.output '| cat >> pow_1.txt'
  
-- updates the pow.txt with content in single quotes
.print 'testing setup'  
  
-- SQL command (query) to view all the column contents in the longlist table   
-- Copy your SQL command below here
.print 'titles of all episodes from season 1'
SELECT "title" FROM "episodes" WHERE "season" = 1;
.print 'The row count'
SELECT COUNT(*) AS "rows" FROM "episodes" WHERE "season" = 1;

.print 'P2: First episode of every season (season, title)'
SELECT "season", "title" FROM "episodes" WHERE "episode_in_season" = 1 ORDER BY "season";
.print 'Row count'
SELECT COUNT(*) AS "rows" FROM "episodes" WHERE "episode_in_season" = 1;

.print 'production code for the episode "Hackerized!"'
SELECT "production_code" FROM "episodes" WHERE "title" = 'Hackerized!';
.print 'Row count'
SELECT COUNT(*) AS "rows" FROM "episodes" WHERE "title" = 'Hackerized!';

.print 'titles of episodes with no listed topic'
SELECT "title" FROM "episodes" WHERE "topic" IS NULL;
.print 'Row count'
SELECT COUNT(*) AS "rows" FROM "episodes" WHERE "topic" IS NULL;

.print 'title of the episode aired on 2004-12-31'
SELECT "title" FROM "episodes" WHERE "air_date" = '2004-12-31';
.print 'Row count'
SELECT COUNT(*) AS "rows" FROM "episodes" WHERE "air_date" = '2004-12-31';

.print 'Season 6 (2008) episodes released early in 2007 (titles)'
SELECT "title" FROM "episodes" WHERE "season" = 6 AND "air_date" BETWEEN '2007-01-01' AND '2007-12-31';
.print 'Row count'
SELECT COUNT(*) AS "rows" FROM "episodes" WHERE "season" = 6   AND "air_date" BETWEEN '2007-01-01' AND '2007-12-31';

.print 'titles and topics for episodes teaching fractions'
SELECT "title", "topic" FROM "episodes" WHERE "topic" LIKE '%fractions%';
.print 'Row count'
SELECT COUNT(*) AS "rows" FROM "episodes" WHERE "topic" LIKE '%fractions%';

.print 'episodes released between 2018 and 2023'
SELECT "id", "title", "air_date" FROM "episodes" WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';
.print 'Row count'
SELECT COUNT(*) AS "rows" FROM "episodes" WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';  
-- After each commit comment out the queries written and then continue to write your queries in this part of the file

-- changes back to stdout    
.output stdout  

-- bash command sqlite3 cyberchase.db < p1-q.sql