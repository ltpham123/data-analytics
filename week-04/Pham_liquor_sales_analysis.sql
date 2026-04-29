/*
SMILE	FOR		WHAT	GIVES		HAPPINESS	OR			LAUGHTER
SELECT	FROM	WHERE	GROUP BY	HAVING		ORDER BY	LIMIT
*/

USE iowa_liquor_sales_database;
/* Name: Longley Pham
Category/Vendor of Choice: Constellation
Instructions: Copy and paste the below questions into your script.
Below each question, write your response, including relevant SQL queries.
Make sure the questions and plain-language answers are commented out!
*/

-- SELECT, Filtering & Sorting

-- 1. Create a list of all transactions for your chosen [Category/Vendor] that took place in
-- the last quarter of 2014, sorted by the total sale amount from highest to lowest.
-- (Strength: Identifying high-volume peak periods).
/*
SELECT DISTINCT vendor
FROM sales;

SELECT *
FROM sales
WHERE vendor ILIKE '%conste%'
	AND "date" >= '2014-10-01'
	AND "date" < '2015-01-01'
ORDER BY total DESC;
*/

-- 2. Which transactions for your [Category/Vendor] had a bottle quantity greater than 12?
-- Display the date, store number, item description, and total amount.
-- (Strength: Identifying bulk buyers or wholesale-style transactions).
/*
SELECT date, store, description, total
FROM sales
WHERE vendor ILIKE '%conste%'
	AND bottle_qty > 12;
*/

-- 3. Find all products in the products_table whose item_description contains a specific
-- keyword (e.g., 'Limited', 'Spiced'). What categories do they belong to?
-- (Opportunity: Identifying niche product variants).
SELECT DISTINCT item_description
FROM products
WHERE -- vendor_name ILIKE '%conste%'
--	NOT
		(
		item_description ILIKE '%limited%' AS Limited
		OR item_description ILIKE '%spiced%' AS Spiced
	);
-- WHERE category_name ILIKE '%limited%'

SELECT
	CASE
		WHEN item_description ILIKE '%limited%' THEN 'Limited'
		WHEN item_description ILIKE '%spiced%' THEN 'Spiced'
		WHEN item_description ILIKE '%chocolate%' THEN 'Chocolate'
		WHEN (item_description ILIKE '%peach%'
			OR item_description ILIKE '%berry%'
			OR item_description ILIKE '%lemon%'
			OR item_description ILIKE '%limon%'
			OR item_description ILIKE '%cherry%'
			OR item_description ILIKE '%citrus%'
			OR item_description ILIKE '%citron%'
			OR item_description ILIKE '%grape%')
		THEN 'Fruit'
		WHEN item_description ILIKE '%peppermint%' THEN 'Peppermint'
		ELSE item_description
	END AS group_name,
	COUNT(*) AS total
FROM products
GROUP BY 1
ORDER BY total DESC;


-- Aggregation

-- 4. What is the total sales revenue and the average bottle price (btl_price) for
-- your chosen [Category/Vendor]?
-- (Strength/Baseline: Establishing the financial footprint).
/*
SELECT
CASE
	WHEN vendor ILIKE '%conste%' THEN 'Constellation Wine Company Inc'
		ELSE vendor
		END AS new_vendor,
SUM(total) :: money AS "Total Sales Revenue",
AVG(btl_price::numeric) :: money AS "Average Bottle Price"
FROM sales
WHERE vendor ILIKE '%conste%'
GROUP BY new_vendor;
*/

/* -- AI reviewed
SELECT
    'Constellation Wine Company Inc' AS vendor,
    SUM(total)::money AS "Total Sales Revenue",
    AVG(btl_price)::money AS "Average Bottle Price"
FROM sales
WHERE vendor ILIKE '%conste%';
*/

-- 5. How many transactions were recorded for each specific item description within your
-- chosen [Category]? Which specific product is the most frequently purchased?
-- (Strength: Identifying your "hero" product).
/*
SELECT description, COUNT(*) AS orders
FROM sales
WHERE vendor ILIKE '%Constellation Wine Company%'
GROUP BY description
ORDER BY 2 DESC;
-- In 2014, Black Velvet Canadian Whiskey was the most ordered Constellation Wine Company product.
*/

-- 6. Which store generated the highest total revenue for your [Category/Vendor]?
-- Which generated the lowest (but still greater than zero)?
-- (Strength vs. Weakness: Identifying your best and worst retail partners).
/*
SELECT stores.name, SUM(total)
FROM sales
JOIN stores
	ON sales.store = stores.store
WHERE sales.vendor ILIKE '%conste%'
GROUP BY stores.name
ORDER BY 2 ASC;
-- In 2014, Costco Wholesale #788 generated the highest revenue for Constellation Wine Company.
-- In 2014, Cubby's Sioux City generated the lowest revenue for Constellation Wine Company.
-- Explore why they are the highest/lowest revenue generator for Constellation Wine Company.
*/

-- 7. What is the total revenue for every vendor within your chosen [Category],
-- sorted from highest to lowest?
-- (Threat: Identifying your top competitors in that space).
-- Look for Beer, Wine, Spirits competitors:
-- Beer:	Constellation Brands, Diageo
-- Wine: 	Constellation Brands, Pernod Ricard, Moet Hennessy
-- Spirits:	Constellation Brands, Diageo, Pernod Ricard, Moet Hennessy, Jim Beam,
-- 			Bacardi, Sazerac Company, Sidney Frank Importing Co

SELECT DISTINCT category_name
FROM sales
-- WHERE vendor ILIKE '%conste%'

SELECT DISTINCT vendor_no, vendor, SUM(total)
FROM sales
WHERE (category_name ILIKE '%vodka%'
	OR category_name ILIKE '%brand%'
	OR category_name ILIKE '%tequila%'
	OR category_name ILIKE '%whisk%')
GROUP BY vendor_no, vendor
ORDER BY vendor_no;

SELECT
	CASE
		WHEN category_name ILIKE '%vodka%' THEN 'Vodka'
		WHEN category_name ILIKE '%brand%' THEN 'Brandy'
		WHEN category_name ILIKE '%tequila%' THEN 'Tequila'
		WHEN category_name ILIKE '%whisk%' THEN 'Whiskey'
		ELSE 'Other'
	END AS category,

	COUNT(DISTINCT vendor) AS "Vendor Name"
FROM sales
GROUP BY 1
ORDER BY 1;
	

SELECT DISTINCT vendor AS "Vodka Vendors", SUM(total)
FROM sales
WHERE category_name ILIKE '%vodka%'
GROUP BY 1
ORDER BY 2 DESC

SELECT DISTINCT vendor AS "Brandy Vendors", SUM(total)
FROM sales
WHERE category_name ILIKE '%brand%'
GROUP BY 1
ORDER BY 2 DESC

SELECT DISTINCT vendor AS "Tequila Vendors", SUM(total)
FROM sales
WHERE category_name ILIKE '%tequila%'
GROUP BY 1
ORDER BY 2 DESC

SELECT DISTINCT vendor AS "Whiskey Vendors", SUM(total)
FROM sales
WHERE category_name ILIKE '%whisk%'
GROUP BY 1
ORDER BY 2 DESC
-- 8. Which stores had total sales revenue for your [Category/Vendor] exceeding $2,000?
-- (Hint: Use HAVING to filter aggregated store totals).
-- (Strength: Pinpointing high-performing retail locations).



-- Joins

-- 9. Find all sales records where the category_name is either your chosen category
-- or a closely related competitor category (e.g., 'VODKA 80 PROOF' vs 'IMPORTED VODKA').
-- (Threat: Comparing performance against direct substitutes).

-- 10. List all transactions where the state bottle cost was between $10 and $20 for
-- your [Category/Vendor].
-- (Opportunity: Analyzing performance in the "mid-tier" price bracket).

-- 11. Write a query that displays each store's total sales for your [Category/Vendor]
-- along with the store's name and address from the stores_table.
-- (Strength: Mapping your physical sales footprint).

-- 12. For each sale in your [Category], display the transaction date, total amount,
-- and the population of the county where the sale occurred by joining with counties_table.
-- (Opportunity: Correlating sales volume with population density).

-- 13. Write a query that shows total sales for your [Category/Vendor] by county.
-- Which county generates the most revenue for you?
-- (Strength: Identifying your geographic stronghold).
/* SELECT county, SUM(total)
FROM sales JOIN counties
	USING(county)
WHERE category_name ILIKE '%lique%'
GROUP BY county;
*/
/*
SELECT county, SUM(total)
FROM sales JOIN counties
	USING(county)
WHERE vendor ILIKE '%conste%'
GROUP BY county
*/
/*
SELECT county, SUM(total)
FROM sales JOIN counties
	USING(county)
WHERE vendor ILIKE '%conste%'
GROUP BY county
ORDER BY 2 DESC
-- Polk generates the most revenue for our products.
-- Look into events or bars, congregation, population, to see why they generate a lot of revenue
*/

-- 14. Join the sales_table and products_table to show total revenue for your [Vendor]
-- alongside the proof and pack size of the items.
-- (Strength: Determining if higher proof or larger packs drive more revenue).

-- 15. Are there any counties in the counties_table that have a population over 10,000
-- but zero sales for your [Category/Vendor]?
-- (Opportunity: Identifying untapped markets).

-- 16. Display total revenue for your [Category/Vendor] grouped by the store_status
-- (from stores_table). Are active stores ('A') performing significantly better than others?
-- (Threat: Assessing the risk of sales tied to inactive or closed locations).



-- Subqueries

-- 17. Using a subquery, find all transactions for your [Category/Vendor] from stores
-- located in a specific high-growth city (e.g., 'Des Moines') found in the stores_table.
-- (Opportunity: Drilling down into urban market performance).

-- 18. Which stores had total sales for your [Category/Vendor] that were above the
-- average store revenue for that same group? (Hint: Use a subquery for the average).
-- (Strength: Identifying stores that are over-performing).

-- 19. Find the top 5 highest-grossing items for your [Vendor], then use a subquery
-- to look up their full details (like case_cost and proof) from the products_table.
-- (Strength: Deep-dive into the specs of your most profitable inventory).

-- 20. Write a query using a subquery to find all sales records for your [Category]
-- from stores that have an 'A' (Active) status in the stores_table.
-- (Strength: Filtering for reliable, ongoing revenue streams).