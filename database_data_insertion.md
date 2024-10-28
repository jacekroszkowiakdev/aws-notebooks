# Inserting Data into a Database

# What is a .csv file?

A `.csv` file is a simple text file where information is separated by commas.

-   `.csv` files can be opened in any program that works with plain text.
-   `.csv` files have the following format:
    -   Each line contains the same sequence of data.
    -   Each data point is separated by a comma.
    -   A semicolon, space, or other characters can also be used instead of a comma, although the comma is the most common.
-   These files are commonly used to import or export data in databases and spreadsheets.

## Example of a .csv file viewed as plain text

```plaintext
ABW, Aruba, North America, 193.00
AFG, Afghanistan, Asia, 652090.00
AGO, Angola, Africa, 1246700.00
AIA, Anguilla, North America, 96.00
```

Example of a .csv file viewed as a table:

![.csv as a table](./img/csv_table.png)

## Importing data and exporting data

## Importing a CSV

Often, you may need to import a `.csv` file into a database. This process is straightforward if you follow these 3 steps:

1. **Verify** that the `.csv` file has data matching the number of columns in the table and that each column contains the correct data type.
2. **Create** a table in MySQL with a name corresponding to the `.csv` file you wish to import.
3. **Import** by using the `LOAD DATA` statement.
    - If the first row of the file contains column headers, use the `IGNORE 1 ROWS` clause to ignore the first row.
    - If rows in the file are terminated by a newline character, use the `TERMINATED BY '\n'` clause to specify this.

Often, you may need to import a `.csv` file into a database. This process is straightforward if you follow these steps:

1. **Verify** that the `.csv` file has data matching the number of columns in the table and that each column contains the correct data type.
2. **Create** a table in MySQL with a name corresponding to the `.csv` file you wish to import.
3. **Import** by using the `LOAD DATA` statement.
    - If the first row of the file contains column headers, use the `IGNORE 1 ROWS` clause to ignore the first row.
    - If rows in the file are terminated by a newline character, use the `TERMINATED BY '\n'` clause to specify this.

This statement imports data from the temporary file into the city table:

```sql
LOAD DATA INFILE 'c:/tmp/city.csv'INTO TABLE city
FIELDS TERMINIATED BY ' , '
ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;
```

**Note**: that the ENCLOSED BYclause indicates that each field in the file is enclosed by the specified character. For example, a line in the .csv file appears as follows:"ABW", "Aruba", "North America", "193.00"

## Exporting a CSV

This statement exports data from the city table and places it into the temporary city.csv file:

```sql
SELECT id, name, countrycode FROM city
INTO OUTFILE '/tmp/mysqlfiles/city.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
```

It will output the selected columns from the city table into the specified file.

## Cleaning data

When importing and exporting data in .csv files, some data might contain errors. As changes are made to databases over time, issues can arise due to disorganization or errors in the data. Data cleaning is essential for several reasons:

-   **Increased productivity**
-   **Improved data quality**
-   **Fewer errors**

## SQL String Functions for Data Cleaning

To address these issues, data can be cleaned using the following SQL string functions:

-   **LEFT, RIGHT, and TRIM**: Select specific parts of strings or remove unwanted characters.
-   **CONCAT**: Combine strings from multiple columns into one.
-   **LOWER**: Convert every character in a string to lowercase.
-   **UPPER**: Convert every character in a string to uppercase.

## DESCRIBE and INSERT statements

-   The `DESCRIBE` statement is used to display the structure of a table or view. Usually, tables have more than one column.

```sql
DESCRIBE table_name;
```

<br>

-   To use the `INSERT` statement, it is important to know how the table that you are you inserting the information into is formatted.

-   The `INSERT INTO` statement is essential for populating a database table with data.
-   It is used to insert a single record or multiple records into a table.
-   The `INSERT INTO` statement is classified as a data manipulation language (DML) command.

```sql
INSERT INTO tableName (col_name, col_name, col_name,... col_n)VALUES(‘val_1’, ‘val_2’, ‘val_3’,... ‘val_n’);
```

**Note**:

-   The order of the columns in the statement is important.
-   Column represents the field titles.
-   Valuesrepresents thedata that is being insertedinto the fields.
-   When you insert a row, you must specify a column where the data will go.
-   When you insert values, you must enclose the values with single quotation marks (' ') for character or date values.

# Using the `INSERT INTO` Statement

The `INSERT INTO` statement can be used in two ways:

1. **Without Specifying Column Names**: When you add values for all columns in the table, you do not need to specify the column names:

    ```sql
    INSERT INTO table_name
    VALUES (value1, value2, value3, ...);
    ```

2. **With Specifying Column Names**: If you only want to insert values into specific columns, you must specify both the column names and the values:

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

## NULL statement

`NULL` statements are used as placeholders or to represent a missing value to improve readability. They also clarify the meaning and actions of conditional statements.

The `INSERT` statement can insert a `NULL` value into a column. You can insert a `NULL` value into an int column with a condition that the column must ++not have NOT NULL constraints++.

```sql
INSERT INTO tableName(Col_1) values(NULL);
```
