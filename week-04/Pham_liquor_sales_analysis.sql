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
/*
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
*/



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
/*
SELECT DISTINCT category_name
FROM sales
WHERE vendor ILIKE '%conste%';

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
*/

-- 8. Which stores had total sales revenue for your [Category/Vendor] exceeding $2,000?
-- (Hint: Use HAVING to filter aggregated store totals).
-- (Strength: Pinpointing high-performing retail locations).
/*
SELECT store, SUM(total) AS revenue
FROM sales
WHERE vendor ILIKE '%conste%'
GROUP BY 1
HAVING SUM(total) > 2000
ORDER BY 2 DESC
-- Include County, and identify hotspots
*/



-- Joins

-- 9. Find all sales records where the category_name is either your chosen category
-- or a closely related competitor category (e.g., 'VODKA 80 PROOF' vs 'IMPORTED VODKA').
-- (Threat: Comparing performance against direct substitutes).
/*
SELECT DISTINCT category_name
FROM sales
WHERE vendor ILIKE '%conste%';

SELECT DISTINCT vendor_no, vendor, SUM(total)
FROM sales
WHERE (category_name ILIKE '%vodka%'
	OR category_name ILIKE '%brand%'
	OR category_name ILIKE '%tequila%'
	OR category_name ILIKE '%whisk%')
GROUP BY vendor_no, vendor
ORDER BY vendor_no;
*/

-- 10. List all transactions where the state bottle cost was between $10 and $20 for
-- your [Category/Vendor].
-- (Opportunity: Analyzing performance in the "mid-tier" price bracket).
/*
SELECT *
FROM sales
WHERE state_btl_cost::numeric BETWEEN 10 AND 20
-- Create tier brackets, <10, 10-25, 25-35, 35-50, 50+
*/

-- 11. Write a query that displays each store's total sales for your [Category/Vendor]
-- along with the store's name and address from the stores_table.
-- (Strength: Mapping your physical sales footprint).
/*
SELECT stores.name, stores.store_address, SUM(total)
FROM sales
JOIN stores
	ON sales.store = stores.store
WHERE vendor ILIKE '%conste%'
GROUP BY stores.name, stores.store_address
*/

-- 12. For each sale in your [Category], display the transaction date, total amount,
-- and the population of the county where the sale occurred by joining with counties_table.
-- (Opportunity: Correlating sales volume with population density).
/*
SELECT date, sales.county, counties.population, total
FROM sales
JOIN counties
	ON sales.county = counties.county
WHERE vendor ILIKE '%conste%'
-- aggregate further by county, then total/population to find average spending per person
*/

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
/*
SELECT *
FROM sales
WHERE vendor ILIKE '%conste%'

SELECT *
FROM products

SELECT products.proof, sales.pack, SUM(total) :: money
FROM sales
JOIN products
	ON sales.item = products.item_no
WHERE sales.vendor ILIKE '%conste%'
GROUP BY products.proof, sales.pack
ORDER BY 1 DESC, 2 DESC
*/

-- 15. Are there any counties in the counties_table that have a population over 10,000
-- but zero sales for your [Category/Vendor]?
-- (Opportunity: Identifying untapped markets).
/*
SELECT sales.county, SUM(total)
FROM sales
JOIN counties
	ON sales.county = counties.county
WHERE sales.vendor ILIKE '%conste%'
	AND counties.population > 10000
GROUP BY sales.county
ORDER BY 2 DESC
-- Helps cut small sample sizes out for analysis; perhaps see if the sample that is cut off have any anomalies
*/

-- 16. Display total revenue for your [Category/Vendor] grouped by the store_status
-- (from stores_table). Are active stores ('A') performing significantly better than others?
-- (Threat: Assessing the risk of sales tied to inactive or closed locations).
/*
SELECT stores.store_status, SUM(total)
FROM sales
JOIN stores
	ON sales.store = stores.store
WHERE sales.vendor ILIKE '%conste%'
GROUP BY stores.store_status
-- All stores that sell Constellation products are active.

-- SELECT COUNT(stores.store), stores.store_status
-- FROM sales
-- JOIN stores
-- 	ON sales.store = stores.store
-- WHERE sales.vendor ILIKE '%conste%'
-- GROUP BY stores.store_status
-- Verify that all stores are active
*/



-- Subqueries

-- 17. Using a subquery, find all transactions for your [Category/Vendor] from stores
-- located in a specific high-growth city (e.g., 'Des Moines') found in the stores_table.
-- (Opportunity: Drilling down into urban market performance).
-- AI assisted to generate repetitive CASE fields
/*
SELECT
	CASE
	    WHEN store_address ILIKE '%des moines%' THEN 'Des Moines'
	    WHEN store_address ILIKE '%cedar falls%' THEN 'Cedar Falls'
	    WHEN store_address ILIKE '%cedar rapids%' THEN 'Cedar Rapids'
	    WHEN store_address ILIKE '%davenport%' THEN 'Davenport'
	    WHEN store_address ILIKE '%iowa city%' THEN 'Iowa City'
	    WHEN store_address ILIKE '%ames%' THEN 'Ames'
	    WHEN store_address ILIKE '%waterloo%' THEN 'Waterloo'
	    WHEN store_address ILIKE '%council bluffs%' THEN 'Council Bluffs'
	    WHEN store_address ILIKE '%sioux city%' THEN 'Sioux City'
	    WHEN store_address ILIKE '%dubuque%' THEN 'Dubuque'
	    WHEN store_address ILIKE '%marion%' THEN 'Marion'
	    WHEN store_address ILIKE '%coralville%' THEN 'Coralville'
	    WHEN store_address ILIKE '%clive%' THEN 'Clive'
	    WHEN store_address ILIKE '%waukee%' THEN 'Waukee'
	    WHEN store_address ILIKE '%ankeny%' THEN 'Ankeny'
	    WHEN store_address ILIKE '%urbandale%' THEN 'Urbandale'
	    WHEN store_address ILIKE '%johnston%' THEN 'Johnston'
	    WHEN store_address ILIKE '%bettendorf%' THEN 'Bettendorf'
	    WHEN store_address ILIKE '%altoona%' THEN 'Altoona'
	    WHEN store_address ILIKE '%grimes%' THEN 'Grimes'
	    WHEN store_address ILIKE '%pleasant hill%' THEN 'Pleasant Hill'
	    WHEN store_address ILIKE '%north liberty%' THEN 'North Liberty'
	    WHEN store_address ILIKE '%marshalltown%' THEN 'Marshalltown'
	    WHEN store_address ILIKE '%mason city%' THEN 'Mason City'
	    WHEN store_address ILIKE '%fort dodge%' THEN 'Fort Dodge'
	    WHEN store_address ILIKE '%muscatine%' THEN 'Muscatine'
	    WHEN store_address ILIKE '%ottumwa%' THEN 'Ottumwa'
	    WHEN store_address ILIKE '%burlington%' THEN 'Burlington'
	    WHEN store_address ILIKE '%clinton%' THEN 'Clinton'
	    WHEN store_address ILIKE '%decorah%' THEN 'Decorah'
	    WHEN store_address ILIKE '%spencer%' THEN 'Spencer'
	    WHEN store_address ILIKE '%storm lake%' THEN 'Storm Lake'
	    WHEN store_address ILIKE '%ackley%' THEN 'Ackley'
	    WHEN store_address ILIKE '%adair%' THEN 'Adair'
	    WHEN store_address ILIKE '%afton%' THEN 'Afton'
	    WHEN store_address ILIKE '%akron%' THEN 'Akron'
	    WHEN store_address ILIKE '%alden%' THEN 'Alden'
	    WHEN store_address ILIKE '%algona%' THEN 'Algona'
	    WHEN store_address ILIKE '%allison%' THEN 'Allison'
	    WHEN store_address ILIKE '%alta%' THEN 'Alta'
	    WHEN store_address ILIKE '%alta vista%' THEN 'Alta Vista'
	    WHEN store_address ILIKE '%alton%' THEN 'Alton'
	    WHEN store_address ILIKE '%anamosa%' THEN 'Anamosa'
	    WHEN store_address ILIKE '%anita%' THEN 'Anita'
	    WHEN store_address ILIKE '%arlinton%' THEN 'Arlington'
	    WHEN store_address ILIKE '%armstrong%' THEN 'Armstrong'
	    WHEN store_address ILIKE '%atlantic%' THEN 'Atlantic'
	    WHEN store_address ILIKE '%audubon%' THEN 'Audubon'
	    WHEN store_address ILIKE '%aurelia%' THEN 'Aurelia'
	    WHEN store_address ILIKE '%avoca%' THEN 'Avoca'
	    WHEN store_address ILIKE '%bancroft%' THEN 'Bancroft'
	    WHEN store_address ILIKE '%baxter%' THEN 'Baxter'
	    WHEN store_address ILIKE '%bedford%' THEN 'Bedford'
	    WHEN store_address ILIKE '%belle plaine%' THEN 'Belle Plaine'
	    WHEN store_address ILIKE '%bellevue%' THEN 'Bellevue'
	    WHEN store_address ILIKE '%belmond%' THEN 'Belmond'
	    WHEN store_address ILIKE '%benton%' THEN 'Bettendorf'
	    WHEN store_address ILIKE '%bloomfield%' THEN 'Bloomfield'
	    WHEN store_address ILIKE '%blue grass%' THEN 'Blue Grass'
	    WHEN store_address ILIKE '%boone%' THEN 'Boone'
	    WHEN store_address ILIKE '%bondurant%' THEN 'Bondurant'
	    WHEN store_address ILIKE '%brooklyn%' THEN 'Brooklyn'
	    WHEN store_address ILIKE '%buffalo center%' THEN 'Buffalo Center'
	    WHEN store_address ILIKE '%burlington%' THEN 'Burlington'
	    WHEN store_address ILIKE '%bussey%' THEN 'Bussey'
	    WHEN store_address ILIKE '%camanche%' THEN 'Camanche'
	    WHEN store_address ILIKE '%cambridge%' THEN 'Cambridge'
	    WHEN store_address ILIKE '%carroll%' THEN 'Carroll'
	    WHEN store_address ILIKE '%cascade%' THEN 'Cascade'
	    WHEN store_address ILIKE '%casey%' THEN 'Casey'
	    WHEN store_address ILIKE '%center point%' THEN 'Center Point'
	    WHEN store_address ILIKE '%centerville%' THEN 'Centerville'
	    WHEN store_address ILIKE '%central city%' THEN 'Central City'
	    WHEN store_address ILIKE '%chariton%' THEN 'Chariton'
	    WHEN store_address ILIKE '%charles city%' THEN 'Charles City'
	    WHEN store_address ILIKE '%cherokee%' THEN 'Cherokee'
	    WHEN store_address ILIKE '%clarinda%' THEN 'Clarinda'
	    WHEN store_address ILIKE '%clarion%' THEN 'Clarion'
	    WHEN store_address ILIKE '%clarksville%' THEN 'Clarksville'
	    WHEN store_address ILIKE '%clear lake%' THEN 'Clear Lake'
	    WHEN store_address ILIKE '%clermont%' THEN 'Clermont'
	    WHEN store_address ILIKE '%clermont%' THEN 'Clermont'
	    WHEN store_address ILIKE '%colfax%' THEN 'Colfax'
	    WHEN store_address ILIKE '%colo%' THEN 'Colo'
	    WHEN store_address ILIKE '%columbus junction%' THEN 'Columbus Junction'
	    WHEN store_address ILIKE '%conrad%' THEN 'Conrad'
	    WHEN store_address ILIKE '%corning%' THEN 'Corning'
	    WHEN store_address ILIKE '%corydon%' THEN 'Corydon'
	    WHEN store_address ILIKE '%crescent%' THEN 'Crescent'
	    WHEN store_address ILIKE '%cresco%' THEN 'Cresco'
	    WHEN store_address ILIKE '%creston%' THEN 'Creston'
	    WHEN store_address ILIKE '%cumming%' THEN 'Cumming'
	    WHEN store_address ILIKE '%dakota city%' THEN 'Dakota City'
	    WHEN store_address ILIKE '%danville%' THEN 'Danville'
	    WHEN store_address ILIKE '%dayton%' THEN 'Dayton'
	    WHEN store_address ILIKE '%decorah%' THEN 'Decorah'
	    WHEN store_address ILIKE '%de soto%' THEN 'De Soto'
	    WHEN store_address ILIKE '%de witt%' THEN 'De Witt'
	    WHEN store_address ILIKE '%denison%' THEN 'Denison'
	    WHEN store_address ILIKE '%denver%' THEN 'Denver'
	    WHEN store_address ILIKE '%des moines%' THEN 'Des Moines'
	    WHEN store_address ILIKE '%dyersville%' THEN 'Dyersville'
	    WHEN store_address ILIKE '%dysart%' THEN 'Dysart'
	    WHEN store_address ILIKE '%eagle grove%' THEN 'Eagle Grove'
	    WHEN store_address ILIKE '%earlham%' THEN 'Earlham'
	    WHEN store_address ILIKE '%early%' THEN 'Early'
	    WHEN store_address ILIKE '%eldora%' THEN 'Eldora'
	    WHEN store_address ILIKE '%eldon%' THEN 'Eldon'
	    WHEN store_address ILIKE '%eldridge%' THEN 'Eldridge'
	    WHEN store_address ILIKE '%elkader%' THEN 'Elkader'
	    WHEN store_address ILIKE '%elma%' THEN 'Elma'
	    WHEN store_address ILIKE '%emmetsburg%' THEN 'Emmetsburg'
	    WHEN store_address ILIKE '%estherville%' THEN 'Estherville'
	    WHEN store_address ILIKE '%evansdale%' THEN 'Evansdale'
	    WHEN store_address ILIKE '%exira%' THEN 'Exira'
	    WHEN store_address ILIKE '%fairbank%' THEN 'Fairbank'
	    WHEN store_address ILIKE '%fairfax%' THEN 'Fairfax'
	    WHEN store_address ILIKE '%farmington%' THEN 'Farmington'
	    WHEN store_address ILIKE '%fayette%' THEN 'Fayette'
	    WHEN store_address ILIKE '%floyd%' THEN 'Floyd'
	    WHEN store_address ILIKE '%fonda%' THEN 'Fonda'
	    WHEN store_address ILIKE '%fontanelle%' THEN 'Fontanelle'
	    WHEN store_address ILIKE '%forest city%' THEN 'Forest City'
	    WHEN store_address ILIKE '%fort atkinson%' THEN 'Fort Atkinson'
	    WHEN store_address ILIKE '%fort dodge%' THEN 'Fort Dodge'
	    WHEN store_address ILIKE '%fort madison%' THEN 'Fort Madison'
	    WHEN store_address ILIKE '%fredericksburg%' THEN 'Fredericksburg'
	    WHEN store_address ILIKE '%garner%' THEN 'Garner'
	    WHEN store_address ILIKE '%george%' THEN 'George'
	    WHEN store_address ILIKE '%gilmore city%' THEN 'Gilmore City'
	    WHEN store_address ILIKE '%glidden%' THEN 'Glidden'
	    WHEN store_address ILIKE '%goldfield%' THEN 'Goldfield'
	    WHEN store_address ILIKE '%gowrie%' THEN 'Gowrie'
	    WHEN store_address ILIKE '%graettinger%' THEN 'Graettinger'
	    WHEN store_address ILIKE '%grand junction%' THEN 'Grand Junction'
	    WHEN store_address ILIKE '%grand mound%' THEN 'Grand Mound'
	    WHEN store_address ILIKE '%granger%' THEN 'Granger'
	    WHEN store_address ILIKE '%grinnell%' THEN 'Grinnell'
	    WHEN store_address ILIKE '%griswold%' THEN 'Griswold'
	    WHEN store_address ILIKE '%grundy center%' THEN 'Grundy Center'
	    WHEN store_address ILIKE '%guthrie center%' THEN 'Guthrie Center'
	    WHEN store_address ILIKE '%hamilton%' THEN 'Hamilton'
	    WHEN store_address ILIKE '%hampton%' THEN 'Hampton'
	    WHEN store_address ILIKE '%harlan%' THEN 'Harlan'
	    WHEN store_address ILIKE '%harris%' THEN 'Harris'
	    WHEN store_address ILIKE '%hartley%' THEN 'Hartley'
	    WHEN store_address ILIKE '%hawarden%' THEN 'Hawarden'
	    WHEN store_address ILIKE '%humboldt%' THEN 'Humboldt'
	    WHEN store_address ILIKE '%huxley%' THEN 'Huxley'
	    WHEN store_address ILIKE '%ida grove%' THEN 'Ida Grove'
	    WHEN store_address ILIKE '%independence%' THEN 'Independence'
	    WHEN store_address ILIKE '%indianola%' THEN 'Indianola'
	    WHEN store_address ILIKE '%inwood%' THEN 'Inwood'
	    WHEN store_address ILIKE '%iowa falls%' THEN 'Iowa Falls'
	    WHEN store_address ILIKE '%jefferson%' THEN 'Jefferson'
	    WHEN store_address ILIKE '%jesup%' THEN 'Jesup'
	    WHEN store_address ILIKE '%keokuk%' THEN 'Keokuk'
	    WHEN store_address ILIKE '%keosauqua%' THEN 'Keosauqua'
	    WHEN store_address ILIKE '%keota%' THEN 'Keota'
	    WHEN store_address ILIKE '%knoxville%' THEN 'Knoxville'
	    WHEN store_address ILIKE '%la porte city%' THEN 'La Porte City'
	    WHEN store_address ILIKE '%lake city%' THEN 'Lake City'
	    WHEN store_address ILIKE '%lake mills%' THEN 'Lake Mills'
	    WHEN store_address ILIKE '%lamoni%' THEN 'Lamoni'
	    WHEN store_address ILIKE '%lansing%' THEN 'Lansing'
	    WHEN store_address ILIKE '%larchwood%' THEN 'Larchwood'
	    WHEN store_address ILIKE '%laurens%' THEN 'Laurens'
	    WHEN store_address ILIKE '%le mars%' THEN 'Le Mars'
	    WHEN store_address ILIKE '%leclaire%' THEN 'Leclaire'
	    WHEN store_address ILIKE '%lenox%' THEN 'Lenox'
	    WHEN store_address ILIKE '%leon%' THEN 'Leon'
	    WHEN store_address ILIKE '%lisa%' THEN 'Lisbon'
	    WHEN store_address ILIKE '%logn%' THEN 'Logan'
	    WHEN store_address ILIKE '%madrid%' THEN 'Madrid'
	    WHEN store_address ILIKE '%malvern%' THEN 'Malvern'
	    WHEN store_address ILIKE '%manchester%' THEN 'Manchester'
	    WHEN store_address ILIKE '%manning%' THEN 'Manning'
	    WHEN store_address ILIKE '%manson%' THEN 'Manson'
	    WHEN store_address ILIKE '%maquoketa%' THEN 'Maquoketa'
	    WHEN store_address ILIKE '%marengo%' THEN 'Marengo'
	    WHEN store_address ILIKE '%marion%' THEN 'Marion'
	    WHEN store_address ILIKE '%marshalltown%' THEN 'Marshalltown'
	    WHEN store_address ILIKE '%martensdale%' THEN 'Martensdale'
	    WHEN store_address ILIKE '%mason city%' THEN 'Mason City'
	    WHEN store_address ILIKE '%maxwell%' THEN 'Maxwell'
	    WHEN store_address ILIKE '%mediapolis%' THEN 'Mediapolis'
	    WHEN store_address ILIKE '%melcher%' THEN 'Melcher-Dallas'
	    WHEN store_address ILIKE '%merrill%' THEN 'Merrill'
	    WHEN store_address ILIKE '%milford%' THEN 'Milford'
	    WHEN store_address ILIKE '%missouri valley%' THEN 'Missouri Valley'
	    WHEN store_address ILIKE '%monona%' THEN 'Monona'
	    WHEN store_address ILIKE '%monroe%' THEN 'Monroe'
	    WHEN store_address ILIKE '%montezuma%' THEN 'Montezuma'
	    WHEN store_address ILIKE '%monticello%' THEN 'Monticello'
	    WHEN store_address ILIKE '%montrose%' THEN 'Montrose'
	    WHEN store_address ILIKE '%moravia%' THEN 'Moravia'
	    WHEN store_address ILIKE '%mount ayr%' THEN 'Mount Ayr'
	    WHEN store_address ILIKE '%mount pleasant%' THEN 'Mount Pleasant'
	    WHEN store_address ILIKE '%mount vernon%' THEN 'Mount Vernon'
	    WHEN store_address ILIKE '%muscatine%' THEN 'Muscatine'
	    WHEN store_address ILIKE '%nashua%' THEN 'Nashua'
	    WHEN store_address ILIKE '%nevada%' THEN 'Nevada'
	    WHEN store_address ILIKE '%new hampton%' THEN 'New Hampton'
	    WHEN store_address ILIKE '%new sharon%' THEN 'New Sharon'
	    WHEN store_address ILIKE '%new virginia%' THEN 'New Virginia'
	    WHEN store_address ILIKE '%newton%' THEN 'Newton'
	    WHEN store_address ILIKE '%nora springs%' THEN 'Nora Springs'
	    WHEN store_address ILIKE '%norwalk%' THEN 'Norwalk'
	    WHEN store_address ILIKE '%north english%' THEN 'North English'
	    WHEN store_address ILIKE '%north liberty%' THEN 'North Liberty'
	    WHEN store_address ILIKE '%northwood%' THEN 'Northwood'
	    WHEN store_address ILIKE '%oakland%' THEN 'Oakland'
	    WHEN store_address ILIKE '%okoboji%' THEN 'Okoboji'
	    WHEN store_address ILIKE '%onawa%' THEN 'Onawa'
	    WHEN store_address ILIKE '%orange city%' THEN 'Orange City'
	    WHEN store_address ILIKE '%osage%' THEN 'Osage'
	    WHEN store_address ILIKE '%osceola%' THEN 'Osceola'
	    WHEN store_address ILIKE '%oskaloosa%' THEN 'Oskaloosa'
	    WHEN store_address ILIKE '%ossian%' THEN 'Ossian'
	    WHEN store_address ILIKE '%otho%' THEN 'Otho'
	    WHEN store_address ILIKE '%ottumwa%' THEN 'Ottumwa'
	    WHEN store_address ILIKE '%panora%' THEN 'Panora'
	    WHEN store_address ILIKE '%parkersburg%' THEN 'Parkersburg'
	    WHEN store_address ILIKE '%paullina%' THEN 'Paullina'
	    WHEN store_address ILIKE '%pella%' THEN 'Pella'
	    WHEN store_address ILIKE '%peosta%' THEN 'Peosta'
	    WHEN store_address ILIKE '%perry%' THEN 'Perry'
	    WHEN store_address ILIKE '%pleasant hill%' THEN 'Pleasant Hill'
	    WHEN store_address ILIKE '%pleasantville%' THEN 'Pleasantville'
	    WHEN store_address ILIKE '%polk city%' THEN 'Polk City'
	    WHEN store_address ILIKE '%pomeroy%' THEN 'Pomeroy'
	    WHEN store_address ILIKE '%postville%' THEN 'Postville'
	    WHEN store_address ILIKE '%prairie city%' THEN 'Prairie City'
	    WHEN store_address ILIKE '%preston%' THEN 'Preston'
	    WHEN store_address ILIKE '%primghar%' THEN 'Primghar'
	    WHEN store_address ILIKE '%princeton%' THEN 'Princeton'
	    WHEN store_address ILIKE '%red oak%' THEN 'Red Oak'
	    WHEN store_address ILIKE '%reinbeck%' THEN 'Reinbeck'
	    WHEN store_address ILIKE '%riceville%' THEN 'Riceville'
	    WHEN store_address ILIKE '%riverside%' THEN 'Riverside'
	    WHEN store_address ILIKE '%rock rapids%' THEN 'Rock Rapids'
	    WHEN store_address ILIKE '%rock valley%' THEN 'Rock Valley'
	    WHEN store_address ILIKE '%rockwell city%' THEN 'Rockwell City'
	    WHEN store_address ILIKE '%rolfe%' THEN 'Rolfe'
	    WHEN store_address ILIKE '%ruthven%' THEN 'Ruthven'
	    WHEN store_address ILIKE '%sac city%' THEN 'Sac City'
	    WHEN store_address ILIKE '%sanborn%' THEN 'Sanborn'
	    WHEN store_address ILIKE '%schaller%' THEN 'Schaller'
	    WHEN store_address ILIKE '%schleswig%' THEN 'Schleswig'
	    WHEN store_address ILIKE '%scranton%' THEN 'Scranton'
	    WHEN store_address ILIKE '%sergeant bluff%' THEN 'Sergeant Bluff'
	    WHEN store_address ILIKE '%sibley%' THEN 'Sibley'
	    WHEN store_address ILIKE '%sigourney%' THEN 'Sigourney'
	    WHEN store_address ILIKE '%sioux center%' THEN 'Sioux Center'
	    WHEN store_address ILIKE '%sioux rapids%' THEN 'Sioux Rapids'
	    WHEN store_address ILIKE '%sioux city%' THEN 'Sioux City'
	    WHEN store_address ILIKE '%sloan%' THEN 'Sloan'
	    WHEN store_address ILIKE '%solon%' THEN 'Solon'
	    WHEN store_address ILIKE '%spencer%' THEN 'Spencer'
	    WHEN store_address ILIKE '%spirit lake%' THEN 'Spirit Lake'
	    WHEN store_address ILIKE '%springville%' THEN 'Springville'
	    WHEN store_address ILIKE '%st charles%' THEN 'St Charles'
	    WHEN store_address ILIKE '%st lucas%' THEN 'St Lucas'
	    WHEN store_address ILIKE '%stanwood%' THEN 'Stanwood'
	    WHEN store_address ILIKE '%state center%' THEN 'State Center'
	    WHEN store_address ILIKE '%storm lake%' THEN 'Storm Lake'
	    WHEN store_address ILIKE '%story city%' THEN 'Story City'
	    WHEN store_address ILIKE '%strawberry point%' THEN 'Strawberry Point'
	    WHEN store_address ILIKE '%stuart%' THEN 'Stuart'
	    WHEN store_address ILIKE '%sully%' THEN 'Sully'
	    WHEN store_address ILIKE '%sumner%' THEN 'Sumner'
	    WHEN store_address ILIKE '%sutherland%' THEN 'Sutherland'
	    WHEN store_address ILIKE '%swea city%' THEN 'Swea City'
	    WHEN store_address ILIKE '%swisher%' THEN 'Swisher'
	    WHEN store_address ILIKE '%tiffin%' THEN 'Tiffin'
	    WHEN store_address ILIKE '%tipton%' THEN 'Tipton'
	    WHEN store_address ILIKE '%toledo%' THEN 'Toledo'
	    WHEN store_address ILIKE '%traer%' THEN 'Traer'
	    WHEN store_address ILIKE '%treynor%' THEN 'Treynor'
	    WHEN store_address ILIKE '%tripoli%' THEN 'Tripoli'
	    WHEN store_address ILIKE '%urbana%' THEN 'Urbana'
	    WHEN store_address ILIKE '%van meter%' THEN 'Van Meter'
	    WHEN store_address ILIKE '%villisca%' THEN 'Villisca'
	    WHEN store_address ILIKE '%vinton%' THEN 'Vinton'
	    WHEN store_address ILIKE '%wapello%' THEN 'Wapello'
	    WHEN store_address ILIKE '%washington%' THEN 'Washington'
	    WHEN store_address ILIKE '%waterloo%' THEN 'Waterloo'
	    WHEN store_address ILIKE '%waukee%' THEN 'Waukee'
	    WHEN store_address ILIKE '%waukon%' THEN 'Waukon'
	    WHEN store_address ILIKE '%waverly%' THEN 'Waverly'
	    WHEN store_address ILIKE '%webster city%' THEN 'Webster City'
	    WHEN store_address ILIKE '%wellman%' THEN 'Wellman'
	    WHEN store_address ILIKE '%wellsburg%' THEN 'Wellsburg'
	    WHEN store_address ILIKE '%west bend%' THEN 'West Bend'
	    WHEN store_address ILIKE '%west branch%' THEN 'West Branch'
	    WHEN store_address ILIKE '%west liberty%' THEN 'West Liberty'
	    WHEN store_address ILIKE '%west union%' THEN 'West Union'
	    WHEN store_address ILIKE '%west point%' THEN 'West Point'
	    WHEN store_address ILIKE '%whittemore%' THEN 'Whittemore'
	    WHEN store_address ILIKE '%williamsburg%' THEN 'Williamsburg'
	    WHEN store_address ILIKE '%wilton%' THEN 'Wilton'
	    WHEN store_address ILIKE '%winthrop%' THEN 'Winthrop'
	    WHEN store_address ILIKE '%winterset%' THEN 'Winterset'
	    WHEN store_address ILIKE '%woodbine%' THEN 'Woodbine'
	    WHEN store_address ILIKE '%woodward%' THEN 'Woodward'
	    WHEN store_address ILIKE '%zwingle%' THEN 'Zwingle'
    	ELSE store_address
		END AS cities,
	SUM(counties.population)
FROM sales
JOIN stores ON sales.store = stores.store
JOIN counties ON sales.county = counties.county
GROUP BY 1
ORDER BY 2 DESC

SELECT *
FROM counties
LIMIT 1
*/
-- 18. Which stores had total sales for your [Category/Vendor] that were above the
-- average store revenue for that same group? (Hint: Use a subquery for the average).
-- (Strength: Identifying stores that are over-performing).
/*
SELECT stores.name, SUM(sales.total)
FROM sales
JOIN stores ON sales.store = stores.store
WHERE vendor ILIKE '%conste%'
GROUP BY stores.name
HAVING SUM(sales.total) > (
	SELECT AVG(individual_store_avg)
	FROM (
		SELECT AVG(sales.total) AS individual_store_avg
		FROM sales
		WHERE sales.vendor ILIKE '%conste%'
		GROUP BY sales.store
	) t -- AI assisted
)
*/

-- 19. Find the top 5 highest-grossing items for your [Vendor], then use a subquery
-- to look up their full details (like case_cost and proof) from the products_table.
-- (Strength: Deep-dive into the specs of your most profitable inventory).
/*
SELECT *
FROM products
WHERE item_no IN (
	SELECT sales.item
	FROM sales
	WHERE sales.vendor ILIKE '%conste%'
	GROUP BY sales.item
	ORDER BY SUM(sales.total) DESC
	LIMIT 5
)
*/

-- 20. Write a query using a subquery to find all sales records for your [Category]
-- from stores that have an 'A' (Active) status in the stores_table.
-- (Strength: Filtering for reliable, ongoing revenue streams).
/*
-- Subquery
SELECT *
FROM sales
WHERE vendor ILIKE '%conste%'
	AND store IN (
		SELECT store
		FROM stores
		WHERE store_status = 'A'
);

-- With Joins
SELECT *
FROM sales
JOIN stores ON sales.store = stores.store
WHERE stores.store_status = 'A'
	AND vendor ILIKE '%conste%'
*/