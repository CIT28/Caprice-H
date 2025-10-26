-- starting the pow workflow
.output pow-p1.txt
.headers on
.mode box


-- 38:10  DROP TABLEs
-- DROP TABLE "riders";
-- DROP TABLE "stations";
-- DROP TABLE "visits";

-- CREATE TABLE "riders" (
--     "id" INTEGER,
--     "name" TEXT,
--     PRIMARY KEY ("id")

-- );

-- CREATE TABLE "stations" (
--     "id" INTEGER,
--     "name" TEXT,
--     "line" TEXT,
--     PRIMARY KEY ("id")

-- );


-- CREATE TABLE "visits" (
--     "id" INTEGER,
--     "rider_id" INTEGER,
--     "station_id" INTEGER,
--     PRIMARY KEY ("id"),
--     FOREIGN KEY ("rider_id") REFERENCES "riders"("id"),
--     FOREIGN KEY ("station_id") REFERENCES "stations"("id")

-- );

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
-- bash: sqlite3 mbta.db < p1-q.sql
