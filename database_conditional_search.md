# Performing a Conditional Search

## Types of Operators

These operators can be used in `SELECT`, `INSERT`, `UPDATE`, and `DELETE` statements. There are three main types of operators used in search conditions:

### Arithmetic operators

    Perform mathematical operations, such as addition, subtraction, multiplication, and division on numeric data. This is helpful when you need calculations on columns or values in your queries.

| SQL Operation  | Operator |
| -------------- | :------: |
| Addition       |   `+`    |
| Subtraction    |   `–`    |
| Multiplication |   `*`    |
| Division       |   `/`    |
| Modulus        |   `%`    |

The SQL arithmetic operators include addition, subtraction, multiplication, division, and modulus (which returns the remainder after division).

### Comparison Operators

    Used to compare two values or columns, determining if one value is greater than, equal to, or not equal to another. This allows for filtering data by specific conditions, like only selecting rows where a column meets a particular value or range.

| SQL Operation         | Operation  | Description                                                                                                      |
| --------------------- | :--------: | ---------------------------------------------------------------------------------------------------------------- |
| Equals                |    `=`     | Compares two data items to see whether they are equal.                                                           |
| Not equal             | `!=`, `<>` | Compares two data items to see whether they are not equal.                                                       |
| Less than             |    `<`     | Compares two data items to see whether the value on the left is less than the value on the right.                |
| Greater than          |    `>`     | Compares two data items to see whether the value on the left is greater than the value on the right.             |
| Less than or equal    |    `<=`    | Compares two data items to see whether the value on the left is less than or equal to the value on the right.    |
| Greater than or equal |    `>=`    | Compares two data items to see whether the value on the left is greater than or equal to the value on the right. |

**Note:** The not-equal-to operator has two options: `!=` and `<>`. The choice between these may depend on personal preference or a company’s coding standards.

### Logical operators

    Allow combining multiple conditions in a query with AND, OR, and NOT. This is useful for complex filtering, such as selecting rows that meet multiple criteria or excluding specific results.

| SQL Operator | Description                                                                                                                                                          |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AND`        | Joins two or more conditions in a `WHERE` clause. All conditions must be true for data items to be affected by the SQL statement.                                    |
| `OR`         | Joins two or more conditions in a `WHERE` clause. At least one of the conditions must be true for data items to be affected by the SQL statement.                    |
| `IN`         | Used for matching on multiple data items in a single `WHERE` clause by using a list of conditional values.                                                           |
| `LIKE`       | Used for matching on multiple data items in a single `WHERE` clause by using partially matching conditional values referred to as wildcards (denoted by `_` or `%`). |
| `BETWEEN`    | Used for matching on multiple data items in a single `WHERE` clause by specifying a range on matching conditional values.                                            |
| `NOT`        | Reverses the effect of `IN`, `LIKE`, and `BETWEEN` operators.                                                                                                        |

## Wildcards

In SQL, the `LIKE` operator supports two primary wildcards for pattern matching:

1.`% (Percent Sign)`

Represents zero or more characters

```sql
SELECT * FROM table_name WHERE column_name LIKE 'a%';
```

2. `_ (Underscore)`

Represents a single character

```sql
SELECT * FROM table_name WHERE column_name LIKE 'b_t';
```

## SQL Operator Precedence

SQL operators in a statement are evaluated in a default order unless overridden by parentheses. Here’s the typical order of operations:

1. **Operators Enclosed in Parentheses**

    - **Evaluated First**: Operators within parentheses are always evaluated first, allowing control over the order of evaluation.

2. **Operators for Multiplication or Division**

    - Evaluated after parentheses, if present. Multiplication (`*`) and division (`/`) are handled before addition and subtraction.

3. **Operators for Addition or Subtraction**

    - Addition (`+`) and subtraction (`-`) operators are evaluated following multiplication and division.

4. **Comparison Operators**

    - These include `=`, `!=`, `<`, `>`, `<=`, `>=`. They compare values between data items and are evaluated after arithmetic operations.

5. **NOT Operators Used with IN, BETWEEN, and LIKE**

    - The `NOT` operator is used to reverse the effect of conditions such as `IN`, `BETWEEN`, and `LIKE`.

6. **AND Operators**

    - The `AND` operator is evaluated after `NOT` and is used to combine conditions where all must be true.

7. **OR, BETWEEN, IN, and LIKE Operators**
    - **Evaluated Last**: These operators are used to match conditions in broader terms and are evaluated after all other operators.

## Example

If you need a specific evaluation order, you can enclose parts of the condition in parentheses to force precedence.

```sql
SELECT * FROM table_name
WHERE (column1 > 100 AND column2 < 50) OR column3 LIKE 'A%';

```

## SQL Aliases

An alias is used to assign a temporary name to a table or column within a SQL query.

-   **Temporary Scope**: The alias only exists while the SQL statement is running.
-   **Improves Readability**: Aliases help make SQL statements simpler to write and easier to read, especially for columns with complex or obscure names.
-   **Custom Column Headers**: Aliases allow you to specify column headers of your choosing in a query result.
-   **Meaningful Output for Calculations**: Use aliases to give meaningful names to query outputs, especially when performing arithmetic operations.

## Syntax for SQL Aliases

-   **Optional AS Keyword**: You can use the `AS` keyword to assign an alias, though it’s optional.
-   **Quotation Marks for Spaces**: If you want spaces in an alias, enclose it in quotation marks.

### Example Usage

with Column

```sql
SELECT column_name AS "New Column Name"
FROM table_name;
```

with Table

```sql
SELECT t.column_name
FROM table_name AS t;
```

applied to arithmetic operator

```sql
SELECT name, lifeexpectancy, lifeexpectancy+5.5 AS newlifeexpectancy
FROM country
WHERE gnp > 1300000;
```

## NULL values

-   **NULL Representation**: In databases, `NULL` is used to represent the absence of a value for a data item.
-   **Comparison of NULL**:
    -   `NULL` values cannot be compared to each other with typical comparison operators.
    -   `NULL` values are not equal to one another.
-   **Handling NULL in Queries**:
    -   Use `IS NULL` and `IS NOT NULL` in the `WHERE` clause to work with `NULL` values.

## Important Considerations

-   **Not the Same as Zero or Blank Space**:
    -   A `NULL` value differs from zero or a blank space (created by pressing the space bar).
-   **Primary Key Constraints**:
    -   Primary key columns in tables cannot contain `NULL` values.
-   **Custom Column Constraints**:
    -   Non-primary key columns can also be defined as `NOT NULL` if required by the database design.

### Example Usage

#### Checking for NULL Values

```sql
SELECT column_name
FROM table_name
WHERE column_name IS NULL;
```

**NOTE**
Because NULL is the absence of a value, any mathematical or comparison operation on NULL values will always return a NULL value:

```sql
SELECT name, lifeexpectancy lifeexpectancy+1 --Adding + 1 to the lifeexpectancy column still returns a NULL!
FROM country
WHERE lifeexpectancy IS NULL
  AND name NOT LIKE '%Island%';
```
