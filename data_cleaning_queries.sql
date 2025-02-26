CREATE DATABASE jpn_tourism_db;

DROP DATABASE jpn_tourism_db;

USE jpn_tourism_db;

-- show tourists table
SELECT * FROM tourists;

-- rename column names
ALTER TABLE tourists
RENAME COLUMN `ï»¿AD` TO `year`,
RENAME COLUMN `Tourist spot name` TO `tourist_spot_name`,
RENAME COLUMN `Municipal code` TO `municipal_code`,
RENAME COLUMN `Subcategory code` TO `subcategory_code`,
RENAME COLUMN `Sub-subcategory code` TO `sub_subcategory_code`,
RENAME COLUMN `Total number of visitors_January` TO `visitors_jan`,
RENAME COLUMN `Total number of visitors_February` TO `visitors_feb`,
RENAME COLUMN `Total number of visitors_March` TO `visitors_mar`,
RENAME COLUMN `Total number of visitors_April` TO `visitors_apr`,
RENAME COLUMN `Total number of visitors_May` TO `visitors_may`,
RENAME COLUMN `Total number of visitors_June` TO `visitors_jun`,
RENAME COLUMN `Total number of visitors_July` TO `visitors_jul`,
RENAME COLUMN `Total number of visitors_August` TO `visitors_aug`,
RENAME COLUMN `Total number of visitors_September` TO `visitors_sep`,
RENAME COLUMN `Total number of visitors_October` TO `visitors_oct`,
RENAME COLUMN `Total number of visitors_November` TO `visitors_nov`,
RENAME COLUMN `Total number of visitors_December` TO `visitors_dec`,
RENAME COLUMN `(Of which) Number of foreign visitors_January` TO `foreign_visitors_jan`,
RENAME COLUMN `(Of which) Number of foreign visitors_February` TO `foreign_visitors_feb`,
RENAME COLUMN `(Of which) Number of foreign visitors_March` TO `foreign_visitors_mar`,
RENAME COLUMN `(Of which) Number of foreign visitors_April` TO `foreign_visitors_apr`,
RENAME COLUMN `(Of which) Number of foreign visitors_May` TO `foreign_visitors_may`,
RENAME COLUMN `(Of which) Number of foreign visitors_June` TO `foreign_visitors_jun`,
RENAME COLUMN `(Of which) Number of foreign visitors_July` TO `foreign_visitors_jul`,
RENAME COLUMN `(Of which) Number of foreign visitors_August` TO `foreign_visitors_aug`,
RENAME COLUMN `(Of which) Number of foreign visitors_September` TO `foreign_visitors_sep`,
RENAME COLUMN `(Of which) Number of foreign visitors_October` TO `foreign_visitors_oct`,
RENAME COLUMN `(Of which) Number of foreign visitors_November` TO `foreign_visitors_nov`,
RENAME COLUMN `(Of which) Number of foreign visitors_December` TO `foreign_visitors_dec`;

ALTER TABLE tourists
DROP COLUMN tourist_spot_name,
DROP COLUMN municipal_code;


-- show category table
SELECT * FROM category;

ALTER TABLE category
RENAME COLUMN `ï»¿Subcategory code` TO `subcategory_code`,
RENAME COLUMN `Sub-subcategory code` TO `sub_subcategory_code`,
RENAME COLUMN `Subcategory` TO `subcategory`,
RENAME COLUMN `Sub-subcategory` TO `sub_subcategory`;

ALTER TABLE category
DROP COLUMN `MyUnknownColumn`,
DROP COLUMN `MyUnknownColumn_[0]`;

-- check for null values
SELECT COUNT(*) AS num_of_nulls
FROM tourists
WHERE
visitors_jan = "" OR visitors_jan IS NULL OR
visitors_feb = "" OR visitors_feb IS NULL OR
visitors_mar = "" OR visitors_mar IS NULL OR
visitors_apr = "" OR visitors_apr IS NULL OR
visitors_may = "" OR visitors_may IS NULL OR
visitors_jun = "" OR visitors_jun IS NULL OR
visitors_jul = "" OR visitors_jul IS NULL OR
visitors_aug = "" OR visitors_aug IS NULL OR
visitors_sep = "" OR visitors_sep IS NULL OR
visitors_oct = "" OR visitors_oct IS NULL OR
visitors_nov = "" OR visitors_nov IS NULL OR
visitors_dec = "" OR visitors_dec IS NULL;

-- check columns with empty strings
SELECT COUNT(*) 
FROM tourists
WHERE 
    visitors_jan = "" OR
    visitors_feb = "" OR
    visitors_mar = "" OR
    visitors_apr = "" OR
    visitors_may = "" OR
    visitors_jun = "" OR
    visitors_jul = "" OR
    visitors_aug = "" OR
    visitors_sep = "" OR
    visitors_oct = "" OR
    visitors_nov = "" OR
    visitors_dec = "";
    
-- check for duplicates
SELECT COUNT(*) FROM tourists;
SELECT DISTINCT COUNT(*) FROM tourists; -- comparing COUNT(*) and DISTINCT COUNT(*) shows there are no duplicate values
SELECT DISTINCT * FROM tourists;

SELECT * FROM tourists;

-- replacing nulls
UPDATE tourists
SET 
	visitors_jan = COALESCE(visitors_jan, 0),
    visitors_feb = COALESCE(visitors_feb, 0),
    visitors_mar = COALESCE(visitors_mar, 0),
    visitors_apr = COALESCE(visitors_apr, 0),
    visitors_may = COALESCE(visitors_may, 0),
    visitors_jun = COALESCE(visitors_jun, 0),
    visitors_jul = COALESCE(visitors_jul, 0),
    visitors_aug = COALESCE(visitors_aug, 0),
    visitors_sep = COALESCE(visitors_sep, 0),
    visitors_oct = COALESCE(visitors_oct, 0),
    visitors_nov = COALESCE(visitors_nov, 0),
    visitors_dec = COALESCE(visitors_dec, 0),
    foreign_visitors_jan = COALESCE(foreign_visitors_jan, 0),
    foreign_visitors_feb = COALESCE(foreign_visitors_feb, 0),
    foreign_visitors_mar = COALESCE(foreign_visitors_mar, 0),
    foreign_visitors_apr = COALESCE(foreign_visitors_apr, 0),
    foreign_visitors_may = COALESCE(foreign_visitors_may, 0),
    foreign_visitors_jun = COALESCE(foreign_visitors_jun, 0),
    foreign_visitors_jul = COALESCE(foreign_visitors_jul, 0),
    foreign_visitors_aug = COALESCE(foreign_visitors_aug, 0),
    foreign_visitors_sep = COALESCE(foreign_visitors_sep, 0),
    foreign_visitors_oct = COALESCE(foreign_visitors_oct, 0),
    foreign_visitors_nov = COALESCE(foreign_visitors_nov, 0),
    foreign_visitors_dec = COALESCE(foreign_visitors_dec, 0);
    
-- replace empty strings with 0
UPDATE tourists 
SET 
    visitors_jan = CASE WHEN visitors_jan = "" THEN 0 ELSE visitors_jan END,
    visitors_feb = CASE WHEN visitors_feb = "" THEN 0 ELSE visitors_feb END,
    visitors_mar = CASE WHEN visitors_mar = "" THEN 0 ELSE visitors_mar END,
    visitors_apr = CASE WHEN visitors_apr = "" THEN 0 ELSE visitors_apr END,
    visitors_may = CASE WHEN visitors_may = "" THEN 0 ELSE visitors_may END,
    visitors_jun = CASE WHEN visitors_jun = "" THEN 0 ELSE visitors_jun END,
    visitors_jul = CASE WHEN visitors_jul = "" THEN 0 ELSE visitors_jul END,
    visitors_aug = CASE WHEN visitors_aug = "" THEN 0 ELSE visitors_aug END,
    visitors_sep = CASE WHEN visitors_sep = "" THEN 0 ELSE visitors_sep END,
    visitors_oct = CASE WHEN visitors_oct = "" THEN 0 ELSE visitors_oct END,
    visitors_nov = CASE WHEN visitors_nov = "" THEN 0 ELSE visitors_nov END,
    visitors_dec = CASE WHEN visitors_dec = "" THEN 0 ELSE visitors_dec END,
    foreign_visitors_jan = CASE WHEN foreign_visitors_jan = "" THEN 0 ELSE foreign_visitors_jan END,
    foreign_visitors_feb = CASE WHEN foreign_visitors_feb = "" THEN 0 ELSE foreign_visitors_feb END,
    foreign_visitors_mar = CASE WHEN foreign_visitors_mar = "" THEN 0 ELSE foreign_visitors_mar END,
    foreign_visitors_apr = CASE WHEN foreign_visitors_apr = "" THEN 0 ELSE foreign_visitors_apr END,
    foreign_visitors_may = CASE WHEN foreign_visitors_may = "" THEN 0 ELSE foreign_visitors_may END,
    foreign_visitors_jun = CASE WHEN foreign_visitors_jun = "" THEN 0 ELSE foreign_visitors_jun END,
    foreign_visitors_jul = CASE WHEN foreign_visitors_jul = "" THEN 0 ELSE foreign_visitors_jul END,
    foreign_visitors_aug = CASE WHEN foreign_visitors_aug = "" THEN 0 ELSE foreign_visitors_aug END,
    foreign_visitors_sep = CASE WHEN foreign_visitors_sep = "" THEN 0 ELSE foreign_visitors_sep END,
    foreign_visitors_oct = CASE WHEN foreign_visitors_oct = "" THEN 0 ELSE foreign_visitors_oct END,
    foreign_visitors_nov = CASE WHEN foreign_visitors_nov = "" THEN 0 ELSE foreign_visitors_nov END,
    foreign_visitors_dec = CASE WHEN foreign_visitors_dec = "" THEN 0 ELSE foreign_visitors_dec END;

-- convert datatypes to int
ALTER TABLE tourists
MODIFY COLUMN visitors_jan INT,
MODIFY COLUMN visitors_feb INT,
MODIFY COLUMN visitors_mar INT,
MODIFY COLUMN visitors_apr INT,
MODIFY COLUMN visitors_may INT,
MODIFY COLUMN visitors_jun INT,
MODIFY COLUMN visitors_jul INT,
MODIFY COLUMN visitors_aug INT,
MODIFY COLUMN visitors_sep INT,
MODIFY COLUMN visitors_oct INT,
MODIFY COLUMN visitors_nov INT,
MODIFY COLUMN visitors_dec INT,
MODIFY COLUMN foreign_visitors_jan INT, 
MODIFY COLUMN foreign_visitors_feb INT,
MODIFY COLUMN foreign_visitors_mar INT,
MODIFY COLUMN foreign_visitors_apr INT,
MODIFY COLUMN foreign_visitors_may INT,
MODIFY COLUMN foreign_visitors_jun INT,
MODIFY COLUMN foreign_visitors_jul INT,
MODIFY COLUMN foreign_visitors_aug INT,
MODIFY COLUMN foreign_visitors_sep INT,
MODIFY COLUMN foreign_visitors_oct INT,
MODIFY COLUMN foreign_visitors_nov INT,
MODIFY COLUMN foreign_visitors_dec INT;

SELECT 
    REPLACE(REPLACE(visitors_jan, ',', ''), ' ', '') AS visitors_jan,
    REPLACE(REPLACE(visitors_feb, ',', ''), ' ', '') AS visitors_feb,
    REPLACE(REPLACE(visitors_mar, ',', ''), ' ', '') AS visitors_mar,
    REPLACE(REPLACE(visitors_apr, ',', ''), ' ', '') AS visitors_apr,
    REPLACE(REPLACE(visitors_may, ',', ''), ' ', '') AS visitors_may,
    REPLACE(REPLACE(visitors_jun, ',', ''), ' ', '') AS visitors_jun,
    REPLACE(REPLACE(visitors_jul, ',', ''), ' ', '') AS visitors_jul,
    REPLACE(REPLACE(visitors_aug, ',', ''), ' ', '') AS visitors_aug,
    REPLACE(REPLACE(visitors_sep, ',', ''), ' ', '') AS visitors_sep,
    REPLACE(REPLACE(visitors_oct, ',', ''), ' ', '') AS visitors_oct,
    REPLACE(REPLACE(visitors_nov, ',', ''), ' ', '') AS visitors_nov,
    REPLACE(REPLACE(visitors_dec, ',', ''), ' ', '') AS visitors_dec,
    REPLACE(REPLACE(foreign_visitors_jan, ',', ''), ' ', '') AS foreign_visitors_jan,
    REPLACE(REPLACE(foreign_visitors_feb, ',', ''), ' ', '') AS foreign_visitors_feb,
    REPLACE(REPLACE(foreign_visitors_mar, ',', ''), ' ', '') AS foreign_visitors_mar,
    REPLACE(REPLACE(foreign_visitors_apr, ',', ''), ' ', '') AS foreign_visitors_apr,
    REPLACE(REPLACE(foreign_visitors_may, ',', ''), ' ', '') AS foreign_visitors_may,
    REPLACE(REPLACE(foreign_visitors_jun, ',', ''), ' ', '') AS foreign_visitors_jun,
    REPLACE(REPLACE(foreign_visitors_jul, ',', ''), ' ', '') AS foreign_visitors_jul,
    REPLACE(REPLACE(foreign_visitors_aug, ',', ''), ' ', '') AS foreign_visitors_aug,
    REPLACE(REPLACE(foreign_visitors_sep, ',', ''), ' ', '') AS foreign_visitors_sep,
    REPLACE(REPLACE(foreign_visitors_oct, ',', ''), ' ', '') AS foreign_visitors_oct,
    REPLACE(REPLACE(foreign_visitors_nov, ',', ''), ' ', '') AS foreign_visitors_nov,
    REPLACE(REPLACE(foreign_visitors_dec, ',', ''), ' ', '') AS foreign_visitors_dec
FROM tourists;

-- update values in database
UPDATE tourists
SET
	visitors_jan = REPLACE(REPLACE(visitors_jan, ',', ''), ' ', ''),
    visitors_feb = REPLACE(REPLACE(visitors_feb, ',', ''), ' ', ''),
    visitors_mar = REPLACE(REPLACE(visitors_mar, ',', ''), ' ', ''),
    visitors_apr = REPLACE(REPLACE(visitors_apr, ',', ''), ' ', ''),
    visitors_may = REPLACE(REPLACE(visitors_may, ',', ''), ' ', ''),
    visitors_jun = REPLACE(REPLACE(visitors_jun, ',', ''), ' ', ''),
    visitors_jul = REPLACE(REPLACE(visitors_jul, ',', ''), ' ', ''),
    visitors_aug = REPLACE(REPLACE(visitors_aug, ',', ''), ' ', ''),
    visitors_sep = REPLACE(REPLACE(visitors_sep, ',', ''), ' ', ''),
    visitors_oct = REPLACE(REPLACE(visitors_oct, ',', ''), ' ', ''),
    visitors_nov = REPLACE(REPLACE(visitors_nov, ',', ''), ' ', ''),
    visitors_dec = REPLACE(REPLACE(visitors_dec, ',', ''), ' ', ''),
    foreign_visitors_jan = REPLACE(REPLACE(foreign_visitors_jan, ',', ''), ' ', ''),
    foreign_visitors_feb = REPLACE(REPLACE(foreign_visitors_feb, ',', ''), ' ', ''),
    foreign_visitors_mar = REPLACE(REPLACE(foreign_visitors_mar, ',', ''), ' ', ''),
    foreign_visitors_apr = REPLACE(REPLACE(foreign_visitors_apr, ',', ''), ' ', ''),
    foreign_visitors_may = REPLACE(REPLACE(foreign_visitors_may, ',', ''), ' ', ''),
    foreign_visitors_jun = REPLACE(REPLACE(foreign_visitors_jun, ',', ''), ' ', ''),
    foreign_visitors_jul = REPLACE(REPLACE(foreign_visitors_jul, ',', ''), ' ', ''),
    foreign_visitors_aug = REPLACE(REPLACE(foreign_visitors_aug, ',', ''), ' ', ''),
    foreign_visitors_sep = REPLACE(REPLACE(foreign_visitors_sep, ',', ''), ' ', ''),
    foreign_visitors_oct = REPLACE(REPLACE(foreign_visitors_oct, ',', ''), ' ', ''),
    foreign_visitors_nov = REPLACE(REPLACE(foreign_visitors_nov, ',', ''), ' ', ''),
    foreign_visitors_dec = REPLACE(REPLACE(foreign_visitors_dec, ',', ''), ' ', '');

-- export to csv
SELECT * FROM tourists; -- run then click export in result grid

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES =  1;