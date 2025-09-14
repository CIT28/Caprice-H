-- starting the pow workflow
-- changes terminal output for readability 
.mode box
  
-- changes terminal output from standard output (stdout) to pow.txt file
.output '| cat >> pow-a.txt'
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
.print 'Subquery'
SELECT * FROM "authors" WHERE "id" = (
    SELECT "author_id" FROM "authored" WHERE "book_id" = (
        SELECT "id" FROM "books" WHERE "title" = 'Whale'
    )
);

.print '<----->'

-- After each commit comment out the queries written and then continue to write your queries in this part of the file

-- changes back to stdout    
.output stdout  

-- bash command sqlite3 longlist.db < a-q.sql