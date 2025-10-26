-- starting the pow workflow
.output pow-p1.txt
.headers on
.mode box


-- 38:10  DROP TABLE
-- DROP TABLE "riders";
-- DROP TABLE "stations";
-- DROP TABLE "visits";





-- .print '<-- create riders -->'
-- CREATE TABLE IF NOT EXISTS "riders" (
--   "id",
--   "name"
-- );

-- .print '<-- stations -->'
-- CREATE TABLE IF NOT EXISTS "stations" (
--   "id",
--   "name",
--   "line"
-- );

-- .print '<-- create visits -->'
-- CREATE TABLE IF NOT EXISTS "visits" (
--   "rider_id",
--   "station_id"
-- );

.print '<-- schema -->'
.schema

.output stdout
-- bash: sqlite3 designing/mbta.db < designing/p1-q.sql
