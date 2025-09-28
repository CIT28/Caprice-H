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

  ### Query 2
`SELECT id
FROM packages
WHERE from_address_id = 432
  AND to_address_id = 854;`


### Query 3
`SELECT * 
FROM scans
WHERE package_id = 384;`

### Query 4
`SELECT action, timestamp
FROM scans
WHERE package_id = 384
  AND action IN ('Pick', 'Drop');`


  ## Nested Queries for Lost Letter - Proof of Effect

`SELECT action, timestamp
FROM scans
WHERE package_id = (
    SELECT id
    FROM packages
    WHERE from_address_id = 432
      AND to_address_id = 854
)
AND action IN ('Pick', 'Drop');`

## My Experience
This assignment was the toughest one so far because I kept getting stuck on the first two queries and had to really research the IDs and dig through the tables before I could get the right results. The static queries took me the longest since I kept running into blanks until I finally figured out how the addresses and IDs connected, but once that pain was over with the rest of the work made more sense and I was able to trace the package through its scans. The nested query felt a lot cleaner and quicker, but it only came together after I went through the trial and error of the static queries.