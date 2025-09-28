-- starting the pow workflow
-- change terminal output for readability 
.mode box

-- send output to pow-lost.txt
.output packages/pow-lost.txt

-- .print 'find package from Anneke to Varsha'
-- SELECT * 
-- FROM packages
-- WHERE from_address_id = 432
--   AND to_address_id = 854;

-- .print 'get the package id'
-- SELECT id
-- FROM packages
-- WHERE from_address_id = 432
--   AND to_address_id = 854;

.print 'all scans for package 384'
SELECT * 
FROM scans
WHERE package_id = 384;


-- go back to stdout
.output stdout

-- bash command (run this in terminal)
-- sqlite3 packages/packages.db < lost-q.sql
