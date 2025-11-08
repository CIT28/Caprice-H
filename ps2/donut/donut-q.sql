.output pow-d.txt
.mode box
-- Donuts and ingredients
-- Requirements covered
--keeping track of the ingredients, including name, unit, and price per unit.
--Keep track of donuts, including name, glutenfree, and price.
--Be able to look up which ingredients belong to each donut.

.print 'creating donuts and ingredients tables from schema.sql'
.read schema.sql

.print 'verify tables'
.tables

.print 'showing schema for donuts and ingredients'
.schema ingredients
.schema donuts
.schema donut_ingredients

-- bash: sqlite3 donuts.db < donut-q.sql