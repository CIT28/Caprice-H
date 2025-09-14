-- starting the pow workflow
-- changes terminal output for readability 
.mode box
  
-- changes terminal output from standard output (stdout) to pow.txt file
.output '| cat >> pow-p1.txt'
-- .print '<----->'  
-- updates the pow.txt with content in single quotes
.print 'testing setup'  
  
-- SQL command (query) to view all the column contents in the longlist table   
-- Copy your SQL command below here
-- .print '<----->'  
---.tables
---.schema
-- SELECT * FROM "authors" LIMIT 10;
-- SELECT * FROM "books" LIMIT 10;
-- SELECT * FROM "authored" LIMIT 10;
-- .print 'Static Queries'
-- .print '<----->'
-- SELECT * FROM "books" WHERE title = 'Whale';
-- SELECT * FROM "authored" WHERE "book_id" = 2;
-- SELECT * FROM "authors" WHERE "id" = 13;
-- .print 'Subquery'
-- SELECT * FROM "authors" WHERE "id" = (
--     SELECT "author_id" FROM "authored" WHERE "book_id" = (
--         SELECT "id" FROM "books" WHERE "title" = 'Whale'
--     )
-- );
-- .print 'another subquery example'
-- SELECT * FROM "authors" WHERE "id" = (
--     SELECT "author_id" FROM "authored" WHERE "book_id" = (
--         SELECT "id" FROM "books" WHERE "title" = 'Time Shelter'
--     )
-- );

-- .print '<----->'

-- Find the publisher's id once
SELECT id FROM publishers WHERE "publisher"= 'Fitzcarraldo Editions';


SELECT "title" FROM "books" WHERE "publisher_id" = (
  SELECT "id" FROM "publishers"
  WHERE "publisher" = 'Fitzcarraldo Editions'
);
.print 'List all book titles published by Fitzcarraldo Editions'

.print 'Show all book titles where the publisher id is 12'
SELECT "title" 
FROM "books" 
WHERE "publisher_id" = 12;


-- After each commit comment out the queries written and then continue to write your queries in this part of the file

-- changes back to stdout    
.output stdout  

-- bash command sqlite3 longlist.db < p1-q.sql