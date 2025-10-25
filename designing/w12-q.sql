
.mode box

.output '| cat >> pow-a.txt'
.print '<------------>'
-- .print 'Schema for single table version of longlist.db'
.print 'Schema for multiple table version of longlist.db'
.schema
-- CREATE TABLE "students" (
--     "id"
--     "firstname"
--     "lastname"
-- );



.output stdout
-- bash: sqlite3 cit28.db < w12-q.sql