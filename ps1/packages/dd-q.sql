.mode box
.headers on
.output pow-dd.txt



-- .print 'drop-off address a nested subquery'
-- SELECT a."address"
-- FROM "addresses" a
-- WHERE a."id" = (
--   SELECT s."address_id"
--   FROM "scans" s
--   WHERE s."action" = 'Drop'
--     AND s."package_id" = (
--       SELECT "id"
--       FROM "packages"
--       WHERE "contents" = 'Duck debugger'
--       LIMIT 1
--     )
--   LIMIT 1
-- );

.print 'DD JOIN query drop-off and contents'
SELECT a.address AS "Drop Off Address", p.contents AS "Contents of Package"
FROM scans s
JOIN packages p ON p.id = s.package_id
JOIN addresses a ON a.id = s.address_id
WHERE s.action = 'Drop'
  AND p.contents = 'Duck debugger'
ORDER BY s.timestamp
LIMIT 1;





-- p for identifier from address
-- s for identifier from scans

.output stdout
-- sqlite3 packages.db < dd-q.sql