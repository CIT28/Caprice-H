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

-- Donuts
-- name, gluten-free flag, and price per donut
CREATE TABLE "donuts" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL UNIQUE,
    -- 0 = not glutenfree, 1 = glutenfree
    "gluten_free" INTEGER NOT NULL CHECK ("gluten_free" IN (0, 1)),
    "price" NUMERIC NOT NULL CHECK ("price" > 0)
);

-- Link the table so we can see which ingredients are used in each donut
-- be able to look up the ingredients for each of the donuts
CREATE TABLE "donut_ingredients" (
    "id" INTEGER PRIMARY KEY,
    "donut_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);


--Order number for internal tracking.
--Link each order to exactly one customer.
CREATE TABLE "orders" (
    "id" INTEGER PRIMARY KEY,
    "customer_id" INTEGER NOT NULL,
    -- time of when the order was placed
    "placed_at" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

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