
# Problem set 0 - Problems 8 thru 13

## Problem 8
```
sqlite> SELECT "id", "air_date" FROM "episodes" BETWEEN '2018-01-01' AND '2023-11-31';
Parse error: near "BETWEEN": syntax error
  SELECT "id", "air_date" FROM "episodes" BETWEEN '2018-01-01' AND '2023-11-31';
                            error here ---^
sqlite> SELECT  "title", "air_date" FROM "episodes" LIKE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';
Parse error: near ""air_date"": syntax error
  SELECT  "title", "air_date" FROM "episodes" LIKE "air_date" BETWEEN '2018-01-0
                                     error here ---^
sqlite> SELECT "id", "title", "air_date" FROM "episodes"  BETWEEN '2018-01-01' AND '2023-12-31';
Parse error: near "BETWEEN": syntax error
  SELECT "id", "title", "air_date" FROM "episodes"  BETWEEN '2018-01-01' AND '20
                                      error here ---^
sqlite> SELECT "id", "title", "air_date" FROM "episodes" WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';






```
## Problem 9
```
sqlite> SELECT "id","title", FROM "episodes" LIKE "air_date" BETWEEN '2002-01-01' A
ND '2007-12-31';
Parse error: near "FROM": syntax error
  SELECT "id","title", FROM "episodes" LIKE "air_date" BETWEEN '2002-01-01' AND 
                       ^--- error here
sqlite> SELECT "id","title","air_date" FROM "episodes" LIKE "air_date" ORDER BY '20
02-01-01' AND '2007-12-31';
Parse error: near ""air_date"": syntax error
  LECT "id","title","air_date" FROM "episodes" LIKE "air_date" ORDER BY '2002-01
                                      error here ---^
sqlite> SELECT "id","title","air_date" FROM "episodes" WHERE "air_date" BETWEEN '2002-01-01' AND '2007-12-31';



```

## Problem 10
```
sqlite> SELECT "id","title" FROM "episodes" WHERE  "production_code";
sqlite> SELECT "id","title","production_code" FROM "episodes" WHERE "production_cod
e";
sqlite> SELECT "id","title","production_code" FROM "episodes" ORDER BY "production_
code" ASC;


```
## Problem 11
```
sqlite> FROM "episodes" WHERE "season" = 5 ORDER BY "title" DESC;
Parse error: near "FROM": syntax error
  FROM "episodes" WHERE "season" = 5 ORDER BY "title" DESC;
  ^--- error here
sqlite> FROM "episodes" LIKE "season" = 5 ORDER BY "title";
Parse error: near "FROM": syntax error
  FROM "episodes" LIKE "season" = 5 ORDER BY "title";
  ^--- error here
sqlite> FROM "episodes" WHERE "season" = 5 ORDER BY "title" DESC;
Parse error: near "FROM": syntax error
  FROM "episodes" WHERE "season" = 5 ORDER BY "title" DESC;
  ^--- error here
sqlite> SELECT "title" FROM "episodes" WHERE "season" = 5 ORDER BY "title" DESC;


```
## Problem 12
```

sqlite> SELECT COUNT "title"  WHERE  "unique_titles" FROM "episodes";
Parse error: near "FROM": syntax error
  SELECT COUNT "title"  WHERE  "unique_titles" FROM "episodes";
                                 error here ---^
sqlite> SELECT COUNT "TITLE" AS "titles" FROM "episodes";
Parse error: near "AS": syntax error
  SELECT COUNT "TITLE" AS "titles" FROM "episodes";
                       ^--- error here
sqlite> SELECT COUNT "title" AS "unique_titles" FROM "episodes";
Parse error: near "AS": syntax error
  SELECT COUNT "title" AS "unique_titles" FROM "episodes";
                       ^--- error here
sqlite> SELECT COUNT(DISTINCT "title") AS "unique_titles" FROM "episodes";


```
## Problem 13
```
sqlite> SELECT "title","topic" FROM "episodes" WHERE "topic" OR '%fractions%'   WHE
RE "air_date" >= '2006-01-01';
Parse error: near "WHERE": syntax error
   FROM "episodes" WHERE "topic" OR '%fractions%'   WHERE "air_date" >= '2006-01
                                      error here ---^
sqlite> SELECT "title","topic","air_date" FROM "episodes" WHERE "topic" LIKE 'fract
ions'   AND "air_date" > '2006-01-01';
sqlite> SELECT "title","topic","air_date", WHERE "episodes" WHERE "topic" LIKE '%fr
actions'   AND "air_date" >= '2006-01-01';
Parse error: near "WHERE": syntax error
  SELECT "title","topic","air_date", WHERE "episodes" WHERE "topic" LIKE '%fract
                       error here ---^
sqlite> SELECT "title","topic","air_date" FROM "episodes" WHERE "topic" LIKE '%fractions%'   AND "air_date" >= '2006-01-01';
A Fraction of a Chance|Fractions 101|2007-09-03
Peace, Love, and Hackerness|Measuring with Mixed Number Fractions|2010-07-09
Trash Creep|Fractions, Effects of Trash, and Recycling|2013-11-06
sqlite> 






```






# Problem set 0 - Problems 1 thru 7

## Problem 1
```
@Avabeast17 ➜ /workspaces/Caprice-H/ps0/cyberchase (main) $ sqlite3 cyberchase.db
SQLite version 3.45.3 2024-04-15 13:34:05
Enter ".help" for usage hints.
sqlite> SELECT "title" FROM "season" WHERE "season"
 = 1;
Parse error: no such table: season
sqlite> SELECT "title" FROM "seasons" WHERE "season
" = 1;
Parse error: no such table: seasons
sqlite> SELECT "title" FROM "episodes" WHERE "season" = 1;




```
## Problem 2
```
sqlite> SELECT "season", "title" FROM "episodes" WHERE = 1 LIKE "season";
Parse error: near "=": syntax error
  SELECT "season", "title" FROM "episodes" WHERE = 1 LIKE "season";
                                   error here ---^
sqlite> SELECT "season", "title" FROM "episodes" WHERE "episode_in_season" = 1 WHERE "season";
Parse error: near "WHERE": syntax error
  le" FROM "episodes" WHERE "episode_in_season" = 1 WHERE "season";
                                      error here ---^
sqlite> SELECT "season", "title" FROM "episodes" WHERE "episode_in_season" = 1 ORDER BY "season";




```

## Problem 3
```
sqlite> SELECT "production_code" LIKE "episodes" WHERE "title" = 'Hackerize!';
Parse error: no such column: episodes
  SELECT "production_code" LIKE "episodes" WHERE "title" = 'Hackerize!';
                  error here ---^
sqlite> SELECT "production_code" WHERE "episodes" WHERE "title" = 'Hackerize!';
Parse error: near "WHERE": syntax error
  SELECT "production_code" WHERE "episodes" WHERE "title" = 'Hackerize!';
                              error here ---^
sqlite> SELECT "production_code" FROM "episodes" WHERE "title" = 'Hackerized!';
CYB091
sqlite> SELECT "production_code" FROM "episodes" WHERE "title" = 'Hackerized!';



```
## Problem 4
```

  SELECT "production_code" LIKE "episodes" WHERE "title" = 'Hackerize!';
                  error here ---^
sqlite> SELECT "production_code" WHERE "episodes" WHERE "title" = 'Hackerize!';
Parse error: near "WHERE": syntax error
  SELECT "production_code" WHERE "episodes" WHERE "title" = 'Hackerize!';
                              error here ---^
sqlite> SELECT "production_code" FROM "episodes" WHERE "title" = 'Hackerized!';
CYB091
sqlite> SELECT "title" FROM "episodes" WHERE "episodes" IS NULL;
Parse error: no such column: episodes
  SELECT "title" FROM "episodes" WHERE "episodes" IS NULL;
                         error here ---^
sqlite> SELECT 'title' FROM "episodes" WHERE "title" IS NULL;



```
## Problem 5
```
sqlite> SELECT "air_date" FROM "episodes" WHERE "date" = '2004-12-31';
Parse error: no such column: date
  SELECT "air_date" FROM "episodes" WHERE "date" = '2004-12-31';
                            error here ---^

sqlite> SELECT 'title' FROM "episodes" WHERE "title" IS NULL;


```
## Problem 6
```

sqlite> SELECT "title" FROM "episodes"  BETWEEN '2007-01-02' AND '2007-12-31';
Parse error: near "BETWEEN": syntax error
  SELECT "title" FROM "episodes"  BETWEEN '2007-01-02' AND '2007-12-31';
                    error here ---^
sqlite> SELECT "title" FROM "episodes" OR  "air_date" BETWEEN '2007-01-01' AND '2007-12-31';
Parse error: near "OR": syntax error
  SELECT "title" FROM "episodes" OR  "air_date" BETWEEN '2007-01-01' AND '2007-1
                   error here ---^
sqlite> SELECT "title" FROM "episodes" WHERE "season" = 6 AND "air_date" BETWEEN '2007-01-01' AND '2007-12-31';



```
## Problem 7
```
sqlite> SELECT "title", "topic" FROM "episodes" WHERE "topic" LIKE 'faction';
sqlite> SELECT "title", "topic" FROM "episodes" LIKE  "topic" LIKE 'fractions';
Parse error: near ""topic"": syntax error
  SELECT "title", "topic" FROM "episodes" LIKE  "topic" LIKE 'fractions';
                                  error here ---^
sqlite> SELECT "topic", "tilte" FROM "episodes" WHERE "topic" LIKE '%fractions';
Parse error: no such column: tilte
  SELECT "topic", "tilte" FROM "episodes" WHERE "topic" LIKE '%fractions';
                  ^--- error here
sqlite> SELECT "title", "topic" FROM "episodes" LIKE "topic" LIKE 'fractions';
Parse error: near ""topic"": syntax error
  SELECT "title", "topic" FROM "episodes" LIKE "topic" LIKE 'fractions';
                                 error here ---^
sqlite> SELECT "title", "topic" FROM "episodes" WHERE "topic" LIKE '%fractions%';




```

## Problem 8
```
sqlite> SELECT "id", "air_date" FROM "episodes" BETWEEN '2018-01-01' AND '2023-11-31';
Parse error: near "BETWEEN": syntax error
  SELECT "id", "air_date" FROM "episodes" BETWEEN '2018-01-01' AND '2023-11-31';
                            error here ---^
sqlite> SELECT  "title", "air_date" FROM "episodes" LIKE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';
Parse error: near ""air_date"": syntax error
  SELECT  "title", "air_date" FROM "episodes" LIKE "air_date" BETWEEN '2018-01-0
                                     error here ---^
sqlite> SELECT "id", "title", "air_date" FROM "episodes"  BETWEEN '2018-01-01' AND '2023-12-31';
Parse error: near "BETWEEN": syntax error
  SELECT "id", "title", "air_date" FROM "episodes"  BETWEEN '2018-01-01' AND '20
                                      error here ---^
sqlite> SELECT "id", "title", "air_date" FROM "episodes" WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';



```