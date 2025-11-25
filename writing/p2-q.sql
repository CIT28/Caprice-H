.output pow-p2.txt
.mode box
PRAGMA foreign_keys = ON;

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

.print "test sell trigger (one-time)"
-- DELETE FROM collections
-- WHERE title = 'Profusion of flowers';


.print "create buy trigger to log purchases"
-- this trigger fires AFTER a row is inserted into collections
CREATE TRIGGER IF NOT EXISTS "buy"
AFTER INSERT ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (NEW."title", 'bought');
END;

.print "verify schema includes triggers n the transactions"
.schema


.print "add deleted column"
-- ALTER TABLE collections
-- ADD COLUMN deleted INTEGER DEFAULT 0;

.print "mark an item as deleted"
-- UPDATE collections
-- SET deleted = 1
-- WHERE title = 'Farmers working at dawn';

.print "verify deleted column current collections"
.schema collections
SELECT * FROM collections;

.print "show only non deleted items"
SELECT *
FROM collections
WHERE deleted != 1;



.print "verify collections n transactions"
SELECT * FROM collections;
SELECT * FROM transactions;

.print "final schema proof"
.schema
