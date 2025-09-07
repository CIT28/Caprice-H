-- starting the pow workflow
-- changes terminal output for readability 
.mode box
  
-- changes terminal output from standard output (stdout) to pow.txt file
.output '| cat >> pow4.txt'
  
-- updates the pow.txt with content in single quotes

  
-- SQL command (query) to view all the column contents in the longlist table   
-- Copy your SQL command below here
.print 'second query'  
---SELECT "title", "author" FROM "longlist" WHERE "year" = 2023;
---SELECT "title", "author" FROM "longlist" WHERE "year" = 2022;
---SELECT "title", "author" FROM "longlist" WHERE "year" = 2021;
---SELECT "title", "format" FROM "longlist" WHERE "format" != 'hardcover';
---SELECT "title", "format" FROM "longlist" WHERE "format" <> 'hardcover';  
---SELECT "title", "format" FROM "longlist" WHERE NOT "format" <> 'hardcover';
.print 'WHERE querys' 
---SELECT "title", "author" FROM "longlist" WHERE "year" = 2022 OR "year" = 2023;
---SELECT "title", "format" FROM "longlist" WHERE ("year" = 2022 OR "year" = 2023) AND "format" != 'hardcover';
---SELECT "title", "translator" FROM "longlist" WHERE "translator" IS NULL;
---SELECT "title", "translator" FROM "longlist" WHERE "translator" IS NOT NULL;
.print 'NULL querys' 
---SELECT "title" FROM "longlist" WHERE "title" LIKE '%love%';
---SELECT "title" FROM "longlist" WHERE "title" LIKE 'The%';
---SELECT "title" FROM "longlist" WHERE "title" LIKE 'The %';
---SELECT "title" FROM "longlist" WHERE "title" LIKE 'The%love%';
---SELECT "title" FROM "longlist" WHERE "title" LIKE 'P_re';
---SELECT "title" FROM "longlist" WHERE "title" LIKE 'T___';
---SELECT "title" FROM "longlist" WHERE "title" LIKE 'T____';
---SELECT "title", "year"
---FROM "longlist"
---WHERE "year" = 2019 OR "year" = 2020 OR "year" = 2021 OR "year" = 2022;
---SELECT "title", "year"
---FROM "longlist" WHERE "year" >= 2019 AND "year" <= 2022;
.print 'WHERE and LIKE, % and _'  
---SELECT "title", "year" FROM "longlist" WHERE "year" >= 2019  AND "year" <= 2022;
.print 'Q1: titles and years where year is between 2019 and 2022 using >= and <='
---SELECT "title", "year" FROM "longlist" WHERE "year" BETWEEN 2019 AND 2022;
.print 'Q2: same as Q1 but using BETWEEN (inclusive)'
---SELECT "title", "rating" FROM "longlist" WHERE "rating" > 4.0;
.print 'Q3: titles with rating greater than 4.0'
---SELECT "title", "rating", "votes" FROM "longlist" WHERE "rating" > 4.0  AND "votes" > 10000;
.print 'Q4: titles with rating > 4.0 AND votes > 10000'
---ELECT "title", "pages" FROM "longlist" WHERE "pages" < 300;
.print 'Q5: titles with fewer than 300 pages'
---SELECT "title" FROM "longlist" WHERE "title" LIKE 'pyre';
.print 'titles that contain the word Pyre case-insensitive LIKE'
---SELECT "title" FROM "longlist" WHERE "title" = 'pyre';
.print 'title equals pyre exactly'
---SELECT "title", "rating" FROM "longlist" ORDER BY "rating" LIMIT 10;
.print 'Q1 Lowest 10 ratings'
---SELECT "title", "rating" FROM "longlist" ORDER BY "rating" DESC LIMIT 10;
.print 'Q2 Top 10 ratings'
---SELECT "title", "rating" FROM "longlist" ORDER BY "rating" DESC, "votes" DESC LIMIT 10;
.print 'top 10 ratings, tie break by votes'
---SELECT "title", "rating", "votes" FROM "longlist" ORDER BY "rating" DESC, "votes" DESC LIMIT 10;
.print 'top 10 ratings with votes shown'
---SELECT "title", "rating" FROM "longlist" WHERE "rating" = 4.932;
.print 'Exact match rating'
---SELECT "title" FROM "longlist" ORDER BY "title";
.print 'titles in alphabetical order'
SELECT AVG("rating") FROM "longlist";
.print 'Get the average rating'
SELECT ROUND(AVG("rating"), 2) FROM "longlist";
.print 'Get the average rating rounded to 2 decimal places'
SELECT ROUND(AVG("rating"), 2) AS "average rating" FROM "longlist";
.print 'Average rating rounded to 2 decimals with alias'
SELECT MIN("rating") FROM "longlist";
.print 'Minimum rating'
SELECT MAX("rating") FROM "longlist";
.print 'Maximum rating'
SELECT "title", "votes" FROM "longlist";
.print 'all titles with their vote counts'
SELECT SUM("votes") FROM "longlist";
.print 'Total votes across all books'
SELECT COUNT(*) FROM "longlist";
.print 'total number of books in the table'
SELECT COUNT("translator") FROM "longlist";
.print 'all the books with a translator'
SELECT MAX("title"), MIN("title") FROM "longlist";
.print 'first and last title alphabetically'
SELECT COUNT("publisher") FROM "longlist";
.print 'books with a publisher listed'
SELECT "publisher" FROM "longlist";
.print 'bad spelling publisher listed'
SELECT "publisher" FROM "longlist";
.print 'publisher listed'
SELECT DISTINCT "publisher" FROM "longlist";
.print 'list of unique publishers'
SELECT COUNT(DISTINCT "publisher") FROM "longlist";
.print 'Q19: Total number of unique publishers'
-- After each commit comment out the queries written and then continue to write your queries in this part of the file

-- changes back to stdout    
.output stdout  

-- bash command sqlite3 longlist.db < p4-q.sql

