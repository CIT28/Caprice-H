
.mode box

.output '| cat >> pow-a.txt'
.print '<------------>'
-- .print 'Schema for single table version of longlist.db'
.print 'Schema for multiple table version of longlist.db'
.schema



.output stdout
-- bash: sqlite3 ../relating/longlist.db < w12-q.sql