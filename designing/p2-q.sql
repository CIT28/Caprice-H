
.output pow-p2.txt
.mode box


--.ALTER TABLE "visits" RENAME TO "swipes";


-- DROP TABLE IF EXISTS "visits";
-- DROP TABLE IF EXISTS "stations";
-- DROP TABLE IF EXISTS "riders";

-- CREATE TABLE "riders" (
--     "id" INTEGER,
--     "name" TEXT
-- );

-- CREATE TABLE "stations" (
--     "id" INTEGER,
--     "name" TEXT,
--     "line" TEXT
-- );

-- CREATE TABLE "visits" (
--     "rider_id" INTEGER,
--     "station_id" INTEGER
-- );

.schema
.print 'column constraints example'

.output stdout
-- bash: sqlite3 mbta.db < p2-q.sql
