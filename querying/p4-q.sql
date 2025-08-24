-- Week 3 • Querying Part 4
.mode box
.output '| cat >> pow4.txt'
.print 'Part 4 setup: first run OK'
.output stdout

-- === OPERATORS (46:01 → 53:10) ===
-- Add 6 queries here, each preceded by a .print that explains it.

-- === ORDER BY (53:10 → 1:02:00) ===
-- Add 5 queries here, each with a .print.

-- === AGGREGATES (1:02:06 → 1:17:21) ===
-- Add 14 queries here, each with a .print.

-- ===== OPERATORS (6 total) =====

-- OPERATORS #1: equality (=)
.output '| cat >> pow4.txt'
.print 'Operators #1: Books from 2023'
SELECT title, author, year
FROM longlist
WHERE year = 2023
LIMIT 10;
.output stdout

-- OPERATORS #2: not equal (!=)
.output '| cat >> pow4.txt'
.print 'Operators #2: 2023 books not in hardcover'
SELECT title, format, year
FROM longlist
WHERE year = 2023
  AND format != 'hardcover'
LIMIT 10;
.output stdout

-- OPERATORS #3: less-than (<)
.output '| cat >> pow4.txt'
.print 'Operators #3: Books under 200 pages'
SELECT title, author, pages
FROM longlist
WHERE pages < 200
ORDER BY pages ASC
LIMIT 10;
.output stdout

-- OPERATORS #4: BETWEEN (range)
.output '| cat >> pow4.txt'
.print 'Operators #4: Books between 2019 and 2021 (inclusive)'
SELECT title, year
FROM longlist
WHERE year BETWEEN 2019 AND 2021
ORDER BY year, title
LIMIT 15;
.output stdout

-- OPERATORS #5: LIKE (pattern match)
.output '| cat >> pow4.txt'
.print 'Operators #5: Titles containing the word Love'
SELECT title
FROM longlist
WHERE title LIKE '%Love%';
.output stdout

-- OPERATORS #6: IS NOT NULL (and not empty)
.output '| cat >> pow4.txt'
.print 'Operators #6: Books that have a translator listed'
SELECT title, translator
FROM longlist
WHERE translator IS NOT NULL
  AND translator <> '';
.output stdout
