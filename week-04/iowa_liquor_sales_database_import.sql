USE iowa_liquor_sales_database;

-- Created by Longley Pham
-- With the help of AI, generated and imported the
-- liquor database from pgadmin to a schema in MySQL
-- Learned to import from PostgreSQL to MySQL

-- Generate sales table
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    date DATETIME,
    convenience_store VARCHAR(20),
    store INT,
    county_number VARCHAR(20),
    county VARCHAR(50),
    category VARCHAR(20),
    category_name VARCHAR(150),
    vendor_no VARCHAR(20),
    vendor VARCHAR(150),
    item INT,
    description VARCHAR(255),
    pack INT,
    liter_size INT,
    state_btl_cost DECIMAL(10,2),
    btl_price DECIMAL(10,2),
    bottle_qty INT,
    total DECIMAL(10,2)
);

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
   
-- Generate counties table   
DROP TABLE IF EXISTS counties;
CREATE TABLE counties (
    county VARCHAR(50),
    population INT
);

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/counties.csv'
INTO TABLE counties
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Generate products table
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    item_no INT,
    category_name VARCHAR(150),
    item_description VARCHAR(255),
    vendor INT,
    vendor_name VARCHAR(150),
    bottle_size INT,
    pack INT,
    inner_pack INT,
    age INT NULL,
    proof INT,
    list_date DATETIME NULL,
    upc VARCHAR(30),
    scc VARCHAR(30),
    bottle_price DECIMAL(10,2),
    shelf_price DECIMAL(10,2),
    case_cost DECIMAL(10,2)
);

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    item_no,
    category_name,
    item_description,
    vendor,
    vendor_name,
    bottle_size,
    pack,
    inner_pack,
    @age,
    @proof,
    @list_date,
    upc,
    scc,
    bottle_price,
    shelf_price,
    case_cost
)
SET
    age = NULLIF(@age, ''),
    proof = NULLIF(@proof, ''),
    list_date = NULLIF(@list_date, '');
    
-- Generate stores table
DROP TABLE IF EXISTS stores;
CREATE TABLE stores (
    store INT,
    name VARCHAR(150),
    store_status CHAR(1),
    store_address TEXT,
    address_info TEXT
);

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/stores.csv'
INTO TABLE stores
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;