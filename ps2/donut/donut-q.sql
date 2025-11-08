.output pow-d.txt
.mode box

.print 'donuts schema'
.read schema.sql

.print 'verify tables'
.tables

.print 'full schema'
.schema


-- bash: sqlite3 donuts.db < donut-q.sql