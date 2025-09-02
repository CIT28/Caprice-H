---.mode box

---.output '| cat >> pow.txt'

---.print 'first query'

---SELECT * FROM "longlist";

---.output stdout
---.output '| cat >> pow.txt'
---.print 'select command — q1'
---SELECT * FROM "longlist";

---.print ''
----.print 'select command — q2'

---SELECT rowid, * FROM "longlist" LIMIT 5;

---.print ''
---.print 'select command — q3'
---SELECT * FROM "longlist" LIMIT 10;

---.output stdout

---.mode box
---.output '| cat >> pow.txt'
---.print 'select command — q1'
---SELECT * FROM "longlist";

---.print ''
---.print 'select command — q2'
---SELECT title, author FROM "longlist";

---.print ''
---.print 'select command — q3'
---SELECT title, year FROM "longlist" LIMIT 10;

---.output stdout

.output '| cat >> pow.txt'
.print 'limit command — q1'
SELECT title, year FROM "longlist" LIMIT 5;

.print ''
.print 'limit command — q2'
SELECT title, author FROM "longlist" LIMIT 10;

.output stdout