SELECT * FROM tourists;

-- find the total visitors per month
SELECT 
    SUM(visitors_jan) AS `Tourists in January`,
    SUM(visitors_feb) AS `Tourists in February`,
    SUM(visitors_mar) AS `Tourists in March`,
    SUM(visitors_apr) AS `Tourists in April`,
    SUM(visitors_may) AS `Tourists in May`,
    SUM(visitors_jun) AS `Tourists in June`,
    SUM(visitors_jul) AS `Tourists in July`,
    SUM(visitors_aug) AS `Tourists in August`,
    SUM(visitors_sep) AS `Tourists in September`,
    SUM(visitors_oct) AS `Tourists in October`,
    SUM(visitors_nov) AS `Tourists in November`,
    SUM(visitors_dec) AS `Tourists in December`,
    (
		SUM(visitors_jan) +
		SUM(visitors_feb) +
		SUM(visitors_mar) +
		SUM(visitors_apr) +
		SUM(visitors_may) +
		SUM(visitors_jun) +
		SUM(visitors_jul) +
		SUM(visitors_aug) +
		SUM(visitors_sep) +
		SUM(visitors_oct) +
		SUM(visitors_nov) +
		SUM(visitors_dec)
    ) AS `Total Number of Tourists in 2023`
FROM tourists;

SELECT 
    year, subcategory_code, sub_subcategory_code,
    'January' AS month, visitors_jan AS visitors, foreign_visitors_jan AS foreign_visitors FROM tourists
UNION ALL
SELECT 
    year, subcategory_code, sub_subcategory_code,
    'February', visitors_feb, foreign_visitors_feb FROM tourists
UNION ALL
SELECT 
    year, subcategory_code, sub_subcategory_code,
    'March', visitors_mar, foreign_visitors_mar FROM tourists
UNION ALL
SELECT 
    year, subcategory_code, sub_subcategory_code,
    'April', visitors_apr, foreign_visitors_apr FROM tourists
UNION ALL
SELECT 
    year, subcategory_code, sub_subcategory_code,
    'May', visitors_may, foreign_visitors_may FROM tourists
UNION ALL
SELECT 
    year, subcategory_code, sub_subcategory_code,
    'June', visitors_jun, foreign_visitors_jun FROM tourists
UNION ALL
SELECT 
    year, subcategory_code, sub_subcategory_code,
    'July', visitors_jul, foreign_visitors_jul FROM tourists
UNION ALL
SELECT 
    year, subcategory_code, sub_subcategory_code,
    'August', visitors_aug, foreign_visitors_aug FROM tourists
UNION ALL
SELECT 
    year, subcategory_code, sub_subcategory_code,
    'September', visitors_sep, foreign_visitors_sep FROM tourists
UNION ALL
SELECT 
    year, subcategory_code, sub_subcategory_code,
    'October', visitors_oct, foreign_visitors_oct FROM tourists
UNION ALL
SELECT 
    year, subcategory_code, sub_subcategory_code,
    'November', visitors_nov, foreign_visitors_nov FROM tourists
UNION ALL
SELECT 
    year, subcategory_code, sub_subcategory_code,
    'December', visitors_dec, foreign_visitors_dec FROM tourists;
    
-- display visitors by months
SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    'January' AS month, 
    SUM(visitors_jan) AS total_visitors, 
    SUM(foreign_visitors_jan) AS total_foreign_visitors
FROM tourists
GROUP BY year, subcategory_code, sub_subcategory_code

UNION ALL

SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    'February', 
    SUM(visitors_feb), 
    SUM(foreign_visitors_feb)
FROM tourists
GROUP BY year, subcategory_code, sub_subcategory_code

UNION ALL

SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    'March', 
    SUM(visitors_mar), 
    SUM(foreign_visitors_mar)
FROM tourists
GROUP BY year, subcategory_code, sub_subcategory_code

UNION ALL

SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    'April', 
    SUM(visitors_apr), 
    SUM(foreign_visitors_apr)
FROM tourists
GROUP BY year, subcategory_code, sub_subcategory_code

UNION ALL

SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    'May', 
    SUM(visitors_may), 
    SUM(foreign_visitors_may)
FROM tourists
GROUP BY year, subcategory_code, sub_subcategory_code

UNION ALL

SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    'June', 
    SUM(visitors_jun), 
    SUM(foreign_visitors_jun)
FROM tourists
GROUP BY year, subcategory_code, sub_subcategory_code

UNION ALL

SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    'July', 
    SUM(visitors_jul), 
    SUM(foreign_visitors_jul)
FROM tourists
GROUP BY year, subcategory_code, sub_subcategory_code

UNION ALL

SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    'August', 
    SUM(visitors_aug), 
    SUM(foreign_visitors_aug)
FROM tourists
GROUP BY year, subcategory_code, sub_subcategory_code

UNION ALL

SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    'September', 
    SUM(visitors_sep), 
    SUM(foreign_visitors_sep)
FROM tourists
GROUP BY year, subcategory_code, sub_subcategory_code

UNION ALL

SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    'October', 
    SUM(visitors_oct), 
    SUM(foreign_visitors_oct)
FROM tourists
GROUP BY year, subcategory_code, sub_subcategory_code

UNION ALL

SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    'November', 
    SUM(visitors_nov), 
    SUM(foreign_visitors_nov)
FROM tourists
GROUP BY year, subcategory_code, sub_subcategory_code

UNION ALL

SELECT 
    year, 
    subcategory_code, 
    sub_subcategory_code, 
    'December', 
    SUM(visitors_dec), 
    SUM(foreign_visitors_dec)
FROM tourists
GROUP BY year, subcategory_code, sub_subcategory_code;

SELECT * FROM category;
DESCRIBE category;


-- join category and tourists tables
WITH MonthlyVisitors AS (
    SELECT 
        year, 
        subcategory_code, 
        sub_subcategory_code, 
        'January' AS month, 
        SUM(visitors_jan) AS total_visitors, 
        SUM(foreign_visitors_jan) AS total_foreign_visitors
    FROM tourists
    GROUP BY year, subcategory_code, sub_subcategory_code
    
    UNION ALL
    
    SELECT 
        year, 
        subcategory_code, 
        sub_subcategory_code, 
        'February', 
        SUM(visitors_feb), 
        SUM(foreign_visitors_feb)
    FROM tourists
    GROUP BY year, subcategory_code, sub_subcategory_code

    UNION ALL
    
    SELECT 
        year, 
        subcategory_code, 
        sub_subcategory_code, 
        'March', 
        SUM(visitors_mar), 
        SUM(foreign_visitors_mar)
    FROM tourists
    GROUP BY year, subcategory_code, sub_subcategory_code

    UNION ALL
    
    SELECT 
        year, 
        subcategory_code, 
        sub_subcategory_code, 
        'April', 
        SUM(visitors_apr), 
        SUM(foreign_visitors_apr)
    FROM tourists
    GROUP BY year, subcategory_code, sub_subcategory_code

    UNION ALL
    
    SELECT 
        year, 
        subcategory_code, 
        sub_subcategory_code, 
        'May', 
        SUM(visitors_may), 
        SUM(foreign_visitors_may)
    FROM tourists
    GROUP BY year, subcategory_code, sub_subcategory_code

    UNION ALL
    
    SELECT 
        year, 
        subcategory_code, 
        sub_subcategory_code, 
        'June', 
        SUM(visitors_jun), 
        SUM(foreign_visitors_jun)
    FROM tourists
    GROUP BY year, subcategory_code, sub_subcategory_code

    UNION ALL
    
    SELECT 
        year, 
        subcategory_code, 
        sub_subcategory_code, 
        'July', 
        SUM(visitors_jul), 
        SUM(foreign_visitors_jul)
    FROM tourists
    GROUP BY year, subcategory_code, sub_subcategory_code

    UNION ALL
    
    SELECT 
        year, 
        subcategory_code, 
        sub_subcategory_code, 
        'August', 
        SUM(visitors_aug), 
        SUM(foreign_visitors_aug)
    FROM tourists
    GROUP BY year, subcategory_code, sub_subcategory_code

    UNION ALL
    
    SELECT 
        year, 
        subcategory_code, 
        sub_subcategory_code, 
        'September', 
        SUM(visitors_sep), 
        SUM(foreign_visitors_sep)
    FROM tourists
    GROUP BY year, subcategory_code, sub_subcategory_code

    UNION ALL
    
    SELECT 
        year, 
        subcategory_code, 
        sub_subcategory_code, 
        'October', 
        SUM(visitors_oct), 
        SUM(foreign_visitors_oct)
    FROM tourists
    GROUP BY year, subcategory_code, sub_subcategory_code

    UNION ALL
    
    SELECT 
        year, 
        subcategory_code, 
        sub_subcategory_code, 
        'November', 
        SUM(visitors_nov), 
        SUM(foreign_visitors_nov)
    FROM tourists
    GROUP BY year, subcategory_code, sub_subcategory_code

    UNION ALL
    
    SELECT 
        year, 
        subcategory_code, 
        sub_subcategory_code, 
        'December', 
        SUM(visitors_dec), 
        SUM(foreign_visitors_dec)
    FROM tourists
    GROUP BY year, subcategory_code, sub_subcategory_code
)

SELECT 
    mv.year, 
    mv.subcategory_code, 
    c.subcategory, 
    mv.sub_subcategory_code, 
    c.sub_subcategory, 
    mv.month, 
    mv.total_visitors, 
    mv.total_foreign_visitors
FROM MonthlyVisitors mv
JOIN category c 
    ON mv.subcategory_code = c.subcategory_code 
    AND mv.sub_subcategory_code = c.sub_subcategory_code;
