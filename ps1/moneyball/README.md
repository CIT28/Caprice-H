# Problem 1

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

# Problem 2

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

# Problem 3

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

# Problem 4
```
Goal is to find the 50 lowest paid players in 2001, returning three columns first name, last name, salary. 
Sort by salary ASC if salaries tie, sort by first name, then last name; if those also tie.
I want to know what years exist in salaries?

SELECT DISTINCT "year"
FROM "salaries"
ORDER BY "year" ASC;
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
I want to now count salary rows for 2001
SELECT COUNT(*) AS rows_2001
FROM "salaries"
WHERE "year" = 2001;
860
I want to see lowest 10 salaries in 2001
SELECT "player_id", "salary"
FROM "salaries"
WHERE "year" = 2001
ORDER BY "salary" ASC
LIMIT 10;
5260|200000
9505|200000
1455|200000
16882|200000
17609|200000
19405|200000
6689|200000
15842|200000
3963|200000
8371|200000
sqlite> SELECT COUNT(*) FROM (
  SELECT s."player_id"
  FROM "salaries" s
  JOIN "players" p ON p."id" = p.”player_id"
  WHERE p.”year" = 2001
  ORDER BY
    s."salary" ASC,
    p."first_name" ASC,
    p."last_name"  ASC,
  LIMIT 50
);
Parse error: near ""
  WHERE p.”year"": syntax error
  s" s   JOIN "players" p ON p."id" = p.”player_id"   WHERE p.”year" = 2001 
                                      error here ---^

  Messup on the alias!
  sqlite> SELECT
  p."first_name",
  p."last_name",
  s."salary"
FROM "salaries" s
JOIN "players" p ON p."id" = s."player_id"
WHERE s."year" = 2001
ORDER BY
  s."salary" ASC, 
  p."first_name" ASC,
  p."last_name"  ASC, 
  p."id"         ASC 
LIMIT 50;
Albert|Pujols|200000
Andy|Thompson|200000
Ben|Sheets|200000
Brad|Voyles|200000
Brandon|Inge|200000
Chris|Michalak|200000
Chris|Reitsma|200000
Chris|Seelbach|200000
Christian|Parker|200000
Courtney|Duncan|200000
D'Angelo|Jimenez|200000
Damian|Rolls|200000
Damon|Minor|200000
David|Eckstein|200000
Donaldo|Mendez|200000
Eddie|Oropesa|200000
Gary|Glover|200000
Hiram|Bocachica|200000
Jack|Wilson|200000
Jason|Grilli|200000
Jay|Gibbons|200000
Jermaine|Clark|200000
Jimmy|Rollins|200000
Joe|Beimel|200000
John|Barnes|200000
Jose|Nunez|200000
Julio|Ramirez|200000
Julio|Zuleta|200000
Luis|Rivas|200000
Luke|Prokopec|200000
Luther|Hackman|200000
Nate|Rolison|200000
Nick|Bierbrodt|200000
Paxton|Crawford|200000
Randy|Choate|200000
Ryan|Freel|200000
Scott|Mullen|200000
Scott|Seabol|200000
Scott|Sobkowiak|200000
Scott|Stewart|200000
Shea|Hillenbrand|200000
Tony|Cogan|200000
Wally|Joyner|200000
Willis|Roberts|200000
Shawn|Wooten|200500
Jose|Ortiz|201000
Pedro|Feliz|201000
Pablo|Ozuna|202000
Scott|Winchester|202000
Tim|Drew|202000
I joined salaries to players to list each 2001 salary with the player’s name, returning only the three required columns first_name, last_name, and salary. 
Then I ordered by salary, first name, last name , player ID, applied LIMIT 50.
```
# Problem 5
Goal
Make a one-column list of every team Satchel Paige played for.
 The result should just be team names and it should come out to 3 rows.
I want to find Satchel Paige in players
sqlite> SELECT "id","first_name","last_name","birth_year"
FROM "players"
WHERE "first_name"='Satchel' AND "last_name"='Paige';
14190|Satchel|Paige|1906

sqlite> SELECT "player_id","team_id","year"
FROM "salaries"
WHERE "player_id" IN (
  SELECT "id" FROM "players"
  WHERE "first_name"='Satchel' AND "last_name"='Paige'
)
ORDER BY "year" ASC;
Satchel doesn’t have salary rows, so joining through salaries returns nothing.

sqlite> SELECT "player_id","team_id","year"
FROM "performances"
WHERE "player_id" IN (
  SELECT "id" FROM "players"
  WHERE "last_name"='Paige'
);
14189|46|1911
14190|46|1948
14190|46|1949
14190|120|1951
14190|120|1952
14190|120|1953
14190|64|1965
Performances does have his seasons, so I pull the raw team_id + year here to confirm there’s data to map to teams.
sqlite> SELECT
  t."name" AS "team"
FROM "teams" t
JOIN "performances" pf ON pf."team_id" = t."id"
JOIN "players"      p  ON t.”id"       = pf."player_id"
WHERE p."last_name" = 'Paige'
  AND (p."first_name" = 'Satchel' OR t.”first_name" = 'Leroy')
GROUP BY t."name”;
"  ...> 
Forgot the order by and some hickups on the alias.
sqlite> SELECT
  t."name" AS "team"
FROM "teams" t
JOIN "performances" pf ON pf."team_id" = t."id"
JOIN "players"      p  ON p."id"       = pf."player_id"
WHERE p."last_name" = 'Paige'
  AND (p."first_name" = 'Satchel' OR p."first_name" = 'Leroy')
GROUP BY t."name"
ORDER BY t."name" ASC;
Cleveland Indians
Kansas City Athletics
St. Louis Browns

I ended up joining performances, teams, players, filtered for Paige, and then grouped by team name so each team shows up once. 
```
# Week 11 — Independent Work (Attendance)

## Query 1 - Players born in 1969
```
Thinking: just listing player names (first + last) where `birth_year = 1969`, sorted alphabetically by last name then first name.
 — no joins, no aggregates, nothing fancy.
- I only return the two columns I actually need: `first_name`, `last_name`.
- Order looks clean (`last_name`, then `first_name`).

- Kept the filter simple (`birth_year = 1969`), not a string.
- Count uses the same subquery as the result, so it’s the same.

sqlite> SELECT
  p."first_name",
  p."last_name",
  s."year"
FROM "salaries" s
JOIN "players" p ON p."id" = s."player_id"
LIMIT 10;
Len|Barker|1985
Steve|Bedrosian|1985
Bruce|Benedict|1985
Rick|Camp|1985
Rick|Cerone|1985
Chris|Chambliss|1985
Jeff|Dedmon|1985
Terry|Forster|1985
Gene|Garber|1985
Terry|Harper|1985


## Query 2 — JOIN: first 10 player–year rows
What I’m doing: a tiny join from `salaries` to `players` so I can show a player’s `first_name`, `last_name`, and the `year` from the salary row. I cap it at 10 rows with `LIMIT 10`.
 — just a simple clean example of linking tables.

- Having to make sure my join key is correct: `players.id` -`salaries.player_id`.
- Remembered the `ON`.
- Didn’t use `SELECT *`.
- Count wrapper mirrors the same query/limit, so numbers line up.
 
 
 Here I skimmed players to see the columns I’ll need (id, first_name, last_name).
sqlite> SELECT
  "id",
  "first_name",
  "last_name"
FROM "players"
LIMIT 10;
2|Hank|Aaron
3|Tommie|Aaron
4|Don|Aase
5|Andy|Abad
7|John|Abadie
8|Ed|Abbaticchio
9|Bert|Abbey
10|Charlie|Abbey
13|Dan|Abbott
14|Fred|Abbott
I skimmed salaries to confirm the join key (player_id) and the year I want.
sqlite> SELECT
  "player_id",
  "year"
FROM "salaries"
LIMIT 10;
863|1985
1171|1985
1272|1985
2758|1985
3096|1985
3123|1985
4482|1985
6056|1985
6432|1985
7747|1985
Join on players.id = salaries.player_id, return only name + year, limit to 10, and wrap with the count.
sqlite> SELECT
  p."first_name",
  p."last_name",
  p.”year"
FROM "salaries" p
JOIN "players" s ON p."id" = s."player_id"
LIMIT 10;
"  ...> 
Hick up on alias.
sqlite> SELECT
  p."first_name",
  p."last_name",
  s."year"
FROM "salaries" s
JOIN "players" p ON p."id" = s."player_id"
LIMIT 10;
Len|Barker|1985
Steve|Bedrosian|1985
Bruce|Benedict|1985
Rick|Camp|1985
Rick|Cerone|1985
Chris|Chambliss|1985
Jeff|Dedmon|1985
Terry|Forster|1985
Gene|Garber|1985
Terry|Harper|1985


```