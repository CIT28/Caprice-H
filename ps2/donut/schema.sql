-- Donuts and Ingredients schema

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

