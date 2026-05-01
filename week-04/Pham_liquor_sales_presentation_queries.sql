-- Longley Pham
-- Capstone 1
-- Presentation Queries

USE iowa_liquor_sales_database;
-- Graphs

-- ///////////////////////////////
-- //////////// Sales ////////////
-- ///////////////////////////////

-- By category
SELECT 
    CASE
        WHEN category_name ILIKE '%whisk%' THEN 'Whiskies'
        WHEN category_name ILIKE '%vodka%' THEN 'Vodka'
        WHEN category_name ILIKE '%brand%' THEN 'Brandies'
        WHEN category_name ILIKE '%tequila%' THEN 'Tequila'
        ELSE 'Other'
    END AS category_group,
    SUM(total) AS revenue
FROM sales
WHERE vendor ILIKE '%conste%'
  AND date >= '2014-01-01'
  AND date < '2015-01-01'
GROUP BY category_group
ORDER BY revenue DESC;

-- By product
SELECT 
    description,
    SUM(total) AS revenue
FROM sales
WHERE vendor ILIKE '%conste%'
  AND date >= '2014-01-01'
  AND date < '2015-01-01'
GROUP BY description
ORDER BY revenue DESC
LIMIT 10;

-- By revenue
SELECT 
    county,
    SUM(total) AS revenue
FROM sales
JOIN counties USING(county)
WHERE vendor ILIKE '%conste%'
  AND sales.date >= '2014-01-01'
  AND sales.date < '2015-01-01'
  AND population > 10000
GROUP BY county
ORDER BY revenue DESC;

-- Revenue by capita
SELECT 
    county,
    SUM(total) AS revenue,
    MAX(population) AS population,
    SUM(total) / MAX(population) AS revenue_per_capita
FROM sales
JOIN counties USING(county)
WHERE vendor ILIKE '%conste%'
  AND sales.date >= '2014-01-01'
  AND sales.date < '2015-01-01'
  AND population > 10000
GROUP BY county
ORDER BY revenue_per_capita DESC;



-- Context
/*
	-- Time Period (14 months, 2014-01-01 to 2015-02-01)
	SELECT DISTINCT
		DATE_TRUNC('month', "date") AS month
	FROM sales
	ORDER BY month;
	-- Important because all sales will be for the year 2014, no 2015.

	-- Over 2.7 million sales in Iowa overall
	SELECT *
	FROM sales
	WHERE "date" >= '2014-01-01'
		AND "date" < '2015-01-01';

	-- Sold in 99 counties out of 99
	SELECT COUNT(DISTINCT counties.county)
	FROM sales
	JOIN counties ON sales.county = counties.county
	WHERE vendor ILIKE '%conste%'
		AND "date" >= '2014-01-01'
		AND "date" < '2015-01-01'

	-- Spirits market
	SELECT DISTINCT category_name
	FROM products
	WHERE vendor_name ILIKE '%conste%';
*/



-- General Summary
/*
	-- Total Constellation-Related Transactions: 155,408
    SELECT *
	FROM sales
	WHERE vendor ILIKE '%conste%'
		AND "date" >= '2014-01-01'
		AND "date" < '2015-01-01';
    
	-- Total Revenue : $23.49M
	SELECT SUM(total) AS total_revenue
	FROM sales JOIN counties
		USING(county)
	WHERE vendor ILIKE '%conste%'
		AND "date" >= '2014-01-01'
		AND "date" < '2015-01-01'
		
	-- Average Revenue Across Counties : $235K
	SELECT AVG(county_revenue) AS avg_revenue_per_county
	FROM (
		SELECT
			county,
			SUM(total) AS county_revenue
		FROM sales
		WHERE vendor ILIKE '%conste%'
		  AND "date" >= '2014-01-01'
		  AND "date" <  '2015-01-01'
		GROUP BY county
	) t;

	-- Highest/Lowest Revenue by County, population over 10K (picking better sample sizes)
	SELECT county, SUM(total)
	FROM sales JOIN counties
		USING(county)
	WHERE vendor ILIKE '%conste%'
		AND "date" >= '2014-01-01'
		AND "date" < '2015-01-01'
		AND population > 10000
	GROUP BY county
	ORDER BY 2 DESC
	LIMIT 3
	-- Polk, Linn, Black Hawk were top 3, respectively, with over a million in revenue
	-- Polk being the highest at $3.73M
	-- Keokuk, Hancock, Mills were bot 3, respectively, with lowest about $22K.
    -- Counties with a population 10000 and under did generate higher revenue than some counties
    -- with a population over 10000; however, they were outperformed by at least 75%
    -- among over 30 counties.

	-- 	Revenue/Population; Revenue per capita
		SELECT county, SUM(total)/MAX(population) AS revenue_per_capita
		FROM sales
        JOIN counties
			USING(county)
		WHERE vendor ILIKE '%conste%'
			AND "date" >= '2014-01-01'
			AND "date" < '2015-01-01'
			AND population > 10000
		GROUP BY county
		ORDER BY 2 DESC
		LIMIT 3
	-- 	Dickinson, O'Brien, and Carroll were highest performers, at the highest of $19.78 per capita.
	-- 	Polk, Linn, Black Hawk dropped down to 26, 23, 9 respectively
    
    -- Find out how to replicate Dickinson, O'Brien, and Carroll's profit margin and scale it
    -- into larger counties, like Polk, Linn, and Black Hawk. Theoretically, generate over
    -- 100% margins and increase sales by a TON.
*/



-- Consumer Spending
/*

*/



-- Product Analysis
/*
	-- Product Availability: 66 products
    SELECT COUNT(DISTINCT item_description)
	FROM products
	WHERE vendor_name ILIKE '%conste%'

	-- BASE QUERY -> divert into category_name and sum below
	SELECT category_name, SUM(total)
	FROM sales
	JOIN counties
		USING(county)
	WHERE vendor ILIKE '%conste%'
		AND "date" >= '2014-01-01'
		AND "date" < '2015-01-01'
		AND population > 10000
	GROUP BY category_name
	ORDER BY category_name, SUM(total) DESC
	-- Canadian Whiskies is our highest revenue generator
	-- Whiskies -> Vodka -> Brandies -> Tequila
    
    -- All general product information
	SELECT
		CASE
			WHEN products.category_name ILIKE '%whisk%' THEN 'Whiskies'
			WHEN products.category_name ILIKE '%vodka%' THEN 'Vodka'
			WHEN products.category_name ILIKE '%brand%' THEN 'Brandies'
			WHEN products.category_name ILIKE '%tequila%' THEN 'Tequila'
			ELSE products.category_name
		END AS category_group,
		CASE 
			WHEN products.item_description ILIKE '%paul masson%' THEN 'Paul Masson'
			WHEN products.item_description ILIKE '%black velvet%' THEN 'Black Velvet'
			WHEN products.item_description ILIKE '%master%' 
			  OR products.item_description ILIKE '%mc master%' THEN 'McMasters'
			WHEN products.item_description ILIKE '%svedka%' 
			  OR products.item_description ILIKE '%svekda%' THEN 'Svedka'
			WHEN products.item_description ILIKE '%casa noble%' THEN 'Casa Noble'
			ELSE products.item_description
		END AS brand_group,
		SUM(total)
	FROM sales
	JOIN products ON sales.item = products.item_no
	WHERE sales.vendor ILIKE '%conste%'
		AND sales.date >= '2014-01-01'
		AND sales.date < '2015-01-01'
	GROUP BY category_group, brand_group
	ORDER BY 3 DESC

    -- Best Product: Black Velvet
    -- Best Series: Black Velvet Series
    -- Best Category: Whiskies; Canadian Whiskey
    
    -- Worst Product: Canadian Mac Naughton Whiskey
    -- Worst Series: Canadian Mac Naughton Whiskey
    -- Worst Category: Tequila
	
    -- Side query for validation:
    SELECT description, SUM(total)
	FROM sales
	WHERE sales.vendor ILIKE '%conste%'
		AND sales.date >= '2014-01-01'
		AND sales.date < '2015-01-01'
	GROUP BY description
	ORDER BY 2
*/



-- Analysis VS Competitors
/*
	-- Total Market Analysis
	SELECT SUM(total) as market_total
	FROM sales
	-- WHERE category_name ILIKE '%brandi%' -- $13.51M;
	-- WHERE category_name ILIKE '%whiski%' -- $103.49M;
	-- WHERE category_name ILIKE '%vodka%' -- $83.92M;
	WHERE category_name ILIKE '%tequila%' -- $19.28M;
		AND "date" >= '2014-01-01'
		AND "date" < '2015-01-01'

	SELECT 
		CASE 
			WHEN category_name ILIKE '%brand%' THEN 'Brandies' -- $1.38M out of $13.51M
			WHEN category_name ILIKE '%whisk%' THEN 'Whiskies' -- $18.69M out of $103.49M
			WHEN category_name ILIKE '%vodka%' THEN 'Vodka' -- $2.32M out of $83.92M
			WHEN category_name ILIKE '%tequila%' THEN 'Tequila' -- $900 out of $19.28M
			ELSE 'Other'
		END AS category_group,
		SUM(total) AS total_sales
	FROM sales
	JOIN counties USING(county)
	WHERE vendor ILIKE '%conste%'
		AND "date" >= '2014-01-01'
		AND "date" < '2015-01-01'
		AND population > 10000
	GROUP BY category_group
	ORDER BY total_sales DESC;

	-- Weakness spotted, Tequila market, $900 out of $19.28M, .004% of the market
	-- Weakness spotted, Canadian Mac Naughton Whiskey
	-- Drop it and invest money elsewhere, or experiment with it without giving lots of resources

	-- How are competitors doing? (My most beautiful ugly script)
	SELECT
		CASE
			WHEN category_name ILIKE '%whisk%' THEN 'Whiskies'
			WHEN category_name ILIKE '%vodka%' THEN 'Vodka'
			WHEN category_name ILIKE '%brand%' THEN 'Brandies'
			WHEN category_name ILIKE '%tequila%' THEN 'Tequila'
		END AS category_group,
		CASE -- AI assisted for mass vendors
			WHEN vendor ILIKE '%diageo%' THEN 'Diageo'
			WHEN vendor ILIKE '%brown-forman%' THEN 'Brown-Forman Corporation'
			WHEN vendor ILIKE '%constellation%' THEN 'Constellation Brands'
			WHEN vendor ILIKE '%sazerac%' THEN 'Sazerac'
			WHEN vendor ILIKE '%jim beam%' THEN 'Jim Beam Brands'
			WHEN vendor ILIKE '%pernod ricard%' THEN 'Pernod Ricard'
			
			WHEN vendor ILIKE '%bacardi%' THEN 'Bacardi'
			WHEN vendor ILIKE '%heaven%' THEN 'Heaven Hill'
			WHEN vendor ILIKE '%luxco%' THEN 'Luxco'
			WHEN vendor ILIKE '%william grant%' THEN 'William Grant and Sons'
			
			WHEN vendor ILIKE '%m.s. walker%' OR vendor ILIKE '%ms walker%' THEN 'M.S. Walker'
			WHEN vendor ILIKE '%shaw ross%' THEN 'Shaw Ross International Importers'
			WHEN vendor ILIKE '%park street%' THEN 'Park Street Imports'
			WHEN vendor ILIKE '%palm bay%' THEN 'Palm Bay Imports'
			
			WHEN vendor ILIKE '%hood river%' THEN 'Hood River Distillers'
			WHEN vendor ILIKE '%cedar ridge%' THEN 'Cedar Ridge Vineyards'
			WHEN vendor ILIKE '%mccormick%' THEN 'McCormick Distilling Company'
			
			WHEN vendor ILIKE '%remy%' THEN 'Remy Cointreau'
			WHEN vendor ILIKE '%moet%' OR vendor ILIKE '%hennessy%' THEN 'Moet Hennessy'
			
			ELSE vendor
		END AS vendor_group,
		SUM(total) AS revenue
	FROM sales
	WHERE sales.date >= '2014-01-01'
		AND sales.date < '2015-01-01'
		AND (
			category_name ILIKE '%whisk%'
			OR category_name ILIKE '%vodka%'
			OR category_name ILIKE '%brand%'
			OR category_name ILIKE '%tequila%'
		)
	GROUP BY category_group, vendor_group
	ORDER BY category_group DESC, revenue DESC

	-- Competitors for all competing brands
	SELECT
		CASE
			WHEN category_name ILIKE '%whisk%' THEN 'Whiskies'
			WHEN category_name ILIKE '%vodka%' THEN 'Vodka'
			WHEN category_name ILIKE '%brand%' THEN 'Brandies'
			WHEN category_name ILIKE '%tequila%' THEN 'Tequila'
		END AS category_group,
		CASE -- AI assisted for mass vendors
			WHEN vendor ILIKE '%diageo%' THEN 'Diageo'
			WHEN vendor ILIKE '%brown-forman%' THEN 'Brown-Forman Corporation'
			WHEN vendor ILIKE '%constellation%' THEN 'Constellation Brands'
			WHEN vendor ILIKE '%sazerac%' THEN 'Sazerac'
			WHEN vendor ILIKE '%jim beam%' THEN 'Jim Beam Brands'
			WHEN vendor ILIKE '%pernod ricard%' THEN 'Pernod Ricard'
			
			WHEN vendor ILIKE '%bacardi%' THEN 'Bacardi'
			WHEN vendor ILIKE '%heaven%' THEN 'Heaven Hill'
			WHEN vendor ILIKE '%luxco%' THEN 'Luxco'
			WHEN vendor ILIKE '%william grant%' THEN 'William Grant and Sons'
			
			WHEN vendor ILIKE '%m.s. walker%' OR vendor ILIKE '%ms walker%' THEN 'M.S. Walker'
			WHEN vendor ILIKE '%shaw ross%' THEN 'Shaw Ross International Importers'
			WHEN vendor ILIKE '%park street%' THEN 'Park Street Imports'
			WHEN vendor ILIKE '%palm bay%' THEN 'Palm Bay Imports'
			
			WHEN vendor ILIKE '%hood river%' THEN 'Hood River Distillers'
			WHEN vendor ILIKE '%cedar ridge%' THEN 'Cedar Ridge Vineyards'
			WHEN vendor ILIKE '%mccormick%' THEN 'McCormick Distilling Company'
			
			WHEN vendor ILIKE '%remy%' THEN 'Remy Cointreau'
			WHEN vendor ILIKE '%moet%' OR vendor ILIKE '%hennessy%' THEN 'Moet Hennessy'

			-- manually adding since AI didn't catch it
			WHEN vendor ILIKE '%wildman and sons%' THEN 'Wildman and Sons'
			WHEN vendor ILIKE '%klin spirits%' THEN 'Klin Spirits'
			WHEN vendor ILIKE '%levecke%' THEN 'Levecke Corp'
			WHEN vendor ILIKE '%imperial brands%' THEN 'Imperial Brands'
			WHEN vendor ILIKE '%russian standard vodka%' THEN 'Russian Standard Vodka'
			
			ELSE vendor
		END AS vendor_group,
		SUM(total) AS revenue
	FROM sales
	WHERE sales.date >= '2014-01-01'
		AND sales.date < '2015-01-01'
		AND (
			category_name ILIKE '%whisk%'
	--		OR category_name ILIKE '%vodka%'
	--		OR category_name ILIKE '%brand%'
	--		OR category_name ILIKE '%tequila%'
		)
	GROUP BY category_group, vendor_group
	ORDER BY category_group DESC, revenue DESC --, vendor_group
*/

-- Embellishments
-- Consider geographical analysis; location of convenience stores, college towns, and/or events
