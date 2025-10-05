.mode box
.headers on
.output pow-dd.txt



.print 'drop-off address a nested subquery'
SELECT a."address"
FROM "addresses" a
WHERE a."id" = (
  SELECT s."address_id"
  FROM "scans" s
  WHERE s."action" = 'Drop'
    AND s."package_id" = (
      SELECT "id"
      FROM "packages"
      WHERE "contents" = 'Duck debugger'
      LIMIT 1
    )
  LIMIT 1
);







-- p for identifier from address
-- s for identifier from scans

.output stdout
-- sqlite3 packages.db < dd-q.sql