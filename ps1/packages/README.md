# Week 8 attendance coding challenge

## Problem 1

`SELECT * FROM "drivers" WHERE "name" = 'Derek';`

## Problem 2
`SELECT COUNT(*) AS "Number Pickups for Derek in 2023"
FROM "scans"
WHERE "driver_id" = (
  SELECT "id" FROM "drivers" WHERE "name" = 'Derek' LIMIT 1
)
AND "action" = 'Pick'
AND strftime('%Y', "timestamp") = '2023'`

## Problem 3
`SELECT COUNT(*) AS "Number of Residential Addresses"
FROM "addresses"
WHERE "type" = 'Residential';`

## Problem 4
`SELECT COUNT(*) AS "Number of Business Addresses"
FROM "addresses"
WHERE "type" = 'Business';`

## Problem 5
`SELECT "contents", COUNT(*) AS "Number of"
FROM "packages"
GROUP BY "contents"
ORDER BY COUNT(*) DESC;`



# Static Queries for Lost Letter - Proof of Effect


### 1)
`SELECT "id" AS from_address_id
 FROM "addresses"
 WHERE "address" LIKE '%900 Somerville Avenue%';`

### 2)
`SELECT "id" AS to_address_id
 FROM "addresses"
 WHERE "address" LIKE '%2 Finn%';`

### 3) 
`SELECT p."id" AS package_id, p."contents"
 FROM "packages" p
 JOIN "addresses" fa ON fa."id" = p."from_address_id"
 JOIN "addresses" ta ON ta."id" = p."to_address_id"
 WHERE fa."address" LIKE '%900 Somerville Avenue%'
   AND ta."address" LIKE '%2 Finn%';`

### 4)
`SELECT s."action", s."timestamp"
 FROM "scans" s
 JOIN "packages" p ON p."id" = s."package_id"
 JOIN "addresses" fa ON fa."id" = p."from_address_id"
 JOIN "addresses" ta ON ta."id" = p."to_address_id"
 WHERE fa."address" LIKE '%900 Somerville Avenue%'
   AND ta."address" LIKE '%2 Finn%'
   AND s."action" IN ('Pick','Drop')
 ORDER BY s."timestamp";`


---

# Nested Queries for Lost Letter - Proof of Effect

`SELECT s."action", s."timestamp"
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
 ORDER BY s."timestamp";`



## My Experience
I originally hard coded the IDs, which skipped the real first step of the problem and didn’t show my process. After feedback, I redid it by starting from the street addresses, deriving the correct IDs, finding the matching package, and then pulling the scans. The static queries now document each step clearly, and the nested query compresses the same logic into one statement. I also fixed my folder placement and POW outputs so everything lives in ps1/packages as required. Now both approaches return the correct Pick/Drop timestamps with no hard coded IDs and a clear record of effort.

# Nested Queries for Devious Delivery - Proof of Effect

`SELECT id, contents FROM packages WHERE contents LIKE '%duck%';`

`SELECT id FROM address LIKE contents = 'Duck' LIMIT 1;`

`SELECT id FROM packages WHERE contents = 'Duck debugger' LIMIT 1;`

`SELECT s.action, s.timestamp, a.address FROM scans s JOIN addresses a ON a.id = s.address_id WHERE s.package_id = (SELECT id FROM packages WHERE contents='Duck debugger' LIMIT 1) ORDER BY s.timestamp;`

`SELECT id FROM packages WHERE contents='Duck debugger';`

`SELECT a."address" FROM "address" a WHERE "id" = (SELECT a."address" FROM "scans" a WHERE a."action" = 'Drop' AND a."address" = (SELECT "id" FROM "packages" LIKE "packages" = 'Duck' LIMIT 1) LIMIT 1);`

`SELECT a."address" FROM "address" a WHERE "Duck" = (SELECT a."address" FROM "scans" a LIKE a."action" = 'Drop' AND a."addresses" = (SELECT "id" FROM "packages" WHERE "packages" = 'Duck') LIMIT 1);`

`SELECT a."addresses" FROM "addresses" a WHERE "id" = (SELECT a."address" FROM "scans" a LIKE a."action" = 'Drop' AND a."addresses" = (SELECT "id" FROM "packages" LIKE "packages" = 'Duck') LIMIT 1);`

`SELECT a."address" FROM "address" a WHERE "id" = (SELECT s."address_id" FROM "scans" s WHERE a."action" = 'Drop' AND a."package_id" = (SELECT "id" FROM "packages" LIKE "contents" = 'Duck' LIMIT 1) LIMIT 1);`

`SELECT a."address" FROM "address" a WHERE "id" = (SELECT a."address_id" FROM "scans" WHERE a."action" = 'Drop' AND a."package_id" = (SELECT "id" FROM "packages" LIKE "address" = 'Duck debugger' LIMIT 1) LIMIT 1);`

`SELECT a."address" FROM "addresses" a WHERE a."id" = (SELECT s."address_id" FROM "scans" s WHERE s."action" = 'Drop' AND s."package_id" = (SELECT "id" FROM "packages" WHERE "contents" = 'Duck debugger' LIMIT 1) LIMIT 1);`
