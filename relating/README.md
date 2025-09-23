# Week 6 Relating Part 1

## Week 6 Attendance


## Overview of Relating Concepts
### Relating
A relational database has multiple tables in our case authors, books, publishers and many more, each storing related data.
 Some different relationship types, One-to-One means one author writes one book, One-to-Many, one author writes multiple books which is most common. Many-to-Many occurs with books with multiple authors, authors writing multiple books. Keep in mind having separate tables avoids redundancy.
Relationships are essential for accuracy and efficiency.

### Entity Relationship Diagrams (ERD)
ERDs visualize tables (entities) and their relationships.

Entities: authors, books, translators, publishers, ratings.

Crow’s Foot Notation shows relationships:

Circle = zero

Line = one

Crow’s foot = many

Example: An author can write one or many books; a book must have at least one author but can have many.

ERDs help design databases, document relationships, and communicate structure before implementation which is very very important.

### Keys
A Primary Key is unique identifier for each row in a table ISBN for books, or an auto-generated ID.

Problems with using ISBN: too long, leading zeros lost, storage issues better to create a shorter numeric ID.

Foreign Key: a primary key from one table included in another table to establish relationships.

Example! books table has id; ratings table uses book_id as a foreign key to connect reviews to the right book.

Junction/Associative Table: used for many-to-many ex. an authored table with author_id + book_id.

Keys make it easier to connect tables, avoid confusion, and keep the data clean without extra duplicates.

## '1:N Subqueries'
A subquery is a query written inside another query. It’s often used when you need results from one table to filter or match rows in another table.

The subquery (inside the parentheses) always runs first.
 Its output is then used by the outer query.

# Week 7 Relating Part 2

 ## Week 7 Attendance  
– To output just the book title and author’s name, I would join the books, authored, and authors tables together.  
like:  

SELECT "title", "name"
FROM "books"
JOIN "authored" ON books.id = authored.book_id
JOIN "authors" ON authors.id = authored.author_id;

# Week 7 Relating Part 2
## INNER JOIN  
An INNER JOIN returns only the rows where there is a match in both tables.  If a row in one table does not have an alike row in the other, it will not appear in the result.  
In SQLite, just writing `JOIN` is the same as `INNER JOIN`.  


## LEFT, RIGHT and FULL JOIN (OUTER)

LEFT OUTER JOIN will keep all rows from the left table; bring matching right rows or NULLs when no match.

RIGHT OUTER JOIN will mirror of left, keep all rows from the right table.


FULL OUTER JOIN: keep all rows from both sides match where possible, otherwise fill with NULLs.

Question? Do we get a separate table back? No,JOINs always return a single result set produced by combining rows according to the join type.

## NATURAL JOIN

Automatically joins on all columns with the same name in both tables and returns one copy of those columns.
Handy for quick exploring, but risky in production if a new same named column appears.sqlite3 

## Sets
 Sets in SQL let us combine or compare results from multiple queries.
`UNION` will combines results, removing duplicates.
`INTERSECT` will only returns rows found in both results.
`EXCEPT` always returns rows from the first query that aren’t in the second.


### GROUP BY
- `AVG()` will calculates the average of a column
- `COUNT()` Counts rows
- `ROUND(value, 2)` Rounds numbers to 2 decimals
- `GROUP BY` Groups rows that share the same value so agg functions can be used  
- `HAVING` Filters groups after agg function

