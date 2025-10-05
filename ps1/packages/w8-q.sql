-- Week 8 attendance
.mode box
.headers on

-- write POW into the current folder
.output pow-a.txt

.print 'find Derek in Drivers table'
SELECT * FROM "drivers" WHERE "name" = 'Derek';

.print 'Derek pick actions in 2023'
SELECT COUNT(*) AS "Number Pickups for Derek in 2023"
FROM "scans"
WHERE "driver_id" = (
  SELECT "id" FROM "drivers" WHERE "name" = 'Derek' LIMIT 1
)
AND "action" = 'Pick'
AND strftime('%Y', "timestamp") = '2023';

.print 'count the residential addresses'
SELECT COUNT(*) AS "Number of Residential Addresses"
FROM "addresses"
WHERE "type" = 'Residential';

.print 'count the business addresses'
SELECT COUNT(*) AS "Number of Business Addresses"
FROM "addresses"
WHERE "type" = 'Business';

.print 'count the package contents sorted'
SELECT "contents", COUNT(*) AS "Number of"
FROM "packages"
GROUP BY "contents"
ORDER BY COUNT(*) DESC;

.output stdout
