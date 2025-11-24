.output pow-p2.txt
.mode box
PRAGMA foreign_keys = ON;

.print 'reassign "Farmers working at dawn" to Li Yin in created'
-- UPDATE "created"
-- SET "artist_id" = (SELECT "id" FROM "artists" WHERE "name" = 'Li Yin')
-- WHERE "collection_id" = (SELECT "id" FROM "collections" WHERE "title" = 'Farmers working at dawn');

.print 'confirm the update here dont forget to comment out the update when done'
SELECT a.name AS artist, c.title AS work
FROM created cr
JOIN artists a     ON a.id = cr.artist_id
JOIN collections c ON c.id = cr.collection_id
WHERE c.title = 'Farmers working at dawn';

.output stdout
