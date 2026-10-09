-- View sample inventory data
SELECT "Part#/Style#", Brand, Quantity
FROM inventory
LIMIT 10;

-- Total inventory for a specific style
SELECT SUM(Quantity) AS total_inventory
FROM inventory
WHERE "Part#/Style#" = 'FK2355';

-- Total inventory by brand
SELECT Brand, SUM(Quantity) AS total_units
FROM inventory
GROUP BY Brand
ORDER BY total_units DESC;

-- Count products by brand
SELECT Brand, COUNT(*) AS product_count
FROM inventory
GROUP BY Brand
ORDER BY product_count DESC;
