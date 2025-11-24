.output pow-p2.txt
.mode box

.print 'import votes.csv into table votes'
-- .mode csv
-- .import --csv votes.csv votes

.print 'verify schema and sample rows'
.schema votes
SELECT COUNT(*) AS total_rows FROM votes;
SELECT * FROM votes LIMIT 10;

.output stdout
