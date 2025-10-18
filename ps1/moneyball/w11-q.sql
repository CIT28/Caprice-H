.output pow-a.txt
.headers on
.mode box




.print '<--Attendance Query #1: players born in 1969-->'
SELECT "first_name", "last_name"
FROM "players"
WHERE "birth_year" = 1969
ORDER BY "last_name", "first_name";

.print '<--Attendance Query #1 count-->'
SELECT COUNT(*) FROM (
  SELECT "first_name", "last_name"
  FROM "players"
  WHERE "birth_year" = 1969
);











.output stdout
-- bash: sqlite3 moneyball.db < w11-q.sql