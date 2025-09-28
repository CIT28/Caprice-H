-- starting the pow workflow
-- change terminal output for readability 
.mode box

-- send output to pow-p1.txt
.output packages/pow-a.txt


.print 'find Derek in Drivers table'
SELECT * FROM drivers WHERE name = 'Derek';

.print 'Derek pick actions in 2023'
SELECT COUNT(*) AS "Number Pickups for Derek in 2023"
FROM scans
WHERE driver_id = 7
  AND action = 'Pick'
  AND strftime('%Y', timestamp) = '2023';


.print 'count the residential addresses'
SELECT COUNT(*) AS "Number of Residential Addresses"
FROM addresses
WHERE type = 'Residential';

.print 'count the business addresses'
SELECT COUNT(*) AS "Number of Business Addresses"
FROM addresses
WHERE type = 'Business';

-- go back to stdout (important!)
.output stdout



-- sqlite3 packages.db < w8-q.sql