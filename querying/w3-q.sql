-- Week 3 code/workflow challenge POW
.mode box

-- append output to new Week 3 POW file
.output '| cat >> pow-w3.txt'

.print 'w3 setup check: first run OK'
-- no query yet

.output stdout

-- run with:
-- sqlite3 longlist.db < w3-q.sql

-- ===== Q1: Books under 200 pages =====
.output '| cat >> pow-w3.txt'
.print 'Q1: Books under 200 pages (title, author, pages)'

SELECT title, author, pages
FROM longlist
WHERE pages < 200
ORDER BY pages ASC;

.output stdout

-- ===== Q2: How many books under 200 pages? =====
.output '| cat >> pow-w3.txt'
.print 'Q2: COUNT of books under 200 pages'

SELECT COUNT(*) AS under_200_count
FROM longlist
WHERE pages < 200;

.output stdout

