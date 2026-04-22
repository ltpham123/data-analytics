USE northwind;

/*
1. Write a query to find the price of the cheapest item that Northwind sells. Then write a
second query to find the name of the product that has that price.
*/
SELECT MIN(UnitPrice)
FROM products;

SELECT ProductName
FROM products
WHERE UnitPrice = (
	SELECT MIN(UnitPrice)
	FROM products
);

/*
2. Write a query to find the average price of all items that Northwind sells.
(Bonus: Once you have written a working query, try asking Claude or ChatGPT for help
using the ROUND function to round the average price to the nearest cent.)
*/
SELECT ROUND(AVG(UnitPrice), 2)
FROM products;

/*
3. Write a query to find the price of the most expensive item that Northwind sells. Then
write a second query to find the name of the product with that price, plus the name of
the supplier for that product.
*/
SELECT MAX(UnitPrice)
FROM products;

SELECT ProductName, s.CompanyName
FROM products AS p
JOIN suppliers AS s
	ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice = (
	SELECT MAX(UnitPrice)
    FROM products
);

/*
4. Write a query to find total monthly payroll (the sum of all the employees’ monthly
salaries).
*/
SELECT ROUND(SUM(Salary), 2)
FROM employees;

/*
5. Write a query to identify the highest salary and the lowest salary amounts which any
employee makes. (Just the amounts, not the specific employees!)
*/
SELECT ROUND(MAX(Salary), 2) AS MaxSalary, ROUND(MIN(Salary), 2) AS MinSalary
FROM employees;

/*
6. Write a query to find the name and supplier ID of each supplier and the number of
items they supply. Hint: Join is your friend here.
*/
SELECT s.CompanyName, s.SupplierID, COUNT(DISTINCT p.ProductName) AS NumberOfItems
FROM suppliers AS s
JOIN products AS p
	ON s.SupplierID = p.SupplierID
GROUP BY s.CompanyName, s.SupplierID;

/*
7. Write a query to find the list of all category names and the average price for items in
each category.
*/
SELECT c.CategoryName, ROUND(AVG(UnitPrice), 2)
FROM products AS p
JOIN categories AS c
	ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

/*
8. Write a query to find, for all suppliers that provide at least 5 items to Northwind, what
is the name of each supplier and the number of items they supply.
*/
SELECT s.CompanyName, COUNT(p.ProductID) AS NumOfItems
FROM suppliers AS s
JOIN products AS p
	ON s.SupplierID = p.SupplierID
GROUP BY s.CompanyName
HAVING NumOfItems >= 5;

/*
9. Write a query to list products currently in inventory by the product id, product name,
and inventory value (calculated by multiplying unit price by the number of units on
hand). Sort the results in descending order by value. If two or more have the same
value, order by product name. If a product is not in stock, leave it off the list.
*/
SELECT ProductID, ProductName, (UnitPrice * UnitsInStock) AS InventoryValue
FROM products
WHERE UnitsInStock > 0
ORDER BY InventoryValue DESC, ProductName;