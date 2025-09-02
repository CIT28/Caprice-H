Week 1 Querying Part 1

 0:00–4:13 — Getting started
Notes:
  Spreadsheets are fine for small, singleuser tasks, but they break down with 
growth, multi user access, and when we need for sure  correctness.
  Databases store data in tables with types and constraints to keep data 
consistent.
   SQL lets us filter, sort, join, and compute reproducibly.
  Core ideas: tables, primary keys, relationships, queries.

Why move from spreadsheets? (my answer)
 Spreadsheets get messy. Hard to enforce rules or relationships.
Collaboration causes version conflicts one always has to close a file for 
another to work in
Databases provide schemas, constraints, indexes, transactions for integrity.

 4:13–6:59 — Terms
What is a database?
  A structured collection of data in tables.

What is a DBMS
  Software that stores, enforces rules, and processes queries.

Other DBMS I’ve heard of
SQLite
 Microsoft SQL Server

6:59–8:44 — DBMS differences
 SQLite is embedded single file, MySQL/PostgreSQL are serverbased.
Server DBMS handle more users & much bigger workloads.
PostgreSQL = advanced features MySQL = widely used in web stacks SQLite = 
portable & zero work to config.

8:44 — What is SQL?

My answer (before seeing it):
SQL is a language for speaking directly to the databases.
Given answer: 
SQL is the standard language to define, query, and manipulate relational 
databases.

8:44–12:25 — Query & SQLite
What is a query? 
  A formal request for data or action from the database, expressed in SQL.

Common way SQLite is used: 
  Lightweight, file based database in apps, prototypes, teaching. No server 
just a db file.

Questions I still have:
  When should I switch from SQLite to a server DBMS?

 Style notes (from 19:37)
 SQL keywords in UPPERCASE (SELECT, FROM, WHERE, LIMIT) for readability.
 Consistent quoting (video uses "double quotes" for identifiers).
 One clause per line so diffs are clean and queries are easy to scan.

 Questions I had (16:32–19:37)
Why do some examples show "double quotes" and some show 'single quotes'?
When should I use SELECT * vs selecting specific columns?
Does row order really matter if I don’t use ORDER BY?

# Week 2 Querying Part 3
Practiced filtering (WHERE), sorting (ORDER BY), DISTINCT, aggregation (COUNT, AVG), and LIMIT.
Recorded outputs in pow.txt with `.output '| cat >> pow.txt'` to append between commits.
