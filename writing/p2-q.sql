.output pow-p1.txt
.mode box

.print "schema check"
.schema votes


.print "clean titles with TRIM n UPPER"
-- UPDATE votes
-- SET title = UPPER(TRIM(title));


.print "preview cleaned titles"
SELECT title FROM votes LIMIT 15;


.print "fix remaining titles"

UPDATE votes
SET title = 'FARMERS WORKING AT DAWN'
WHERE title LIKE 'FARMESR%DAWN';

UPDATE votes
SET title = 'FARMERS WORKING AT DAWN'
WHERE title = 'FARMERS WORKING';

UPDATE votes
SET title = 'IMAGINATIVE LANDSCAPE'
WHERE title = 'IMAGINATIVE  LANDSCAPE';

UPDATE votes
SET title = 'PROFUSION OF FLOWERS'
WHERE title = 'PROFUSION';


.print "verify vote groups after fixes"
SELECT title, COUNT(*) AS votes
FROM votes
GROUP BY title
ORDER BY title;


.print "confirm number of distinct groups (should be 4)"
SELECT COUNT(DISTINCT title) AS distinct_titles
FROM votes;


.print "final distinct titles list"
SELECT DISTINCT title
FROM votes
ORDER BY title;
