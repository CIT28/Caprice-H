---.mode box

---.output '| cat >> pow.txt'

---.print 'first query'

---SELECT * FROM "longlist";

---.output stdout
---.output '| cat >> pow.txt'
---.print 'select command — q1'
---SELECT * FROM "longlist";

---.print ''
----.print 'select command — q2'

---SELECT rowid, * FROM "longlist" LIMIT 5;

---.print ''
---.print 'select command — q3'
---SELECT * FROM "longlist" LIMIT 10;

---.output stdout

---.mode box
---.output '| cat >> pow.txt'
---.print 'select command — q1'
---SELECT * FROM "longlist";

---.print ''
---.print 'select command — q2'
---SELECT title, author FROM "longlist";

---.print ''
---.print 'select command — q3'
---SELECT title, year FROM "longlist" LIMIT 10;

---.output stdout

---.output '| cat >> pow.txt'
---.print 'limit command — q1'
---SELECT title, year FROM "longlist" LIMIT 5;

---print ''
---.print 'limit command — q2'
---SELECT title, author FROM "longlist" LIMIT 10;

---.output stdout

-- Week 2 • Querying Part 3
---.mode box
---.output '| cat >> pow.txt'

---.print 'part 3 — q1: show 5 books'
---SELECT title, author, year FROM "longlist" LIMIT 5;

---.print ''
---.print 'part 3 — q2: 2023 titles only'
---SELECT title, year FROM "longlist" WHERE year = 2023 LIMIT 10;

---.print ''
---.print 'part 3 — q3: top 10 by rating (desc)'
---SELECT title, rating FROM "longlist" ORDER BY rating DESC LIMIT 10;

---.print ''
---.print 'part 3 — q4: authors with books after 2018'
---SELECT DISTINCT author FROM "longlist" WHERE year > 2018 ORDER BY author LIMIT 10;

---.print ''
---.print 'part 3 — q5: count rows per year'
---SELECT year, COUNT(*) AS cnt
---FROM "longlist"
---GROUP BY year
---ORDER BY year;

---.print ''
---.print 'part 3 — q6: average rating per year (2 decimals)'
---SELECT year, ROUND(AVG(rating), 2) AS avg_rating
---FROM "longlist"
---GROUP BY year
---ORDER BY avg_rating DESC
---LIMIT 10;

---.output stdout


---.output '| cat >> pow.txt'

---.print ''
---.print 'part 3 — q7: highest-rated per publisher (sample)'
---SELECT publisher, title, rating
---FROM "longlist"
---WHERE rating IS NOT NULL
---ORDER BY publisher, rating DESC
---LIMIT 15;

---.print ''
---.print 'part 3 — q8: longest books (pages) since 2018'
---SELECT title, pages, year
---FROM "longlist"
---WHERE pages IS NOT NULL AND year >= 2018
---ORDER BY pages DESC
---LIMIT 10;

---.output stdout

/*

-- Week 3 • Querying Part 4
.mode box
.headers on
.output '| cat >> pow4.txt'

-- ===== OPERATORS (6 total) =====

-- OPERATORS #1: equality (=)
.print 'Operators #1: Books from 2023'
SELECT title, author, year
FROM longlist
WHERE year = 2023
LIMIT 10;

-- OPERATORS #2: not equal (!=)
.print 'Operators #2: 2023 books not in hardcover'
SELECT title, format, year
FROM longlist
WHERE year = 2023
  AND format != 'hardcover'
LIMIT 10;

-- OPERATORS #3: less-than (<)
.print 'Operators #3: Books under 200 pages'
SELECT title, author, pages
FROM longlist
WHERE pages < 200
ORDER BY pages ASC
LIMIT 10;

-- OPERATORS #4: BETWEEN (range)
.print 'Operators #4: Books between 2019 and 2021 (inclusive)'
SELECT title, year
FROM longlist
WHERE year BETWEEN 2019 AND 2021
ORDER BY year, title
LIMIT 15;

-- OPERATORS #5: LIKE (pattern match)
.print 'Operators #5: Titles containing the word Love'
SELECT title
FROM longlist
WHERE title LIKE '%Love%';

-- OPERATORS #6: IS NOT NULL (and not empty)
.print 'Operators #6: Books that have a translator listed'
SELECT title, translator
FROM longlist
WHERE translator IS NOT NULL
  AND translator <> '';

.output stdout

*/

/* 
-- === ORDER BY (53:10 → ~1:02:00) ===
.output '| cat >> pow4.txt'

-- ORDER BY #1: year ASC, title ASC
.print 'ORDER BY #1: oldest→newest; tie-break title A→Z (what this query does)'
SELECT title, year
FROM longlist
ORDER BY year ASC, title ASC
LIMIT 15;

-- ORDER BY #2: author ASC, title ASC
.print 'ORDER BY #2: Author A→Z with title A→Z tie-break (what this query does)'
SELECT author, title, year
FROM longlist
ORDER BY author ASC, title ASC
LIMIT 15;

-- ORDER BY #3: pages DESC (numeric), tie-break title
.print 'ORDER BY #3: Longest books first; show top 10 (what this query does)'
SELECT title, pages
FROM longlist
WHERE pages IS NOT NULL
ORDER BY pages DESC, title ASC
LIMIT 10;

-- ORDER BY #4: non-NULL translators first, then A→Z
.print 'ORDER BY #4: Bring translated books to the top, then sort (what this query does)'
SELECT title, translator
FROM longlist
ORDER BY (translator IS NULL) ASC, translator ASC, title ASC
LIMIT 20;

-- ORDER BY #5: newest first (DESC), top 10
.print 'ORDER BY #5: Newest→oldest by year; show 10 (what this query does)'
SELECT title, year
FROM longlist
ORDER BY year DESC, title ASC
LIMIT 10;

.output stdout

*/

-- === AGGREGATES (1:02:06 → 1:17:21) ===
.output '| cat >> pow4.txt'

-- A1
.print 'A1: COUNT(*) total books (what this query does)'
SELECT COUNT(*) AS total_books FROM longlist;

-- A2
.print 'A2: COUNT(*) books in 2023 (what this query does)'
SELECT COUNT(*) AS books_2023 FROM longlist WHERE year = 2023;

-- A3
.print 'A3: MIN(year), MAX(year) present (what this query does)'
SELECT MIN(year) AS earliest, MAX(year) AS latest FROM longlist;

-- A4
.print 'A4: AVG(pages) overall, 1 decimal (what this query does)'
SELECT ROUND(AVG(pages), 1) AS avg_pages FROM longlist WHERE pages IS NOT NULL;

-- A5
.print 'A5: SUM(pages) for 2023 (what this query does)'
SELECT SUM(pages) AS total_pages_2023
FROM longlist
WHERE year = 2023 AND pages IS NOT NULL;

-- A6
.print 'A6: COUNT(DISTINCT author) (what this query does)'
SELECT COUNT(DISTINCT author) AS unique_authors FROM longlist;

-- A7
.print 'A7: Top 10 authors by number of titles (what this query does)'
SELECT author, COUNT(*) AS n_titles
FROM longlist
GROUP BY author
ORDER BY n_titles DESC, author ASC
LIMIT 10;

-- A8
.print 'A8: AVG(pages) by year (what this query does)'
SELECT year, ROUND(AVG(pages), 1) AS avg_pages
FROM longlist
WHERE pages IS NOT NULL
GROUP BY year
ORDER BY year ASC;

-- A9
.print 'A9: MAX(LENGTH(title)) longest title length (what this query does)'
SELECT MAX(LENGTH(title)) AS longest_title_len FROM longlist;

-- A10
.print 'A10: Years with >= 10 titles using HAVING (what this query does)'
SELECT year, COUNT(*) AS n
FROM longlist
GROUP BY year
HAVING n >= 10
ORDER BY n DESC, year DESC;

-- A11
.print 'A11: Authors with >1000 total pages (what this query does)'
SELECT author, SUM(pages) AS total_pages
FROM longlist
WHERE pages IS NOT NULL
GROUP BY author
HAVING total_pages > 1000
ORDER BY total_pages DESC, author ASC
LIMIT 15;

-- A12
.print 'A12: MIN(title), MAX(title) lexicographic (what this query does)'
SELECT MIN(title) AS first_title, MAX(title) AS last_title FROM longlist;

-- A13
.print 'A13: AVG(LENGTH(title)) by year (what this query does)'
SELECT year, ROUND(AVG(LENGTH(title)), 1) AS avg_title_len
FROM longlist
GROUP BY year
ORDER BY year ASC;

-- A14
.print 'A14: COUNT(DISTINCT translator) where present (what this query does)'
SELECT COUNT(DISTINCT translator) AS unique_translators
FROM longlist
WHERE translator IS NOT NULL AND translator <> '';

.output stdout
