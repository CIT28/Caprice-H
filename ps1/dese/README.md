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
# Query 5
```

Here I'm looking for pairs
SELECT d."name" AS "district", s."id" AS "school_id"
FROM "districts" d
JOIN "schools" s ON s."district_id" = d."id"
LIMIT 10;
Abby Kelley Foster Charter Public (District)|1
Abington|2
Abington|3
Abington|4
Abington|5
Abington|6
Academy Of the Pacific Rim Charter Public (District)|7
Acton-Boxborough|8
Acton-Boxborough|9
Acton-Boxborough|10

sqlite> SELECT "name" AS "district",
       COUNT(s."id") AS "school_count"
FROM "districts" d
JOIN "schools" ON s."district_id" = d."id"
GROUP BY "name";
Parse error: ambiguous column name: name
  SELECT "name" AS "district",        COUNT(s."id") AS "school_count" FROM "dist
         ^--- error here
sqlite> 

SELECT d."name" AS "district",
       COUNT(s."id") AS "school_count"
FROM "districts" d
JOIN "schools" s ON s."district_id" = d."id"
GROUP BY d."name"
LIMIT 5;
Abby Kelley Foster Charter Public (District)|1
Abington|5
Academy Of the Pacific Rim Charter Public (District)|1
Acton-Boxborough|9
Acushnet|2

sqlite> SELECT d."name" AS "district",
       COUNT(s."id") AS "school_count"
FROM "districts"
JOIN "schools" s ON s."district_id" = d."id"
GROUP BY "name"
HAVING COUNT("id") > 5
ORDER BY "school_count" DESC, "district" ASC;
Parse error: no such column: d.name
  SELECT d."name" AS "district",        COUNT(s."id") AS "school_count" FROM "di
         ^--- error here

sqlite> SELECT d."name" AS "district",
       COUNT(s."id") AS "school_count"
FROM "districts" d
JOIN "schools" s ON s."district_id" = d."id"
GROUP BY d."name"
HAVING COUNT(s."id") >= 5
ORDER BY "school_count" DESC, "district" ASC;
Boston|109
Springfield|66
Worcester|46
Lowell|27
Lynn|27
Lawrence|26
New Bedford|25
Brockton|24
Newton|22
Quincy|19
Cambridge|17
Fall River|17
Haverhill|17
Chicopee|15
Pittsfield|15
Framingham|14
Brookline|13
Plymouth|13
Wachusett|13
Attleboro|12
Holyoke|12
Leominster|12
Taunton|12
Westfield|12
Arlington|11
Chelsea|11
Peabody|11
Revere|11
Salem|11
Somerville|11
Weymouth|11
Andover|10
Braintree|10
Everett|10
Franklin|10
Lexington|10
Waltham|10
Wellesley|10
Woburn|10
Acton-Boxborough|9
Barnstable|9
Reading|9
Shrewsbury|9
West Springfield|9
Westford|9
Agawam|8
Beverly|8
Billerica|8
Bridgewater-Raynham|8
Chelmsford|8
Fitchburg|8
Gloucester|8
Medford|8
Melrose|8
Natick|8
Needham|8
North Andover|8
North Attleborough|8
Norwood|8
Stoughton|8
Walpole|8
Westwood|8
Danvers|7
Dedham|7
Dudley-Charlton Reg|7
Falmouth|7
Malden|7
Marlborough|7
Marshfield|7
North Middlesex|7
Quabbin|7
Wakefield|7
Whitman-Hanson|7
Wilmington|7
Winchester|7
Bellingham|6
Belmont|6
Burlington|6
Canton|6
Dartmouth|6
Dennis-Yarmouth|6
Dracut|6
Grafton|6
Greenfield|6
Hampden-Wilbraham|6
Hingham|6
Hopkinton|6
Longmeadow|6
Methuen|6
Milford|6
Milton|6
Nashoba|6
Northampton|6
Pentucket|6
Randolph|6
Scituate|6
Sharon|6
Southbridge|6
Swansea|6
Tewksbury|6
Wayland|6
Westborough|6
Winchendon|6
Abington|5
Amesbury|5
Ashburnham-Westminster|5
Ashland|5
Auburn|5
Belchertown|5
Blackstone-Millville|5
Central Berkshire|5
Dighton-Rehoboth|5
East Longmeadow|5
Foxborough|5
Freetown-Lakeville|5
Gill-Montague|5
Groton-Dunstable|5
Hamilton-Wenham|5
Hudson|5
Institutional Schools|5
Lunenburg|5
Lynnfield|5
Mansfield|5
Marblehead|5
Medfield|5
Middleborough|5
North Reading|5
Northborough|5
Norton|5
Pembroke|5
Quaboag Regional|5
Rockland|5
Seekonk|5
Stoneham|5
Sudbury|5
Swampscott|5
Triton|5
Watertown|5
Weston|5
```