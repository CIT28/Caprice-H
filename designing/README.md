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
