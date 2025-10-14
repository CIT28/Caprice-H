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