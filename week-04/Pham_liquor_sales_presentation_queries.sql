-- Longley Pham
-- Capstone 1
-- Presentation Queries

-- Time Period (14 months, 2014-01-01 to 2015-02-01)
SELECT DISTINCT
    DATE_TRUNC('month', "date") AS month
FROM sales
ORDER BY month;
-- Important because all sales will be for the year 2014, no 2015.

-- All sales
SELECT *
FROM sales
WHERE vendor ILIKE '%conste%'
	AND "date" >= '2014-01-01'
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
WHERE vendor_name ILIKE '%conste%'

-- General Summary
/*
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

	-- 	Revenue/Population; Revenue per capita
		SELECT county, SUM(total)/MAX(population) AS revenue_per_capita
		FROM sales JOIN counties
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
*/

-- Consumer Spending

-- Product Analysis


-- Analysis VS Competitors

-- Geographical Analysis

