.output pow-d.txt
.mode box

--Donuts, ingredients, orders, and customers
--track ingredients.
--track donuts.
--link donuts to their ingredients.
--track customers.
--track orders placed by each customer.
--track which donuts and how many are in each order.



.read schema.sql
.tables
.schema customers
.schema orders

.output stdout

-- bash: sqlite3 donuts.db < donut-q.sql