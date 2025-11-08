-- Donuts and Ingredients schema
DROP TABLE IF EXISTS "order_items";
DROP TABLE IF EXISTS "orders";
DROP TABLE IF EXISTS "customers";
DROP TABLE IF EXISTS "donut_ingredients";
DROP TABLE IF EXISTS "donuts";
DROP TABLE IF EXISTS "ingredients";

-- Ingredients:
-- - ingredient name flour, cocoa, sugar
-- - Track price per unit and the unit type (lb, g)
CREATE TABLE "ingredients" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    "unit" TEXT NOT NULL,
    "price_per_unit" NUMERIC NOT NULL CHECK ("price_per_unit" > 0)
);

-- the sample data
--Cocoa: $5per lb
--Sugar: $2per lb
--Plus extra ingredients needed for donuts in examples.
INSERT INTO "ingredients" ("id", "name", "unit", "price_per_unit") VALUES
    (1, 'Cocoa',      'lb', 5.00),
    (2, 'Sugar',      'lb', 2.00),
    (3, 'Flour',      'lb', 1.00),
    (4, 'Buttermilk', 'lb', 3.00),
    (5, 'Sprinkles',  'lb', 4.00);


-- Donuts
-- name, gluten-free flag, and price per donut
CREATE TABLE "donuts" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    -- 0 = not glutenfree, 1 = glutenfree
    "gluten_free" INTEGER NOT NULL CHECK ("gluten_free" IN (0, 1)),
    "price" NUMERIC NOT NULL CHECK ("price" > 0)
);

-- Belgian Dark Chocolate not gluten-free $4
-- Bts sprinkles not gluten-free $4
INSERT INTO "donuts" ("id", "name", "gluten_free", "price") VALUES
    (1, 'Belgian Dark Chocolate', 0, 4.00),
    (2, 'Back-To-School Sprinkles', 0, 4.00);    
-- Donuts Ingredients
-- Link the table so we can see which ingredients are used in each donut
-- be able to look up the ingredients for each of the donuts
CREATE TABLE "donut_ingredients" (
    "id" INTEGER PRIMARY KEY,
    "donut_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);

-- BDark Chocolate ingredients
INSERT INTO "donut_ingredients" ("id", "donut_id", "ingredient_id") VALUES
    (1, 1, 1),
    (2, 1, 3),
    (3, 1, 4),
    (4, 1, 2);

-- BTS Sprinkles ingredients
INSERT INTO "donut_ingredients" ("id", "donut_id", "ingredient_id") VALUES
    (5, 2, 3),
    (6, 2, 4),
    (7, 2, 2),
    (8, 2, 5); 

-- Customers
-- store first and last name so we can identify who placed each order.
CREATE TABLE "customers" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name"  TEXT NOT NULL
);
--sample data using luis singh
INSERT INTO "customers" ("id", "first_name", "last_name") VALUES
    (1, 'Luis', 'Singh');


-- Orders
--Order number for internal tracking.
--Link each order to exactly one customer.
CREATE TABLE "orders" (
    "id" INTEGER PRIMARY KEY,
    "customer_id" INTEGER NOT NULL,
    -- time of when the order was placed
    "placed_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

-- order 1 from luis
INSERT INTO "orders" ("id", "customer_id") VALUES
    (1, 1);


--(order_items) Track all donuts in each order.
--Connect orders to donuts.
--Store quantity of each donut in an order.

CREATE TABLE "order_items" (
    "id" INTEGER PRIMARY KEY,
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL CHECK ("quantity" > 0),
    FOREIGN KEY ("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);

-- order 1, 3 BDC, 2 BTS
INSERT INTO "order_items" ("id", "order_id", "donut_id", "quantity") VALUES
    (1, 1, 1, 3),
    (2, 1, 2, 2);