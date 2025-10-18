# Problem 1
```
make sure I'm grouping on the correct column and know the row count expectation.
SELECT DISTINCT "year" FROM "salaries" ORDER BY "year" ASC;
1985
1986
1987
1988
1989
1990
1991
1992
1993
1994
1995
1996
1997
1998
1999
2000
2001
*should be 17

for the first pass, no rounding, ascending I just want to verify numbers look reasonable.
sqlite> SELECT "year"
FROM "salaries"
GROUP BY "year"
ORDER BY "year";
1985
1986
1987
1988
1989
1990
1991
1992
1993
1994
1995
1996
1997
1998
1999
2000
2001
I forgot to add the avg, alias, and asc.
sqlite> SELECT "year", AVG("salary") AS avg_salary
FROM "salaries"
GROUP BY "year"
ORDER BY "year" ASC;
1985|476299.447272727
1986|417147.043360434
1987|434729.465709729
1988|453171.076923077
1989|506323.081575246
1990|511973.694348328
1991|894961.194160584
1992|1047520.57607282
1993|976966.559046587
1994|1049588.55995475
1995|964979.074036511
1996|1027909.29108485
1997|1218687.44324324
1998|1280844.56012024
1999|1485316.84890656
2000|1992984.57177033
2001|2279841.06162791

SELECT
  "year" AS "year",
  ROUND(AVG("salary"), 2) AS "average salary"
FROM "salaries"
GROUP BY "year";
1985|476299.45
1986|417147.04
1987|434729.47
1988|453171.08
1989|506323.08
1990|511973.69
1991|894961.19
1992|1047520.58
1993|976966.56
1994|1049588.56
1995|964979.07
1996|1027909.29
1997|1218687.44
1998|1280844.56
1999|1485316.85
2000|1992984.57
2001|2279841.06
I forgot to add the DESC order by.
SELECT
  "year" AS "year",
  ROUND(AVG("salary"), 2) AS "average salary"
FROM "salaries"
GROUP BY "year"
ORDER BY "year" DESC;
```
# Problem 2
```
I need to find all Cal Ripken records, identify candidates
sqlite> SELECT "id","first_name","last_name"
FROM "players"
WHERE "first_name"='Cal' AND "last_name"='Ripken';
15726|Cal|Ripken
Here I want to pull raw salary rows for Cal Ripkens
sqlite> 
sqlite> SELECT "player_id", “year", "salary"
FROM "salaries"
JOIN "players" ON p."id" = "player_id"
WHERE "first_name"='Cal' AND "last_name"='Ripken'
ORDER BY "year" ASC;
"  ...> 
I have forgot my alias!
sqlite> SELECT s."player_id", s."year", s."salary"
FROM "salaries" s
JOIN "players" p ON p."id" = s."player_id"
WHERE p."first_name"='Cal' AND p."last_name"='Ripken'
ORDER BY s."year" ASC;
15726|1985|800000
15726|1986|1150000
15726|1987|1350000
15726|1988|1700000
15726|1989|2466667
15726|1990|1316667
15726|1991|2566667
15726|1992|2100000
15726|1993|5200000
15726|1994|5500000
15726|1995|6700000
15726|1996|6650000
15726|1997|6850000
15726|1998|6400000
15726|1999|6500000
15726|2000|6300000
15726|2001|6300000
More than one “Cal Ripken” exists, so I need a reliable discriminator.
So I'm thinking in great detail who are the Cal Ripkens in the players table?
SELECT "id","first_name","last_name","birth_year","debut","final_game"
FROM "players"
WHERE "first_name"='Cal' AND "last_name"='Ripken';
15726|Cal|Ripken|1960|1981-08-10|2001-10-06

So now I need to restrict to Jr via birth_year=1960; show year+salary ascending with my new givin info.
sqlite> SELECT s."year", s."salary"
FROM "salaries" s
JOIN "players" p ON p."id" = s."player_id"
WHERE p."first_name"='Cal' AND "last_name"='Ripken' AND "birth_year" LIKE “%1960%”
ORDER BY "year" ASC;
Parse error: no such column: “
  l' AND "last_name"='Ripken' AND "birth_year" LIKE “%1960%” ORDER BY "year"
                                      error here ---^
sqlite> 
sqlite> SELECT s."year", s."salary"
FROM "salaries" s
JOIN "players" p ON p."id" = s."player_id"
WHERE p."first_name"='Cal' AND p."last_name"='Ripken' LIKE s.”birth_year"=1960
ORDER BY s."year" ASC;
"  ...> 
sqlite> SELECT s."year", s."salary"
FROM "salaries" s
JOIN "players" p ON p."id" = s."player_id"
WHERE p."first_name"='Cal' AND p."last_name"='Ripken' AND p."birth_year"=1960
ORDER BY s."year" ASC;
1985|800000
1986|1150000
1987|1350000
1988|1700000
1989|2466667
1990|1316667
1991|2566667
1992|2100000
1993|5200000
1994|5500000
1995|6700000
1996|6650000
1997|6850000
1998|6400000
1999|6500000
2000|6300000
2001|6300000
Re-ran the salary query with birth_year=1960 to target Jr.
Sorted ASC first to look at the timeline to see if it looks good and to confirm there are 17 rows.
sqlite> SELECT
  s."year"   AS "year",
  s."salary" AS "salary"
FROM "salaries" s
WHERE s."player_id" IN (
  SELECT p."id"
  FROM "players" s
  WHERE p."first_name"='Cal' AND p."last_name"='Ripkens’ AND p."birth_year"=1960
)
ORDER BY s."year" DESC;
'  ...> 
-forgetting my alias again
sqlite> SELECT
  s."year"   AS "year",
  s."salary" AS "salary"
FROM "salaries" s
WHERE s."player_id" IN (
  SELECT p."id"
  FROM "players" p
  WHERE p."first_name"='Cal' AND p."last_name"='Ripken' AND p."birth_year"=1960
)
ORDER BY s."year" DESC;
2001|6300000
2000|6300000
1999|6500000
1998|6400000
1997|6850000
1996|6650000
1995|6700000
1994|5500000
1993|5200000
1992|2100000
1991|2566667
1990|1316667
1989|2466667
1988|1700000
1987|1350000
1986|1150000
1985|800000
```
# Problem 3
```
Goal- Year plus HR for Ken Griffey Jr sorted DESC, 2 columns, 13 rows.
First I checked the players table for “Ken Griffey” and, sure enough, there are multiple matches. 
That tells me I can’t rely on name alone or I’ll mix Jr. and Sr. together.
sqlite> SELECT "id","first_name","last_name","birth_year"
FROM "players"
WHERE "first_name"='Ken' AND "last_name"='Griffey';
7265|Ken|Griffey|1950
7266|Ken|Griffey|1969
Next I joined performances and players to peek at the HR rows for all Griffeys. 
This was just a check to see what years exist and confirm the columns I’ll need like we done previously.
sqlite> SELECT pf."player_id", pf."year"
FROM "performances" pf
JOIN "players" p ON p."id"=pf."player_id"
WHERE p."first_name"='Ken' AND p."last_name"='Griffey'
ORDER BY pf."year" ASC;
7265|1973
7265|1974
7265|1975
7265|1976
7265|1977
7265|1978
7265|1979
7265|1980
7265|1981
7265|1982
7265|1983
7265|1984
7265|1985
7265|1986
7265|1986
7265|1987
7265|1988
7265|1988
7265|1989
7266|1989
7265|1990
7265|1990
7266|1990
7265|1991
7266|1991
7266|1992
7266|1993
7266|1994
7266|1995
7266|1996
7266|1997
7266|1998
7266|1999
7266|2000
7266|2001
I have forgot the hr table!
sqlite> SELECT pf."player_id", pf."year", pf."HR"
FROM "performances" pf
JOIN "players" p ON p."id"=pf."player_id"
WHERE p."first_name"='Ken' AND p."last_name"='Griffey'
ORDER BY pf."year" ASC;
7265|1973|3
7265|1974|2
7265|1975|4
7265|1976|6
7265|1977|12
7265|1978|10
7265|1979|8
7265|1980|13
7265|1981|2
7265|1982|12
7265|1983|11
7265|1984|7
7265|1985|10
7265|1986|9
7265|1986|12
7265|1987|14
7265|1988|2
7265|1988|2
7265|1989|8
7266|1989|16
7265|1990|1
7265|1990|3
7266|1990|22
7265|1991|1
7266|1991|22
7266|1992|27
7266|1993|45
7266|1994|40
7266|1995|17
7266|1996|49
7266|1997|56
7266|1998|56
7266|1999|48
7266|2000|40
7266|2001|22
To isolate Jr I filtered on birth_year = 1969. I ran it ascending first so I could scan the career timeline like we done with the previous problem, and made sure the numbers looked good. The count came out to 13 rows, which matches the question.
sqlite> SELECT
  pf."year" AS "year",
  pf."HR"   AS "home runs"
FROM "performances" pf
JOIN "players" x ON p."id" = pf."player_id" 
WHERE p."first_name"='Ken' AND p."last_name"='Griffey' AND p."birth_year"=1969
ORDER BY pf."year" DESC;
Parse error: no such column: p.first_name
  OIN "players" x ON p."id" = pf."player_id"  WHERE p."first_name"='Ken' AND p."
                                      error here ---^
sqlite> SELECT
  pf."year" AS year,
  pf."HR"   AS home runs
FROM "performances" pf
JOIN "players" p ON p."id"=pf."player_id"
WHERE p."first_name"='Ken' AND p."last_name"='Griffey' AND p."birth_year"=1969
ORDER BY pf."year" DESC;
Parse error: near "runs": syntax error
  SELECT   pf."year" AS year,   pf."HR"   AS home runs FROM "performances" pf JO
                                    error here ---^

sqlite> SELECT
  pf."year" AS "year",
  pf."HR"   AS "home runs"
FROM "performances" pf
JOIN "players" p ON p."id"=pf."player_id"
WHERE p."first_name"='Ken' AND p."last_name"='Griffey' AND p."birth_year"=1969
ORDER BY pf."year" DESC;
2001|22
2000|40
1999|48
1998|56
1997|56
1996|49
1995|17
1994|40
1993|45
1992|27
1991|22
1990|22
1989|16

I switched the sort to DESC and returned exactly two columns: year and home runs. The final count is still 13, so it meets the requirement.
```
# Problem 4

# Problem 5