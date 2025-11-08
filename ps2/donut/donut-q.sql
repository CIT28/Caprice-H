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
-- Donuts & Ingredients & Orders
--Track ingredients.
--Track donuts.
--Be able to look up ingredients for each donut.
--Track the customers.
--Track orders with an order number and a single customer.
--Track which donuts are in each order.


.print 'Running schema.sql to create donuts database tables'
.read schema.sql


.output stdout

-- bash: sqlite3 donuts.db < donut-q.sql