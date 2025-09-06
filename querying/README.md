# Week 2 Querying Part 3

A query retrieves the title and author for all books on the longlist published in either 2022 or 2023. It also gets the title and format for books from 2022 and 2023, excluding any that are hardcovers. To do this, SQL uses operators like OR to include results that match any of your conditions, AND to require all conditions to be met, and NOT to exclude results that match a condition. Parentheses are used to group these conditions and ensure they are processed in the right order.

## WHERE, NULL, IS NOT NULL
The first query finds all books on the longlist that do not have a translator, while the second one finds all books that do have a translator. The WHERE clause is the key here, as it's used with IS NULL and IS NOT NULL to filter the results.