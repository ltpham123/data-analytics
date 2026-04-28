USE iowa_liquor_sales_database;

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales.csv'
INTO TABLE sales_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(sale_date, convenience_store, store, county_number, county, category, category_name,
 vendor_no, vendor, item, description, pack, liter_size,
 @state_btl_cost, @btl_price, bottle_qty, @total)
SET
state_btl_cost = NULLIF(REPLACE(REPLACE(@state_btl_cost, '$', ''), ',', ''), '\N'),
btl_price = NULLIF(REPLACE(REPLACE(@btl_price, '$', ''), ',', ''), '\N'),
total = NULLIF(REPLACE(REPLACE(@total, '$', ''), ',', ''), '\N');

CREATE TABLE sales_raw (
  sale_date TEXT,
  convenience_store TEXT,
  store TEXT,
  county_number TEXT,
  county TEXT,
  category TEXT,
  category_name TEXT,
  vendor_no TEXT,
  vendor TEXT,
  item TEXT,
  description TEXT,
  pack TEXT,
  liter_size TEXT,
  state_btl_cost TEXT,
  btl_price TEXT,
  bottle_qty TEXT,
  total TEXT
);

CREATE TABLE sales_clean (
  sale_date DATETIME,
  convenience_store VARCHAR(50),
  store INT,
  county_number INT,
  county VARCHAR(100),
  category INT,
  category_name VARCHAR(255),
  vendor_no INT,
  vendor VARCHAR(255),
  item INT,
  description VARCHAR(255),
  pack INT,
  liter_size INT,
  state_btl_cost DECIMAL(10,2),
  btl_price DECIMAL(10,2),
  bottle_qty INT,
  total DECIMAL(10,2)
);

SELECT *
FROM sales_raw;

SHOW COLUMNS FROM sales_raw LIKE 'description';

ALTER TABLE sales_raw
MODIFY description TEXT;

SELECT *
FROM sales_raw
WHERE store IS NULL
   OR item IS NULL
   OR total IS NULL;
   
/* Name: [Your Name]
Category/Vendor of Choice: [e.g., CANADIAN WHISKIES / Jim Beam Brands]
Instructions: Copy and paste the below questions into your script.
Below each question, write your response, including relevant SQL queries.
Make sure the questions and plain-language answers are commented out!
*/

SELECT *
FROM sales;
-- SELECT, Filtering & Sorting

-- 1. Create a list of all transactions for your chosen [Category/Vendor] that took place in
-- the last quarter of 2014, sorted by the total sale amount from highest to lowest.
-- (Strength: Identifying high-volume peak periods).

-- 2. Which transactions for your [Category/Vendor] had a bottle quantity greater than 12?
-- Display the date, store number, item description, and total amount.
-- (Strength: Identifying bulk buyers or wholesale-style transactions).

-- 3. Find all products in the products_table whose item_description contains a specific
-- keyword (e.g., 'Limited', 'Spiced'). What categories do they belong to?
-- (Opportunity: Identifying niche product variants).



-- Aggregation

-- 4. What is the total sales revenue and the average bottle price (btl_price) for
-- your chosen [Category/Vendor]?
-- (Strength/Baseline: Establishing the financial footprint).

-- 5. How many transactions were recorded for each specific item description within your
-- chosen [Category]? Which specific product is the most frequently purchased?
-- (Strength: Identifying your "hero" product).

-- 6. Which store generated the highest total revenue for your [Category/Vendor]?
-- Which generated the lowest (but still greater than zero)?
-- (Strength vs. Weakness: Identifying your best and worst retail partners).

-- 7. What is the total revenue for every vendor within your chosen [Category],
-- sorted from highest to lowest?
-- (Threat: Identifying your top competitors in that space).

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