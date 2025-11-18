.mode box
.output pow-p1.txt



.print 'id Primary, title NOT NULl accession_number NOT NULL UNIQUE acquired TEXT'


-- CREATE TABLE "collections" (
--   "id" INTEGER PRIMARY KEY,
--   "title" TEXT NOT NULL,
--   "accession_number" TEXT NOT NULL UNIQUE,
--   "acquired" TEXT
-- );



.print 'INSERT rows'

.print 'profusion of flowers — 56.257'
INSERT INTO "collections" ("title","accession_number","acquired")
VALUES ('Profusion of Flowers','56.257','1956-04-12');

.print 'farmers working at dawn 11.6152'
INSERT INTO "collections" ("title","accession_number","acquired")
VALUES ('Farmers working at dawn','11.6152','1911-08-03');

.print 'spring outing 14.76'
INSERT INTO "collections" ("title","accession_number","acquired")
VALUES ('Spring Outing','14.76','1914-01-08');


.print 'Show schema'
.schema collections

.output stdout




-- bash: sqlite3 mfa.db < p1-q.sql
