.output pow-p2.txt
.mode box
.open votes.db

.print 'trim n upper titles in votes'

UPDATE votes SET title = TRIM(title);
UPDATE votes SET title = UPPER(title);

.print 'verify cleaned titles'
.schema votes
SELECT title FROM votes LIMIT 15;

.print 'fix typos with targeted LIKE patterns'

UPDATE votes
SET title = 'FARMERS WORKING AT DAWN'
WHERE title LIKE 'FAMERS%DAWN';


UPDATE votes
SET title = 'IMAGINATIVE LANDSCAPE'
WHERE title LIKE 'IMAG%TIVE LANDSCAPE';


.print 'verify vote groups after typo fixes'
SELECT title, COUNT(*) AS votes
FROM votes
GROUP BY title
ORDER BY votes DESC;

.output stdout
