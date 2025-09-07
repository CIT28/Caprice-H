# Week 2 Querying Part 3

A query retrieves the title and author for all books on the longlist published in either 2022 or 2023. It also gets the title and format for books from 2022 and 2023, excluding any that are hardcovers. To do this, SQL uses operators like OR to include results that match any of your conditions, AND to require all conditions to be met, and NOT to exclude results that match a condition. Parentheses are used to group these conditions and ensure they are processed in the right order.

## WHERE, NULL, IS NOT NULL
The first query finds all books on the longlist that do not have a translator, while the second one finds all books that do have a translator. The WHERE clause is the key here, as it's used with IS NULL and IS NOT NULL to filter the results.

## WHERE and LIKE, % and _ 
The first query retrieves the title of a book from the "longlist" table where the title contains the word "love". The LIKE operator is used with the % wildcard to search for the word anywhere within the string. The second query retrieves the title and year from the same table, but it filters the results to only include years between 2019 and 2022, inclusive. The >= and <= operators are used to create a range, which is more efficient than listing out each individual year with OR. Having done these queries gave it easir for me to understand what each operators mean and how they filter correctly.

# Week 3 Querying Part 4

## Comparison and Range

These operators are all about filtering your data based on a relationship between two values. > and < are used for "greater than" or "less than," while >= and <= include the values themselves. = checks for an exact match, and <> or != checks for values that are not equal. BETWEEN is a handy shortcut for inclusive ranges.

Logical & Pattern

AND, OR, and NOT are the building blocks for combining multiple conditions. AND means all conditions must be true, OR means at least one must be true, and NOT reverses a condition. LIKE is used for flexible text searches. You can use % as a wildcard for any number of characters and _ for a single character.

NULL and Order of Evaluation

When a value is missing or unknown in a database, it's considered NULL. You can't use = or != to check for it, so you have to use IS NULL or IS NOT NULL. Finally, parentheses () are super important because they let you group conditions and control the order in which they are evaluated, ensuring your query does exactly what you intend.

## Order By
I'm getting really comfortable with ORDER BY and LIMIT. I know that ORDER BY sorts my results, and by default, it sorts them from lowest to highest. But I can change that with DESC to see the highest ratings first, which is exactly what I want for a "best of" list. The LIMIT clause is awesome because it keeps my results from getting too long, so I only see the top 10.

I think the biggest breakthrough for me was figuring out how to sort by multiple things. I noticed that some books had the same rating, and that bothered me. But by adding "votes" DESC to my ORDER BY clause, I've taught the query to break the tie by showing the book with more votes first. It's a small change, but it makes the results so much better.


## Aggregates

Aggregate functions in SQL are tools for summarizing data. The AVG function calculates the mean of a column, and pairing it with ROUND improves readability by limiting decimals, often with an alias to label the result. MIN and MAX return the smallest and largest values, which also apply to text columns alphabetically, making them useful for finding the first and last titles in a dataset. 
SUM adds up values across rows, while COUNT(*) counts all rows in a table. Using COUNT(col) instead only includes rows where that column is not NULL, which is helpful for fields like translators that may be missing data. 
The DISTINCT keyword eliminates duplicates, and combining it with COUNT allows you to measure the number of unique values in a column, such as how many publishers are represented. 

## My thoughts

Working through aggregates clarified how summaries differ from row-by-row filters. I found it especially helpful to see that `COUNT(*)` and `COUNT(col)` answer different questions (rows vs. non-NULL values), and that `DISTINCT` is essential when you want unique entities (like publishers). Using `MIN`/`MAX` on text was a good reminder that SQL orders strings alphabetically, not by length. Adding `.print` before each query made the POW output readable and easy to grade, and aliases improved the clarity of single-value results. Together, these functions allow you to calculate averages, totals, extremes, row counts, and unique counts, making them essential for analyzing and understanding data patterns. 
