Use the ORDER BY clause to sort data by a specific column in either ascending or descending order.•Use the GROUP BY and HAVING clauses to group data and filter groups.Key terms include the following:•Sorting•ORDER BY clause•GROUP BY clause•HAVING clause2

An ORDER BY clause can contain more than one sort operation. This example first sorts the query results by continent name in ascending order. This sort is called the primary sort order because this sort is listed first in the ORDER BY clause. Next, the results of the primary sort are sorted again in descending order of surfacearea. This sort is called a secondary sort because this sort is listed second in the ORDER BY clause.ORDER BY clauses are not limited to two sort operations. The available columns in the table or tables that are being queried drive the list of columns by which you can sort.

Instead of spelling out entire column names in an ORDER BY clause, you can also use implicit column placeholders.This query has continent and surfacearea columns as the second and third columns in the SELECT clause.You can use those implicit numeric placeholder values in the ORDER BY clause in place of the actual column names themselves. In this example, the number 2 in the ORDER BY clause represents the continent column from the SELECT clause. The number 3 represents the surfacearea column from the SELECT clause.You can choose the method that you use to specify the sort columns based on your personal preferences. Alternatively, a company’s established coding standards and practices might formally define this method.

## Grouping and filtering data

```sql
SELECT continent, name
FROM country
WHERE(continent = 'South America'AND population > 12000000) OR continent = 'Antarctica'
ORDER BY 1, 2;
```

Using `GROUP BY` items with filter conditions SQL statement `WHERE` clauses are evaluated before the `GROUP BY` clause.The `HAVING` clause is used to filter query results after applying the `GROUP BY` clause.The `HAVING` clause will include the same column used in the aggregation function of the `SELECT` clause. The `WHERE` clause is evaluated before the `HAVING` clause in a SQL statement.

```sql
SELECT continent, COUNT(name) AS countries
FROM country
WHERE (continent = 'South America' AND population > 12000000)
   OR continent = 'Antarctica'
GROUP BY continent
HAVING COUNT(name) > 5
ORDER BY continent, countries;
```

The HAVING clause in a SQL statement is used with the `GROUP BY` clause to add a filter condition based on the aggregated value.In this example, the `GROUP BY` clause returns two rows. The `HAVING` clause then further filters those rows to return only the continents that have more than five countries in them.

Key takeaways•Sorting is the practice of organizing the sequence of the data returned by a query so that the data can be analyzed effectively. •Use the ORDER BY clause to sort data in a specific column in ascending or descending order by using the keyword ASC or DESC.•Use the GROUP BY clause to combine query output into groups.•Use the HAVING clause to filter query results by using grouped data
