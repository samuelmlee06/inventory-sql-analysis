-- ============================================
-- Retail Inventory Analysis with SQL
-- SQLite
-- ============================================


-- 1. Preview inventory data
SELECT
    "Part#/Style#",
    SKU,
    Brand,
    Name,
    Quantity
FROM inventory
LIMIT 10;


-- 2. Find total inventory for one product style
SELECT
    "Part#/Style#",
    SUM(Quantity) AS total_inventory
FROM inventory
WHERE "Part#/Style#" = 'FK2355'
GROUP BY "Part#/Style#";


-- 3. Total inventory by brand
SELECT
    Brand,
    SUM(Quantity) AS total_units
FROM inventory
GROUP BY Brand
ORDER BY total_units DESC;


-- 4. Count inventory records by brand
SELECT
    Brand,
    COUNT(*) AS product_count
FROM inventory
GROUP BY Brand
ORDER BY product_count DESC;


-- 5. Total inventory by product style
SELECT
    "Part#/Style#",
    Brand,
    SUM(Quantity) AS total_units
FROM inventory
GROUP BY "Part#/Style#", Brand
ORDER BY total_units DESC;


-- 6. Find low-stock products
-- Change 20 to any inventory threshold you want
SELECT
    "Part#/Style#",
    Brand,
    SUM(Quantity) AS total_units
FROM inventory
GROUP BY "Part#/Style#", Brand
HAVING SUM(Quantity) < 20
ORDER BY total_units ASC;


-- 7. Find duplicate SKUs
SELECT
    SKU,
    COUNT(*) AS occurrences
FROM inventory
GROUP BY SKU
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;


-- 8. Find products missing a brand
SELECT
    SKU,
    "Part#/Style#",
    Name
FROM inventory
WHERE Brand IS NULL
   OR Brand = '';


-- 9. Categorize inventory levels using CASE WHEN
SELECT
    "Part#/Style#",
    Brand,
    SUM(Quantity) AS total_units,

    CASE
        WHEN SUM(Quantity) < 10 THEN 'Low Stock'
        WHEN SUM(Quantity) < 50 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS inventory_status

FROM inventory
GROUP BY "Part#/Style#", Brand
ORDER BY total_units ASC;


-- 10. Find brands with more inventory than the average brand
SELECT
    Brand,
    SUM(Quantity) AS total_units
FROM inventory
GROUP BY Brand
HAVING SUM(Quantity) > (
    SELECT AVG(brand_total)
    FROM (
        SELECT
            SUM(Quantity) AS brand_total
        FROM inventory
        GROUP BY Brand
    )
)
ORDER BY total_units DESC;


-- 11. Use a CTE to summarize inventory by style
WITH style_inventory AS (

    SELECT
        "Part#/Style#" AS style_number,
        Brand,
        SUM(Quantity) AS total_units
    FROM inventory
    GROUP BY "Part#/Style#", Brand

)

SELECT *
FROM style_inventory
ORDER BY total_units DESC;


-- 12. Find the top 10 product styles by inventory
WITH style_inventory AS (

    SELECT
        "Part#/Style#" AS style_number,
        Brand,
        SUM(Quantity) AS total_units
    FROM inventory
    GROUP BY "Part#/Style#", Brand

)

SELECT
    style_number,
    Brand,
    total_units
FROM style_inventory
ORDER BY total_units DESC
LIMIT 10;


-- 13. Inventory breakdown by brand and size
SELECT
    Brand,
    size,
    SUM(Quantity) AS total_units
FROM inventory
GROUP BY Brand, size
ORDER BY Brand, total_units DESC;


-- 14. Count unique product styles by brand
SELECT
    Brand,
    COUNT(DISTINCT "Part#/Style#") AS unique_styles
FROM inventory
GROUP BY Brand
ORDER BY unique_styles DESC;


-- 15. Find a specific brand
-- Replace Nike with any brand you want
SELECT
    SKU,
    "Part#/Style#",
    Name,
    size,
    Quantity
FROM inventory
WHERE Brand = 'Nike'
ORDER BY "Part#/Style#";
