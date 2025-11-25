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

.print "verify trigger results"
SELECT * FROM collections;
SELECT * FROM transactions;

.print "schema proof"
.schema


---bash sqlite3 mfa.db < p2-q.sql