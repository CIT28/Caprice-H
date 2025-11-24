.output pow-p2.txt
.mode box

.print 'trim + upper titles in votes'
-- FIRST we want to RUN then uncomment the two lines below to apply the changes
UPDATE votes SET title = TRIM(title);
UPDATE votes SET title = UPPER(title);

.print 'verify cleaned titles'
.schema votes
SELECT title FROM votes LIMIT 15;

.output stdout
