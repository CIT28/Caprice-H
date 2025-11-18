.mode box
.output pow-p1.txt


-- .print 'setup temp_mfa table for import'
-- DROP TABLE IF EXISTS temp_mfa;
-- CREATE TABLE temp_mfa (
--   title TEXT,
--   accession_number TEXT,
--   acquired TEXT,
--   extra TEXT
-- );




.print 'import CSV without id into temp'
.mode csv
.import --csv --skip 1 mfa.csv temp

.print 'check temp was created from header'
.schema temp

.print 'show temp rows'
SELECT * FROM temp LIMIT 10;

-- .print 'import mfa.csv into temp_mfa'
-- .mode csv
-- .import --csv --skip 1 /workspaces/Caprice-H/writing/mfa.csv temp_mfa

-- .print 'copy into collections'
-- INSERT INTO collections (title, accession_number, acquired)
-- SELECT title, accession_number, acquired FROM temp_mfa;

-- .print 'verify schema and sample rows'
-- .schema collections
-- SELECT * FROM collections LIMIT 10;




-- .print 'import mfa.csv into temp_mfa'
-- .mode csv
-- .import

-- .print 'copy into collections'
-- INSERT INTO collections (title, accession_number, acquired)
-- SELECT title, accession_number, acquired
-- FROM temp_mfa;

-- .print 'verify'
-- .schema collections
-- SELECT * FROM collections LIMIT 10;


-- CREATE TABLE "collections" (
--   "id" INTEGER PRIMARY KEY,
--   "title" TEXT NOT NULL,
--   "accession_number" TEXT NOT NULL UNIQUE,
--   "acquired" TEXT
-- );



-- .print 'INSERT rows'

-- .print 'profusion of flowers — 56.257'
-- INSERT INTO "collections" ("title","accession_number","acquired")
-- VALUES ('Profusion of Flowers','56.257','1956-04-12');

-- .print 'farmers working at dawn 11.6152'
-- INSERT INTO "collections" ("title","accession_number","acquired")
-- VALUES ('Farmers working at dawn','11.6152','1911-08-03');

-- .print 'spring outing 14.76'
-- INSERT INTO "collections" ("title","accession_number","acquired")
-- VALUES ('Spring Outing','14.76','1914-01-08');


-- .print 'Inserting "Spring Outing" WITHOUT an id. Expect: a new row with the next id.'
-- INSERT INTO "collections" ("title","accession_number","acquired")
-- VALUES ('Spring Outing','14.76-NEW','1914-01-08');

-- .print 'trying to insert a dupe accession_number ("14.76")'
-- INSERT INTO "collections" ("title","accession_number","acquired")
-- VALUES ('Duplicate test','14.76','1914-01-08');

-- .print 'try to insert with title = NULL'
-- INSERT INTO "collections" ("title","accession_number","acquired")
-- VALUES (NULL,'XX.000','2000-01-01');

-- .print 'insert with accession_number = NULL'
-- INSERT INTO "collections" ("title","accession_number","acquired")
-- VALUES ('No accession',NULL,'2000-01-01');

-- .print 'INSERT multiple rows with one statement'
-- INSERT INTO "collections" ("title","accession_number","acquired")
-- VALUES
--   ('Pro flowers','21.100','1921-06-01'),
--   ('farmers sky','21.101','1921-06-02'),
--   ('butterfuly and peonies','21.102','1921-06-03');

-- .print 'lets see if it worked'
-- SELECT * FROM "collections";

.print 'Show schema'
.schema collections

.output stdout




-- bash: sqlite3 mfa.db < p1-q.sql
