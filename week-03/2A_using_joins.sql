USE northwind;

/*
1. Create a single query to list the product id, product name, unit price and category
name of all products. Order by category name and within that, by product name.
*/
SELECT ProductID, ProductName, UnitPrice, c.CategoryName
FROM products AS p
JOIN categories AS c
	ON p.CategoryID = c.CategoryID
ORDER BY p.CategoryID, ProductName;
-- 77 products with CategoryName drawn from 'categories' table

/*
2. Create a single query to list the product id, product name, unit price and supplier
name of all products that cost more than $75. Order by product name.
*/
SELECT ProductID, ProductName, UnitPrice, s.CompanyName
FROM products AS p
JOIN suppliers AS s
	ON p.SupplierID = s.SupplierID
WHERE UnitPrice > 75
ORDER BY ProductName;
-- 4 products with CompanyName drawn from 'suppliers' table

/*
3. Create a single query to list the product id, product name, unit price, category name,
and supplier name of every product. Order by product name.
*/
SELECT ProductID, ProductName, UnitPrice, c.CategoryName, s.CompanyName
FROM products AS p
JOIN categories AS c
	ON p.CategoryID = c.CategoryID
JOIN suppliers AS s
	ON p.SupplierID = s.SupplierID
ORDER BY ProductName;
-- Products ordered by product name with CategoryName and CompanyName included

/*
4. Create a single query to list the order id, ship name, ship address, and shipping
company name of every order that shipped to Germany. Assign the shipping company
name the alias ‘Shipper.’ Order by the name of the shipper, then the name of who it
shipped to.
*/
SELECT OrderID, ShipName, ShipAddress, s.CompanyName AS Shipper
FROM orders AS o
JOIN shippers AS s
	ON o.ShipVia = s.ShipperID
WHERE ShipCountry LIKE '%germany%'
ORDER BY Shipper, ShipName;

/*
5. Start from the same query as above (#4), but omit OrderID and add logic to group by
ship name, with a count of how many orders were shipped for that ship name.
*/
SELECT ShipName, ShipAddress, s.CompanyName AS Shipper, COUNT(*) AS OrdersShipped
FROM orders AS o
JOIN shippers AS s
	ON o.ShipVia = s.ShipperID
WHERE ShipCountry LIKE '%germany%'
GROUP BY ShipName, ShipAddress, Shipper
ORDER BY Shipper, ShipName;

/*
6. Create a single query to list the order id, order date, ship name, ship address of all
orders that included Sasquatch Ale.
*/
SELECT o.OrderID, OrderDate, ShipName, ShipAddress
FROM orders AS o
JOIN `order details` AS od -- Need to use 'back ticks' because 'order' is a keyword, change to literal
	ON o.OrderID = od.OrderID
JOIN products AS p
	ON od.ProductID = p.ProductID
WHERE p.ProductName LIKE '%quatch al%'; -- include product name 'Sasquatch Ale' with broad wildcard search