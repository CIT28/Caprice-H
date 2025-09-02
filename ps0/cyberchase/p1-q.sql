.mode box
.headers on

-- Proof of Work file for PS0 Part 1
.output '| cat >> pow-p1.txt'
.print '=== PS0 Part 1: Problems 1–7 ==='
.output stdout

-- =========================
-- Problem 1
-- Titles of all episodes in Season 1
.output '| cat >> pow-p1.txt'
.print 'P1: titles of all episodes in Season 1 (expect 26 x 1)'
SELECT title
FROM episodes
WHERE season = 1;
.print 'P1 count'
SELECT COUNT(*) FROM episodes WHERE season = 1;
.output stdout

-- =========================
-- Problem 2
-- First episode of every season (season number and title)
.output '| cat >> pow-p1.txt'
.print 'P2: first episode of every season (expect 14 x 2)'
SELECT e.season, e.title
FROM episodes e
WHERE e.episode_in_season = (
  SELECT MIN(episode_in_season)
  FROM episodes
  WHERE season = e.season
)
ORDER BY e.season;
.print 'P2 count'
SELECT COUNT(*) FROM (
  SELECT e.season, e.title
  FROM episodes e
  WHERE e.episode_in_season = (
    SELECT MIN(episode_in_season)
    FROM episodes
    WHERE season = e.season
  )
);
.output stdout

-- =========================
-- Problem 3
-- Production code for "Hackerized!"
.output '| cat >> pow-p1.txt'
.print 'P3: production code for Hackerized! (expect 1 x 1)'
SELECT production_code
FROM episodes
WHERE title = 'Hackerized!';
.print 'P3 count'
SELECT COUNT(*) FROM episodes WHERE title = 'Hackerized!';
.output stdout

-- =========================
-- Problem 4
-- Titles of episodes that have no listed topic
.output '| cat >> pow-p1.txt'
.print 'P4: titles with no topic (expect 26 x 1)'
SELECT title
FROM episodes
WHERE topic IS NULL OR TRIM(topic) = '';
.print 'P4 count'
SELECT COUNT(*) FROM episodes
WHERE topic IS NULL OR TRIM(topic) = '';
.output stdout

-- =========================
-- Problem 5
-- Title of the episode that aired on 2004-12-31
.output '| cat >> pow-p1.txt'
.print 'P5: title aired on 2004-12-31 (expect 1 x 1)'
SELECT title
FROM episodes
WHERE air_date = '2004-12-31';
.print 'P5 count'
SELECT COUNT(*) FROM episodes
WHERE air_date = '2004-12-31';
.output stdout

-- =========================
-- Problem 6
-- Season 6 (2008) titles released early in 2007
.output '| cat >> pow-p1.txt'
.print 'P6: season 6 titles released in 2007 (expect 2 x 1)'
SELECT title
FROM episodes
WHERE season = 6
  AND air_date LIKE '2007-%';
.print 'P6 count'
SELECT COUNT(*) FROM episodes
WHERE season = 6
  AND air_date LIKE '2007-%';
.output stdout

-- =========================
-- Problem 7
-- Titles and topics of all episodes teaching fractions
.output '| cat >> pow-p1.txt'
.print 'P7: titles & topics teaching fractions (expect 6 x 2)'
SELECT title, topic
FROM episodes
WHERE topic LIKE '%fraction%';
.print 'P7 count'
SELECT COUNT(*) FROM episodes
WHERE topic LIKE '%fraction%';
.output stdout
