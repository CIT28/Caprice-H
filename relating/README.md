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
