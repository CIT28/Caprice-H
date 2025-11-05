# Week 12 Attendance
- Answer how can we reference the different veriosn of the longlist.db
without copying it to the desinging folder?
- Just point the SQL command at the other file’s path or ATTACH it by path, 
so I don’t have to copy it into designing.

# Designing Part 1

## Overview
- Goal for this lecture is to move from just relating tables to actually designing schemas that model the real world.
## MTBA
- Carter pivots to a transit example to think about structure, we have riders and stations, 
and we want a schema that scales without repeating the same facts everywhere.
## Normalization
- The first pass table repeats names and stations, which might be a problem if two people share a name or someone rides often,
we can’t track them cleanly and I will end up with duplicate data. Introduce IDs and split entities into their own tables.
Normalization = reduce redundancy!
Split data so each table holds one kind of thing (no mixed facts).

- Give each table a primary key (like id) and use foreign keys to link them.
- Many-to-many? Use a link/junction table
- Benefit of normalization? fewer duplicates, better data quality, clearer queries.

## Storage Classes

- SQLite stores values using storage classes: NULL, INTEGER, REAL, TEXT, BLOB.
- The storage class is chosen per value at insert time.
- Data type vs storage class, data type is what I set in the schema, storage class is how SQLite actually stores each value.

## My Answer
Do we need to specify data types in our schema?  
In SQLite its not required, but it’s good practice because it gives columns a useful type and makes it more clear.

## Examples and Understanding
- Setting INTEGER for a column means numeric looking text like 42 will be stored as an integer when possible.
- Setting TEXT for a column nudges values to remain text.
- Trade off flexibility makes imports easy, but setting types and constraints helps catch bad data early.

## Type Affinities
- Column level hints INTEGER, REAL, TEXT, NUMERIC, BLOB.
- SQLite will try to convert incoming values to the column’s affinity when needed.
- Differs from storage classes will be affinity = column hint, storage class = actual stored form for each value.

## For Example
```
CREATE TABLE learning (
  id INTEGER PRIMARY KEY,
  qty INTEGER,
  price REAL,
  note TEXT
);

INSERT INTO learning (qty, price, note) VALUES ('7', '19.99', 123);
qty:   '7'     
price: '19.99'
note:  123
```
## Boolean (true/false)

- A boolean is just true or false.
- In SQLite there isn’t a strict BOOLEAN type. The common approach is to use an INTEGER with 0 = false and 1 = true.

## Table Constraints

A table constraint is a rule applied to the whole table. In this section we used two which were the PRIMARY KEY and FOREIGN KEY. A PRIMARY KEY uniquely identifies each row which must be unique, not null. A FOREIGN KEY says a column must match a primary key value in another table.

How we used them!

riders(id, PRIMARY KEY(id)) and stations(id, PRIMARY KEY(id)) mark each table’s id as the primary key. 
In visits, we added our own id and then set two foreign keys which were rider_id, riders(id) and station_id, stations(id). That means I can’t insert a visit unless the rider and station exist which makes perfect since now looking at it from a design perspective.

# Designing Part 2


## Column Constraints
NOT NULL
* this column is required
* you cannot leave it empty
* example: name TEXT NOT NULL means every row must have a name
UNIQUE
* every value in that column must be different
* no repeats allowed
* example: station names could be UNIQUE so two stations can’t have the same exact name
DEFAULT
* if you don’t give a value, it will autofill one for me

CHECK
* rule the data has to pass
* if the row breaks the rule, SQLite won’t let it insert


## Constraints Primary Key and Foreign Key
* PRIMARY KEY
-main ID of the table
-must be unique and not NULL
-it lets us point at one specific row
example- CREATE TABLE riders (
       id INTEGER,
       name TEXT,
       PRIMARY KEY(id)
     );

* If you don’t make your own ID, SQLite gives the table a hidden rowid so it can still track rows. 
This is why every row can still be identified.
* FOREIGN KEY
-this is how one table points to another table
-it says “this value must match a real id from that other table”
Idea will be Primary key = who are ya?
Foreign key = who are you talking to?


## Altering Tables

# Summary