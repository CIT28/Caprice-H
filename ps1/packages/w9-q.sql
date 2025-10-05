-- starting the pow workflow
-- change terminal output for readability 
.mode box

-- send output to pow-p1.txt
.output '| cat >> pow-a.txt'
.print 'Lost Letter JOIN query'


SELECT * FROM "scans"
JOIN "packages" ON "packages"."id" = "scans"."package_id"
JOIN "addresses" ON "addresses"."id" = "packages"."to_address_id"
    AND "addresses"."address" LIKE '%2 Finn%';



-- sqlite3 packages.db < w9-q.sql