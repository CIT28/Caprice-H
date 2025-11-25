.output pow-p2.txt
.mode box



.print "create transactions table"
CREATE TABLE IF NOT EXISTS "transactions" (
    "id" INTEGER,
    "title" TEXT,
    "action" TEXT,
    PRIMARY KEY ("id")
);

.print "create sell trigger"
CREATE TRIGGER IF NOT EXISTS "sell"
BEFORE DELETE ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (OLD."title", 'sold');
END;

.print "test trigger"
-- DELETE FROM collections
-- WHERE title = 'Profusion of flowers';

.print "create buy trigger to log purchases"
-- this trigger fires AFTER! a row is inserted into collections
CREATE TRIGGER IF NOT EXISTS "buy"
AFTER INSERT ON "collections"
FOR EACH ROW
BEGIN
    
    INSERT INTO "transactions" ("title", "action")
    VALUES (NEW."title", 'bought');
END;

.print "verify schema now includes buy trigger"
.schema

.print "test buy trigger"
-- Uncomment and run ONCE, then re-comment
-- INSERT INTO "collections" ("title", "accession_number", "acquired")
-- VALUES ('Profusion of flowers', 56.257, '1956-04-12');

.print "add deleted column"
-- ALTER TABLE collections
-- ADD COLUMN deleted INTEGER DEFAULT 0;

.print "verify deleted column exists"
.schema collections

.print "show collections with deleted values"
SELECT * FROM collections;

.print "mark an item as deleted"
-- UPDATE collections
-- SET deleted = 1
-- WHERE title = 'Farmers working at dawn';

.print "verify collections n transactions after test insert"
SELECT * FROM "collections";
SELECT * FROM "transactions";

.schema


---bash sqlite3 mfa.db < p2-q.sql