-- starting the pow workflow
-- change terminal output for readability 
.mode box

-- send output to pow-p1.txt
.output '| cat >> pow-a.txt'
.print 'Lost Letter JOIN query'
.print 'final step'


SELECT "action", "timestamp" FROM "scans" s
JOIN "packages" p ON p."id" = s."package_id"
JOIN "addresses" ta ON ta."id" = p."to_address_id"
    AND ta."address" LIKE '%2 Finn%'
JOIN "addresses" fa ON fa."id" = p."from_address_id"
    AND fa."address" LIKE '%900 Somerville Avenue%';
-- ta for identifier to address
-- fa for identifier from address
-- p for identifier from address
-- s for identifier from address
-- sqlite3 packages.db < w9-q.sql