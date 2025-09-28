-- starting the pow workflow
-- change terminal output for readability 
.mode box

-- send output to pow-p1.txt
.output packages/pow-a.txt


.print 'find Derek in Drivers table'
SELECT * FROM drivers WHERE name = 'Derek';




-- go back to stdout (important!)
.output stdout



-- sqlite3 packages.db < w8-q.sql