
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