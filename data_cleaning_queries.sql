describe jpn_tourism;
-- consolidate tables
CREATE TABLE jpn_tourism AS
	SELECT * FROM japan_tourism.`2021-jpn-tourism`
	UNION ALL
	SELECT * FROM japan_tourism.`2022-jpn-tourism`
	UNION ALL
	SELECT * FROM japan_tourism.`2023-jpn-tourism`
;

-- rename column names
ALTER TABLE jpn_tourism
RENAME COLUMN `ï»¿AD` TO `year`, 
RENAME COLUMN `Tourist spot name` TO `tourist_spot_name`, 
RENAME COLUMN `Municipal code` TO `municipal_code`,
RENAME COLUMN `Subcategory code` TO `subcategory_code`, 
RENAME COLUMN `Sub-subcategory code` TO `sub_subcategory_code`, 

RENAME COLUMN `Total number of visitors_January` TO `total_num_of_visitors_january`, 
RENAME COLUMN `Total number of visitors_February` TO `total_num_of_visitors_february`,
RENAME COLUMN `Total number of visitors_March` TO `total_num_of_visitors_march`,
RENAME COLUMN `Total number of visitors_April` TO `total_num_of_visitors_april`,
RENAME COLUMN `Total number of visitors_May` TO `total_num_of_visitors_may`,
RENAME COLUMN `Total number of visitors_June` TO `total_num_of_visitors_june`,
RENAME COLUMN `Total number of visitors_July` TO `total_num_of_visitors_july`,
RENAME COLUMN `Total number of visitors_August` TO `total_num_of_visitors_august`,
RENAME COLUMN `Total number of visitors_September` TO `total_num_of_visitors_september`,
RENAME COLUMN `Total number of visitors_October` TO `total_num_of_visitors_october`,
RENAME COLUMN `Total number of visitors_November` TO `total_num_of_visitors_november`,
RENAME COLUMN `Total number of visitors_December` TO `total_num_of_visitors_december`,

RENAME COLUMN `(Of which) Number of foreign visitors_January` TO `total_num_of_foreign_visitors_january`,
RENAME COLUMN `(Of which) Number of foreign visitors_February` TO `total_num_of_foreign_visitors_february`,
RENAME COLUMN `(Of which) Number of foreign visitors_March` TO `total_num_of_foreign_visitors_march`,
RENAME COLUMN `(Of which) Number of foreign visitors_April` TO `total_num_of_foreign_visitors_april`,
RENAME COLUMN `(Of which) Number of foreign visitors_May` TO `total_num_of_foreign_visitors_may`,
RENAME COLUMN `(Of which) Number of foreign visitors_June` TO `total_num_of_foreign_visitors_june`,
RENAME COLUMN `(Of which) Number of foreign visitors_July` TO `total_num_of_foreign_visitors_july`,
RENAME COLUMN `(Of which) Number of foreign visitors_August` TO `total_num_of_foreign_visitors_august`,
RENAME COLUMN `(Of which) Number of foreign visitors_September` TO `total_num_of_foreign_visitors_september`,
RENAME COLUMN `(Of which) Number of foreign visitors_October` TO `total_num_of_foreign_visitors_october`,
RENAME COLUMN `(Of which) Number of foreign visitors_November` TO `total_num_of_foreign_visitors_november`,
RENAME COLUMN `(Of which) Number of foreign visitors_December` TO `total_num_of_foreign_visitors_december`;

-- drop empty columns, validate first if columns are empty
SELECT DISTINCT tourist_spot_name
FROM jpn_tourism;

SELECT DISTINCT municipal_code
FROM jpn_tourism;

-- drop columns
ALTER TABLE jpn_tourism
DROP COLUMN tourist_spot_name,
DROP COLUMN municipal_code;

-- check if columns are removed
DESCRIBE jpn_tourism;

-- handle missing values (nulls and empty strings)
-- check if there are null values
SELECT COUNT(*) 
FROM jpn_tourism
WHERE 
	year IS NULL OR year = '' OR
    subcategory_code IS NULL OR subcategory_code = '' OR
    sub_subcategory_code IS NULL OR sub_subcategory_code = '' OR
    total_num_of_visitors_january IS NULL OR total_num_of_visitors_january = '' OR
    total_num_of_visitors_february IS NULL OR total_num_of_visitors_february = '' OR
    total_num_of_visitors_march IS NULL OR total_num_of_visitors_march = '' OR
    total_num_of_visitors_april IS NULL OR total_num_of_visitors_april = '' OR
    total_num_of_visitors_may IS NULL OR total_num_of_visitors_may = '' OR
    total_num_of_visitors_june IS NULL OR total_num_of_visitors_june = '' OR
    total_num_of_visitors_july IS NULL OR total_num_of_visitors_july = '' OR
    total_num_of_visitors_august IS NULL OR total_num_of_visitors_august = '' OR
    total_num_of_visitors_september IS NULL OR total_num_of_visitors_september = '' OR
    total_num_of_visitors_october IS NULL OR total_num_of_visitors_october = '' OR
    total_num_of_visitors_november IS NULL OR total_num_of_visitors_november = '' OR
    total_num_of_visitors_december IS NULL OR total_num_of_visitors_december = '' OR
    total_num_of_foreign_visitors_january IS NULL OR total_num_of_foreign_visitors_january = '' OR
    total_num_of_foreign_visitors_february IS NULL OR total_num_of_foreign_visitors_february = '' OR
    total_num_of_foreign_visitors_march IS NULL OR total_num_of_foreign_visitors_march = '' OR
    total_num_of_foreign_visitors_april IS NULL OR total_num_of_foreign_visitors_april = '' OR
    total_num_of_foreign_visitors_may IS NULL OR total_num_of_foreign_visitors_may = '' OR
    total_num_of_foreign_visitors_june IS NULL OR total_num_of_foreign_visitors_june = '' OR
    total_num_of_foreign_visitors_july IS NULL OR total_num_of_foreign_visitors_july = '' OR
    total_num_of_foreign_visitors_august IS NULL OR total_num_of_foreign_visitors_august = '' OR
    total_num_of_foreign_visitors_september IS NULL OR total_num_of_foreign_visitors_september = '' OR
    total_num_of_foreign_visitors_october IS NULL OR total_num_of_foreign_visitors_october = '' OR
    total_num_of_foreign_visitors_november IS NULL OR total_num_of_foreign_visitors_november = '' OR
    total_num_of_foreign_visitors_december IS NULL OR total_num_of_foreign_visitors_december = '';

-- replace null and empty string with 0
UPDATE jpn_tourism
SET 
    year = COALESCE(NULLIF(year, ''), 0),
    subcategory_code = COALESCE(NULLIF(subcategory_code, ''), 0),
    sub_subcategory_code = COALESCE(NULLIF(sub_subcategory_code, ''), 0),
    total_num_of_visitors_january = COALESCE(NULLIF(total_num_of_visitors_january, ''), 0),
    total_num_of_visitors_february = COALESCE(NULLIF(total_num_of_visitors_february, ''), 0),
    total_num_of_visitors_march = COALESCE(NULLIF(total_num_of_visitors_march, ''), 0),
    total_num_of_visitors_april = COALESCE(NULLIF(total_num_of_visitors_april, ''), 0),
    total_num_of_visitors_may = COALESCE(NULLIF(total_num_of_visitors_may, ''), 0),
    total_num_of_visitors_june = COALESCE(NULLIF(total_num_of_visitors_june, ''), 0),
    total_num_of_visitors_july = COALESCE(NULLIF(total_num_of_visitors_july, ''), 0),
    total_num_of_visitors_august = COALESCE(NULLIF(total_num_of_visitors_august, ''), 0),
    total_num_of_visitors_september = COALESCE(NULLIF(total_num_of_visitors_september, ''), 0),
    total_num_of_visitors_october = COALESCE(NULLIF(total_num_of_visitors_october, ''), 0),
    total_num_of_visitors_november = COALESCE(NULLIF(total_num_of_visitors_november, ''), 0),
    total_num_of_visitors_december = COALESCE(NULLIF(total_num_of_visitors_december, ''), 0),
    total_num_of_foreign_visitors_january = COALESCE(NULLIF(total_num_of_foreign_visitors_january, ''), 0),
    total_num_of_foreign_visitors_february = COALESCE(NULLIF(total_num_of_foreign_visitors_february, ''), 0),
    total_num_of_foreign_visitors_march = COALESCE(NULLIF(total_num_of_foreign_visitors_march, ''), 0),
    total_num_of_foreign_visitors_april = COALESCE(NULLIF(total_num_of_foreign_visitors_april, ''), 0),
    total_num_of_foreign_visitors_may = COALESCE(NULLIF(total_num_of_foreign_visitors_may, ''), 0),
    total_num_of_foreign_visitors_june = COALESCE(NULLIF(total_num_of_foreign_visitors_june, ''), 0),
    total_num_of_foreign_visitors_july = COALESCE(NULLIF(total_num_of_foreign_visitors_july, ''), 0),
    total_num_of_foreign_visitors_august = COALESCE(NULLIF(total_num_of_foreign_visitors_august, ''), 0),
    total_num_of_foreign_visitors_september = COALESCE(NULLIF(total_num_of_foreign_visitors_september, ''), 0),
    total_num_of_foreign_visitors_october = COALESCE(NULLIF(total_num_of_foreign_visitors_october, ''), 0),
    total_num_of_foreign_visitors_november = COALESCE(NULLIF(total_num_of_foreign_visitors_november, ''), 0),
    total_num_of_foreign_visitors_december = COALESCE(NULLIF(total_num_of_foreign_visitors_december, ''), 0);

-- change data types to INT
-- since there are decimal values, round values first
UPDATE jpn_tourism
SET 
    total_num_of_visitors_january = ROUND(total_num_of_visitors_january),
    total_num_of_visitors_february = ROUND(total_num_of_visitors_february),
    total_num_of_visitors_march = ROUND(total_num_of_visitors_march),
    total_num_of_visitors_april = ROUND(total_num_of_visitors_april),
    total_num_of_visitors_may = ROUND(total_num_of_visitors_may),
    total_num_of_visitors_june = ROUND(total_num_of_visitors_june),
    total_num_of_visitors_july = ROUND(total_num_of_visitors_july),
    total_num_of_visitors_august = ROUND(total_num_of_visitors_august),
    total_num_of_visitors_september = ROUND(total_num_of_visitors_september),
    total_num_of_visitors_october = ROUND(total_num_of_visitors_october),
    total_num_of_visitors_november = ROUND(total_num_of_visitors_november),
    total_num_of_visitors_december = ROUND(total_num_of_visitors_december),
    total_num_of_foreign_visitors_january = ROUND(total_num_of_foreign_visitors_january),
    total_num_of_foreign_visitors_february = ROUND(total_num_of_foreign_visitors_february),
    total_num_of_foreign_visitors_march = ROUND(total_num_of_foreign_visitors_march),
    total_num_of_foreign_visitors_april = ROUND(total_num_of_foreign_visitors_april),
    total_num_of_foreign_visitors_may = ROUND(total_num_of_foreign_visitors_may),
    total_num_of_foreign_visitors_june = ROUND(total_num_of_foreign_visitors_june),
    total_num_of_foreign_visitors_july = ROUND(total_num_of_foreign_visitors_july),
    total_num_of_foreign_visitors_august = ROUND(total_num_of_foreign_visitors_august),
    total_num_of_foreign_visitors_september = ROUND(total_num_of_foreign_visitors_september),
    total_num_of_foreign_visitors_october = ROUND(total_num_of_foreign_visitors_october),
    total_num_of_foreign_visitors_november = ROUND(total_num_of_foreign_visitors_november),
    total_num_of_foreign_visitors_december = ROUND(total_num_of_foreign_visitors_december);

-- after values are rounded, convert to INT
ALTER TABLE jpn_tourism
MODIFY COLUMN total_num_of_visitors_january INT,
MODIFY COLUMN total_num_of_visitors_february INT,
MODIFY COLUMN total_num_of_visitors_march INT,
MODIFY COLUMN total_num_of_visitors_april INT,
MODIFY COLUMN total_num_of_visitors_may INT,
MODIFY COLUMN total_num_of_visitors_june INT,
MODIFY COLUMN total_num_of_visitors_july INT,
MODIFY COLUMN total_num_of_visitors_august INT,
MODIFY COLUMN total_num_of_visitors_september INT,
MODIFY COLUMN total_num_of_visitors_october INT,
MODIFY COLUMN total_num_of_visitors_november INT,
MODIFY COLUMN total_num_of_visitors_december INT,
MODIFY COLUMN total_num_of_foreign_visitors_january INT,
MODIFY COLUMN total_num_of_foreign_visitors_february INT,
MODIFY COLUMN total_num_of_foreign_visitors_march INT,
MODIFY COLUMN total_num_of_foreign_visitors_april INT,
MODIFY COLUMN total_num_of_foreign_visitors_may INT,
MODIFY COLUMN total_num_of_foreign_visitors_june INT,
MODIFY COLUMN total_num_of_foreign_visitors_july INT,
MODIFY COLUMN total_num_of_foreign_visitors_august INT,
MODIFY COLUMN total_num_of_foreign_visitors_september INT,
MODIFY COLUMN total_num_of_foreign_visitors_october INT,
MODIFY COLUMN total_num_of_foreign_visitors_november INT,
MODIFY COLUMN total_num_of_foreign_visitors_december INT;

-- handle duplicates, check for duplicates
SELECT COUNT(*) FROM jpn_tourism; -- num of all rows

-- check num of duplicate rows
SELECT COUNT(*) AS num_of_duplicates
FROM (
    SELECT COUNT(*) 
    FROM jpn_tourism
    GROUP BY year, subcategory_code, sub_subcategory_code, 
             total_num_of_visitors_january, total_num_of_visitors_february, 
             total_num_of_visitors_march, total_num_of_visitors_april, 
             total_num_of_visitors_may, total_num_of_visitors_june, 
             total_num_of_visitors_july, total_num_of_visitors_august, 
             total_num_of_visitors_september, total_num_of_visitors_october, 
             total_num_of_visitors_november, total_num_of_visitors_december, 
             total_num_of_foreign_visitors_january, total_num_of_foreign_visitors_february, 
             total_num_of_foreign_visitors_march, total_num_of_foreign_visitors_april, 
             total_num_of_foreign_visitors_may, total_num_of_foreign_visitors_june, 
             total_num_of_foreign_visitors_july, total_num_of_foreign_visitors_august, 
             total_num_of_foreign_visitors_september, total_num_of_foreign_visitors_october, 
             total_num_of_foreign_visitors_november, total_num_of_foreign_visitors_december
    HAVING COUNT(*) > 1
) AS duplicates;

-- remove duplicates
CREATE TABLE jpn_tourism_clean AS
SELECT DISTINCT * FROM jpn_tourism;

DROP TABLE jpn_tourism;
ALTER TABLE jpn_tourism_clean RENAME TO jpn_tourism;

-- combine data with events and categories table
-- combine categories and tourism data

-- remove unnecessary columns
ALTER TABLE category
DROP COLUMN MyUnknownColumn,
DROP COLUMN `MyUnknownColumn_[0]`;

-- modify column names to match column names with other tables
ALTER TABLE category
RENAME COLUMN `ï»¿Subcategory code` TO subcategory_code,
RENAME COLUMN `Sub-subcategory code` TO sub_subcategory_code,
RENAME COLUMN `Subcategory` TO subcategory, 
RENAME COLUMN `Sub-subcategory` TO sub_subcategory;

-- create new joined table
CREATE TABLE tourism_data AS 
SELECT 
    jt.*,  -- Select all columns from jpn_tourism
    c.subcategory AS category_subcategory,  -- Rename to avoid duplication
    c.sub_subcategory AS category_sub_subcategory  -- Rename to avoid duplication
FROM jpn_tourism jt
JOIN category c  
ON jt.subcategory_code = c.subcategory_code  
AND jt.sub_subcategory_code = c.sub_subcategory_code;

select * from tourism_data;

-- alter table for events table
ALTER TABLE `events-2021`
RENAME COLUMN `ï»¿Sub-subcategory code` TO subcategory_code;

ALTER TABLE `events-2022-2023`
RENAME COLUMN `ï»¿Sub-subcategory code` TO subcategory_code;

-- combine table tourism_data with events table, table for 2021 and 2022-2023 are different
-- for 2021
CREATE TABLE tourism_data_2021 AS
SELECT t.*, e.events
FROM tourism_data t
JOIN `events-2021` e 
ON t.subcategory_code = e.subcategory_code
WHERE t.year = 2021;

-- for 2022-2023
CREATE TABLE tourism_data_2022_2023 AS
SELECT t.*, e2.events
FROM tourism_data t
JOIN `events-2022-2023` e2 
ON t.subcategory_code = e2.subcategory_code
WHERE t.year = 2022 OR t.year = 2023;

-- temp table for consolidated tables
CREATE TABLE jpn_tourism_v2 AS
	SELECT * FROM japan_tourism.tourism_data_2021
	UNION ALL
	SELECT * FROM japan_tourism.tourism_data_2022_2023
;

SELECT * FROM jpn_tourism_v2;

-- add month column -- then export
SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    month_names.month,
    category_subcategory,
    category_sub_subcategory,
    events,
    CASE month_names.month 
        WHEN 'January' THEN total_num_of_visitors_january
        WHEN 'February' THEN total_num_of_visitors_february
        WHEN 'March' THEN total_num_of_visitors_march
        WHEN 'April' THEN total_num_of_visitors_april
        WHEN 'May' THEN total_num_of_visitors_may
        WHEN 'June' THEN total_num_of_visitors_june
        WHEN 'July' THEN total_num_of_visitors_july
        WHEN 'August' THEN total_num_of_visitors_august
        WHEN 'September' THEN total_num_of_visitors_september
        WHEN 'October' THEN total_num_of_visitors_october
        WHEN 'November' THEN total_num_of_visitors_november
        WHEN 'December' THEN total_num_of_visitors_december
    END AS total_visitors,
    CASE month_names.month 
        WHEN 'January' THEN total_num_of_foreign_visitors_january
        WHEN 'February' THEN total_num_of_foreign_visitors_february
        WHEN 'March' THEN total_num_of_foreign_visitors_march
        WHEN 'April' THEN total_num_of_foreign_visitors_april
        WHEN 'May' THEN total_num_of_foreign_visitors_may
        WHEN 'June' THEN total_num_of_foreign_visitors_june
        WHEN 'July' THEN total_num_of_foreign_visitors_july
        WHEN 'August' THEN total_num_of_foreign_visitors_august
        WHEN 'September' THEN total_num_of_foreign_visitors_september
        WHEN 'October' THEN total_num_of_foreign_visitors_october
        WHEN 'November' THEN total_num_of_foreign_visitors_november
        WHEN 'December' THEN total_num_of_foreign_visitors_december
    END AS foreign_visitors
FROM jpn_tourism_v2
CROSS JOIN (
    SELECT 'January' AS month UNION ALL SELECT 'February' UNION ALL SELECT 'March'
    UNION ALL SELECT 'April' UNION ALL SELECT 'May' UNION ALL SELECT 'June'
    UNION ALL SELECT 'July' UNION ALL SELECT 'August' UNION ALL SELECT 'September'
    UNION ALL SELECT 'October' UNION ALL SELECT 'November' UNION ALL SELECT 'December'
) AS month_names;

-- show all tables
SELECT *
FROM jpn_tourism;

-- enable/disable update mode
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES =  1;