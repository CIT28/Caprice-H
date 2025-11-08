.output pow-d.txt
.mode box

-- Donuts, ingredients, customers, orders and the sample data
--What this will run
--Rebuild all tables from schema.sql.
--Insert sample data
--Cocoa $5/lb, Sugar $2/lb
--Belgian dark chocolate and BTS Sprinkles donuts.
--Correct ingredients linked to each donut.
--Customer Luis Singh.
--Order 1 from Luis with 3 Belgian dark chocolate
--and 2 bts Sprinkles donuts.



.read schema.sql
.print 'All tables'
.tables

.output stdout



-- bash: sqlite3 donut.db < donut-q.sql