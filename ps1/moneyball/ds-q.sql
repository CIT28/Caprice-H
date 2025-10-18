.mode box
.output ' | cat > pow-ds.txt'
--queries below here
.print '<--Tables-->'
.tables
.print '<--Schema-->'
.schema
.print '<--first 10 records of the performances table-->'
SELECT * FROM "performances" LIMIT 10;
.print '<--first 10 records of the players table-->'
SELECT * FROM "players" LIMIT 10;
.print '<--first 10 records of the salaries table-->'
SELECT * FROM "salaries" LIMIT 10;
.print '<--first 10 records of the teams table-->'
SELECT * FROM "teams" LIMIT 10;
-- .print 'DESE tables and schema'
-- .tables
-- .schema




.output stdout
-- bash command sqlite3 moneyball.db < ds-q.sql