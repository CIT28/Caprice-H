# DESE Query 1 thru 6

## Query 1

```SELECT "name", "city", "type"
FROM "schools";
```

## Query 2
```sqlite> SELECT COUNT(*) AS "school_count"
FROM "schools" LIKE “type”
GROUP BY "type"
ORDER BY "school_count";
Parse error: near "“type”": syntax error
  CT COUNT(*) AS "school_count" FROM "schools" LIKE “type” GROUP BY "type" O
                                      error here ---^
```
```sqlite> SELECT COUNT(*) AS "school_count"
FROM "schools"
GROUP BY “schools”
ORDER BY "school_count”;
"  ...> ```
I kept stumbling on the flow/sequence of steps—what to select first, which table to start from, and when to add filters or grouping. That was my main sticking point. To get unstuck, I repeatedly checked my pow-ds.txt (tables, schema, and first-10-rows) to confirm column names, keys, and data shapes before writing each query.

```"  ...> SELECT "type", COUNT(*) AS "school_count"
FROM "schools"
GROUP BY "type"
ORDER BY "school_count”;
Parse error: near "type": syntax error
   “schools” ORDER BY "school_count”; SELECT "type", COUNT(*) AS "school_c
                                      error here ---^
sqlite> ```

```SELECT "type", COUNT(*) AS "school_count"
FROM "schools"
GROUP BY "type"
ORDER BY "school_count" DESC, "type" ASC;```

It took a few iterations, but verifying each step against pow-ds.txt made the flow click and reduced mistakes.

sqlite> SELECT "district_name",
       COUNT("school_id") AS "school_count"
FROM "districts" d
JOIN "schools"   ON "district_id" = "district_id"
GROUP BY d."district"
ORDER BY "school_count" DESC, d."district_name" ASC;
Parse error: no such column: district_name
  SELECT "district_name",        COUNT("school_id") AS "school_count" FROM "dist
         ^--- error here
sqlite> 

sqlite> SELECT d."district_name",
       COUNT(d.”school_id") AS "school_count"
FROM "districts" d
JOIN “districts”   d ON "district_id" = d."district_id"
GROUP BY d.”name”
ORDER BY “name” DESC, "district_name" ASC
LIMIT 10;
"  ...> 

sqlite> SELECT s.”school_count",
       COUNT(s."school_id") AS "school_count"
FROM “Schools” d
JOIN "schools"   ON s."district_id" = "district_id"
GROUP BY "district_name"
ORDER BY "school_count" DESC, d."district_name”;
Parse error: near "school_id": syntax error
  SELECT s.”school_count",        COUNT(s."school_id") AS "school_count" FROM 
                               error here ---^
sqlite> 
Confirm correct column names (schema uses id / name)
SELECT d."id", d."name"
FROM "districts" d
LIMIT 5;

SELECT s."id", s."district_id", s."name"
FROM "schools" s
LIMIT 5;
Issue columns don't exist in schema ("district_name", "school_id")
sqlite> SELECT d."name" AS district, "id" AS school_id
FROM "districts" d
JOIN "schools"   ON s."district_id" = "id"
LIMIT 10;
Parse error: ambiguous column name: id
  SELECT d."name" AS district, "id" AS school_id FROM "districts" d JOIN "school
                 error here ---^
sqlite> 
Issue smart quotes, self-joining districts, wrong columns like d.”school_id”
SELECT d."name" AS district, s."id" AS school_id
FROM "districts" d
JOIN "schools"   s ON s."district_id" = d."id"
LIMIT 10;

Count how many districts appear in the grouped result
SELECT d."name" AS "district",
       COUNT(s."id") AS "school_count"
FROM "districts" d
JOIN "schools"   s ON s."district_id" = d."id"
GROUP BY d."name"
ORDER BY "school_count" DESC, "district" ASC
LIMIT 10;

## Query 3

*find which cities have the most schools, ranked high to low.
* Tried grouping by a non existent column districts so found and used the real column city.
* Forgot the comma between selected columns, SQL needs SELECT "city", COUNT(*) ....
* Verified column names with .schema and reran with proper GROUP BY "city".
sqlite> SELECT "city", COUNT(*) AS "school_count"
FROM "schools"
GROUP BY districts
ORDER BY "school_count"
LIMIT 10;
Parse error: no such column: districts
  OUNT(*) AS "school_count" FROM "schools" GROUP BY districts ORDER BY "school_c
                                      error here ---^
sqlite> 
sqlite> SELECT "city" COUNT(*) AS "school_count"
FROM "schools"
GROUP BY "city"
ORDER BY "school_count" DESC, "city" ASC
LIMIT 10;
Parse error: near "(": syntax error
  SELECT "city" COUNT(*) AS "school_count" FROM "schools" GROUP BY "city" ORDER 
                     ^--- error here
sqlite> 


sqlite> SELECT "city", COUNT(*) AS "school_count"
FROM "schools"
GROUP BY "city"
ORDER BY "school_count" DESC, "city" ASC
LIMIT 10;
Springfield|71
Worcester|49
Dorchester|29
Lawrence|29
Lowell|29
Lynn|28
New Bedford|28
Brockton|25
Cambridge|20
Fall River|20

```
## Query 3
*Count how many schools each district has and rank by that count.
* Group by the non-aggregated select column (d."name"), not by a table or an alias that doesn’t exist.
sqlite> SELECT d."name" AS "district", COUNT("id")
FROM "districts"
JOIN "schools"  ON s."district_id" = d."id"
GROUP BY "name"
ORDER BY "school_count" DESC, "district" ASC;
Parse error: no such column: d.name
  SELECT d."name" AS "district", COUNT("id") FROM "districts" JOIN "schools"  ON
         ^--- error here


sqlite> SELECT d."name" AS "district", COUNT("id") AS "school_count"
FROM "districts" d
JOIN "schools" ON "district_id" = d."id"
GROUP BY s.”name"
ORDER BY "school_count" DESC, "district" ASC;
"  ...> 

sqlite> SELECT "name" AS "district", COUNT("id") AS "school_count"
FROM "districts" d
JOIN "schools" s ON s."district_id" = d."id"
GROUP BY "name"
ORDER BY "school_count" DESC, "district" ASC;
Parse error: ambiguous column name: name
  SELECT "name" AS "district", COUNT("id") AS "school_count" FROM "districts" d 
         ^--- error here

sqlite> SELECT s.”name" AS "district", COUNT("id") AS "school_count"
FROM "districts" d
JOIN "schools" d ON d.”district_id" = d."id"
GROUP BY d."name"
ORDER BY "school_count" DESC, "district" ASC;
Parse error: near "district": syntax error
  SELECT s.”name" AS "district", COUNT("id") AS "school_count" FROM "districts
                        ^--- error here

SELECT d."name" AS "district", COUNT(s."id") AS "school_count"
FROM "districts" d
JOIN "schools" s ON s."district_id" = d."id"
GROUP BY d."name"
ORDER BY "school_count" DESC, "district" ASC;
```

## Query 4
```
SELECT "id" FROM "schools" LIMIT 5;
confirm the join key is?

sqlite> SELECT "id" AS "school_id",
       "graduated"
FROM "schools" s
JOIN "graduation_rates" gr ON gr."school_id" = s."id"
LIMIT 10;
Parse error: ambiguous column name: id
  SELECT "id" AS "school_id",        "graduated" FROM "schools" s JOIN "graduati
         ^--- error here
sqlite> 

sqlite> SELECT s."id" AS "school_id",
       gr."graduated"
FROM "schools" 
JOIN "graduation_rates" gr ON "school_id" = "id"
LIMIT 10;
Parse error: no such column: s.id
  SELECT s."id" AS "school_id",        gr."graduated" FROM "schools"  JOIN "grad
         ^--- error here
sqlite> 

*the two columns should match on each row.

sqlite> SELECT s."id" AS "school_id",
       gr."graduated"
FROM "schools" s
JOIN "graduation_rates" gr ON gr."school_id" = s."id"
ORDER BY gr."graduated" DESC
LIMIT 10;
141|100
248|100
429|100
624|100
680|100
1248|100
1407|100
1598|100
1720|100
125|99.7

# Query 5
* I want to see if the column exists
!!!Find which ZIP codes have the most schools
SELECT "id", "zip" FROM "schools" LIMIT 5;

sqlite> SELECT "zip", COUNT(*) AS "school_count"
FROM "schools"
GROUP BY "zip"
LIMIT 10;
01001|6
01002|6
01005|3
01007|5
01010|1
01011|1
01012|1
01013|5
01020|10
01022|2

sqlite> SELECT "zip", COUNT(*) AS "school_count"
FROM "schools"
GROUP BY "zip"
ORDER BY "schools” DESC, "zip" ASC
LIMIT 10;
"  ...> 

sqlite> SELECT "zip", COUNT(*) AS "school_count"
FROM "schools"
GROUP BY "zip"
ORDER BY "school_count" DESC, "zip" ASC
LIMIT 10;
01109|18
01841|17
02301|16
02119|15
02360|15
01040|14
01701|14
01104|13
01201|13
01902|13