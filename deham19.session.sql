-- SELECT * FROM employees.employees limit 20;
-- SELECT * FROM employees WHERE first_name LIKE '%Tzvetan%';

-- SELECT * FROM employees.dept_manager limit 20;
-- DESC employees;

-- create DATABASE JACEK_TEST;

use deham19;

DROP TABLE IF EXISTS customers_jmr;

CREATE TABLE customers_jmr (
  CustomerNumber INT PRIMARY KEY,
  CustomerName TEXT NOT NULL,
  PhoneNumber VARCHAR(50) NOT NULL,
  BillingAddress VARCHAR(100) NOT NULL,
  EmailAddress VARCHAR(50) NOT NULL CHECK (EmailAddress LIKE '%_@_%._%')
);

DROP TABLE IF EXISTS product_jmr;

CREATE TABLE product_jmr (
  ProductNumber INT PRIMARY KEY,
  ProductName VARCHAR(255) NOT NULL,
  Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
  BarCode VARCHAR(50) NOT NULL
);

-- DROP DATABASE JACEK_TEST;