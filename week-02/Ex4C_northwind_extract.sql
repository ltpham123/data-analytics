/*
Longley Pham
a) What is the name of the table that holds the items Northwind sells?
	The table that holds the items Northwind sells is called 'products'.
SELECT *
FROM products;

b) What is the name of the table that holds the types/categories of the items Northwind sells?
	The table that holds the types/categories of the items Northwind sells is called 'categories'.
SELECT *
FROM categories;
*/

SELECT *
FROM employees;
-- Margaret Peacock is the Northwind employee that name makes it look like she's a bird.

SELECT *
FROM products
LIMIT 10;
-- 77 records were returned; you can limit the number of rows retrieved under Query > Limit Rows > Limit to 10 rows.
-- BONUS: You can write the query to limit the number of rows returned by including the LIMIT function, which limits the number of rows displayed to the value specified.

SELECT *
FROM categories;
-- The CategoryID of Seafood is 8.

SELECT OrderID, OrderDate, ShipName, ShipCountry
FROM orders
LIMIT 50;