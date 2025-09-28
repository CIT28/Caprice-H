# Week 8 attendance coding challenge

## Problem 1

`SELECT * FROM drivers WHERE name = 'Derek';`

## Problem 2
`SELECT COUNT(*) AS "Number Pickups for Derek in 2023"
FROM scans
WHERE driver_id = 7
  AND action = 'Pick'
  AND strftime('%Y', timestamp) = '2023';`

## Problem 3
`SELECT COUNT(*) AS "Number of Residential Addresses"
FROM addresses
WHERE type = 'Residential';`

## Problem 4
`SELECT COUNT(*) AS "Number of Business Addresses"
FROM addresses
WHERE type = 'Business';`

## Problem 5
`SELECT contents, COUNT(*) AS "Number of"
FROM packages
GROUP BY contents
ORDER BY COUNT(*) DESC;`


## Static Queries for Lost Letter - Proof of Effect

### Query 1
`SELECT * 
FROM packages
WHERE from_address_id = 432
  AND to_address_id = 854;`