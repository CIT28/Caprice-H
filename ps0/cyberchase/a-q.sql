-- Week 4 • Attendance (POE + POW)
.mode box
.headers on

-- Query 1 (POW capture)
/*.output '| cat >> pow-a.txt'
.print 'Query 1: list all data from episodes (expect 140 × 7)'
SELECT * FROM episodes;
.print 'Counting results'
SELECT COUNT(*) AS cnt FROM episodes;
.output stdout /*

/*  >>> POE NOTE for README.md (copy only commands, not results) <<<
.print 'Query 1'
SELECT * FROM episodes;
.print 'Counting results'
SELECT COUNT(*) FROM episodes;
*/

-- Comment out Q1 above after committing, then run Q2 below.

-- Query 2 (POW capture)
.output '| cat >> pow-a.txt'
.print 'Query 2: titles with "or" in the text (expect 19 × 1)'
SELECT title FROM episodes WHERE title LIKE '%or%';
.print 'Counting results'
SELECT COUNT(*) AS cnt FROM episodes WHERE title LIKE '%or%';
.output stdout

/*  >>> POE NOTE for README.md (copy only commands, not results) <<<
.print 'Query 2'
SELECT title FROM episodes WHERE title LIKE '%or%';
.print 'Counting results'
SELECT COUNT(*) FROM episodes WHERE title LIKE '%or%';
*/

