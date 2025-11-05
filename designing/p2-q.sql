.output pow-p2.txt
.headers on
.mode box

DROP TABLE IF EXISTS "swipes";
DROP TABLE IF EXISTS "stations";
DROP TABLE IF EXISTS "cards";


.read schema.sql

.print '<-- column constraints example -->'
.schema

.output stdout
-- bash: sqlite3 mbta.db < p2-q.sql

