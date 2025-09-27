-- starting the pow workflow
-- change terminal output for readability 
.mode box

-- send output to pow-p1.txt
.output pow-ds.txt


-- test the setup
.print 'testing setup'

-- Display all tables in the database
.print 'Tables in packages.db'
.tables

-- go back to stdout (important!)
.output stdout



-- sqlite3 packages.db < w8-q.sql