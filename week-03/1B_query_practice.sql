USE northwind; -- specify what data is being queried

/*
1. Write a query to list the product id, product name, and unit price of every product that
Northwind sells.
*/
SELECT ProductID, ProductName, UnitPrice
FROM products;
-- 77 results returned.

/*
2. Write a query to identify the products where the unit price is $7.50 or less.
*/
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice < 7.50;
-- 5 results returned where the unit price is $7.50 or less.

/*
3. What are the products that we carry where we have no units on hand, but 1 or more
units are on backorder? Write a query that answers this question.
*/
SELECT *
FROM products
WHERE UnitsInStock = 0
	AND UnitsOnOrder > 0;
-- 1 result returned

/*
4. Examine the products table. How does it identify the type (category) of each item
sold? Where can you find a list of all categories? Write a set of queries to answer these
questions, ending with a query that creates a list of all the seafood items we carry.
*/
SELECT *
FROM products
WHERE CategoryID = ( -- identified by CategoryID
	SELECT CategoryID -- find the corresponding category
	FROM categories
	WHERE CategoryName LIKE '%seafood%'
);
/*
Find the corresponding CategoryID for seafood, and use that value to filter for seafood.
The list of categories are in the 'categories' table.
12 products were returned for 'Seafood'.
*/

/*
5. Examine the products table again. How do you know what supplier each product
comes from? Where can you find info on suppliers? Write a set of queries to find the
specific identifier for "Tokyo Traders" and then find all products from that supplier.
*/
SELECT *
FROM products
WHERE SupplierID = (
	SELECT SupplierID
    FROM suppliers
    WHERE CompanyName LIKE '%tokyo traders%'
);
/*
You can apply the same logic from seafood in question 4 and apply it to SupplierID for question 5.
Information on suppliers can be found in the 'suppliers' table.
3 products were found by 'Tokyo Traders'
*/

/*
6. How many employees work at northwind? What employees have "manager"
somewhere in their job title? Write queries to answer each question
*/
SELECT *
FROM employees;
-- There are 9 employees at NorthWind.

SELECT *
FROM employees
WHERE title LIKE '%manager%';
-- One employee: Steven Buchanan, Sales Manager