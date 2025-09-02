
# Problem set 0 - Problems 1 thru 7

## Problem 1
```sql
.print 'Problem 1'
SELECT title FROM episodes WHERE season = 1;
.print 'Counting results'
SELECT COUNT(*) FROM episodes WHERE season = 1;
```

```sql
.print 'Problem 2'
SELECT season, title
FROM episodes
WHERE (season, episode_in_season) IN (
  SELECT season, MIN(episode_in_season)
  FROM episodes
  GROUP BY season
)
ORDER BY season;
.print 'Counting results'
SELECT COUNT(*) FROM (
  SELECT season, title
  FROM episodes
  WHERE (season, episode_in_season) IN (
    SELECT season, MIN(episode_in_season)
    FROM episodes
    GROUP BY season
  )
);
```
```sql
.print 'Problem 3'
SELECT production_code
FROM episodes
WHERE title = 'Hackerized!';
.print 'Counting results'
SELECT COUNT(*) FROM episodes WHERE title = 'Hackerized!';
```

```sql
.print 'Problem 4'
SELECT title
FROM episodes
WHERE topic IS NULL OR TRIM(topic) = '';
.print 'Counting results'
SELECT COUNT(*) FROM episodes
WHERE topic IS NULL OR TRIM(topic) = '';
```

```sql
.print 'Problem 5'
SELECT title
FROM episodes
WHERE air_date = '2004-12-31';
.print 'Counting results'
SELECT COUNT(*) FROM episodes
WHERE air_date = '2004-12-31';
```

```sql
.print 'Problem 6'
SELECT title
FROM episodes
WHERE season = 6
  AND air_date LIKE '2007-%';
.print 'Counting results'
SELECT COUNT(*) FROM episodes
WHERE season = 6
  AND air_date LIKE '2007-%';
  ```

```sql
.print 'Problem 7'
SELECT title, topic
FROM episodes
WHERE topic LIKE '%fraction%';
.print 'Counting results'
SELECT COUNT(*) FROM episodes
WHERE topic LIKE '%fraction%';
```

