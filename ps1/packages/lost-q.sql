-- starting the pow workflow
-- change terminal output for readability 
.mode box

-- send output to pow-lost.txt
.output '| cat >> pow-lost.txt' 

-- .print 'from_address_id for 900 Somerville Avenue'
-- SELECT "id" AS from_address_id
-- FROM "addresses"
-- WHERE "address" LIKE '%900 Somerville Avenue%';
-- .print 'to_address_id for 2 Finnegan Street'
-- SELECT "id" AS to_address_id
-- FROM "addresses"
-- WHERE "address" LIKE '%2 Finn%';
-- .print 'package from 900 Somerville Ave -> 2 Finnegan'
-- SELECT p."id" AS package_id, p."contents"
-- FROM "packages" p
-- JOIN "addresses" fa ON fa."id" = p."from_address_id"
-- JOIN "addresses" ta ON ta."id" = p."to_address_id"
-- WHERE fa."address" LIKE '%900 Somerville Avenue%'
--   AND ta."address" LIKE '%2 Finn%';

-- .print 'Pick/Drop timestamps'
-- SELECT s."action", s."timestamp"
-- FROM "scans" s
-- JOIN "packages" p ON p."id" = s."package_id"
-- JOIN "addresses" fa ON fa."id" = p."from_address_id"
-- JOIN "addresses" ta ON ta."id" = p."to_address_id"
-- WHERE fa."address" LIKE '%900 Somerville Avenue%'
--   AND ta."address" LIKE '%2 Finn%'
--   AND s."action" IN ('Pick','Drop')
-- ORDER BY s."timestamp";
.print 'Pick/Drop timestamps (NESTED)'
SELECT s."action", s."timestamp"
FROM "scans" s
WHERE s."action" IN ('Pick','Drop')
  AND s."package_id" = (
    SELECT p."id"
    FROM "packages" p
    WHERE p."from_address_id" = (
      SELECT "id" FROM "addresses"
      WHERE "address" LIKE '%900 Somerville Avenue%' LIMIT 1
    )
    AND p."to_address_id" = (
      SELECT "id" FROM "addresses"
      WHERE "address" LIKE '%2 Finn%' LIMIT 1
    )
    LIMIT 1
  )
ORDER BY s."timestamp";

-- go back to stdout
.output stdout

-- bash command (run this in terminal)
-- sqlite3 packages/packages.db < lost-q.sql
