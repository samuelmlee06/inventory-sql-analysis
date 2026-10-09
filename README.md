# Retail Inventory Analysis with SQL

## Overview

This project demonstrates how SQL can be used to analyze retail inventory data using SQLite.

The dataset is a sanitized sample based on a real retail inventory structure. Sensitive operational values were removed or replaced with dummy data before being used for this project.

The goal was to practice practical SQL analysis that could be applied to inventory, operations, and supply chain workflows.

## Skills Demonstrated

- SQL
- SQLite
- Data filtering
- Aggregation
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `COUNT`
- `SUM`
- `COUNT(DISTINCT)`
- `CASE WHEN`
- Subqueries
- Common Table Expressions (CTEs)
- Duplicate detection
- Inventory analysis

## Business Questions Explored

The SQL queries in this project answer questions such as:

- What is the total inventory for a specific product style?
- Which brands have the most inventory?
- How many unique product styles exist by brand?
- Which products have low inventory?
- Are there duplicate SKU records?
- How can inventory levels be categorized as low, medium, or high?
- Which product styles have the highest inventory?
- How does inventory vary by brand and size?
- Which brands have inventory above the average brand total?

## Project Files

- `sample_inventory.csv` — sanitized retail inventory dataset used for analysis
- `inventory_queries.sql` — SQL queries used to analyze the dataset
- `README.md` — project overview and instructions

## How to Run

### 1. Open SQLite

```bash
sqlite3 inventory.db
```

### 2. Import the CSV

```text
.mode csv
.import sample_inventory.csv inventory
```

### 3. Make Results Easier to Read

```text
.headers on
.mode column
```

### 4. Run the SQL Analysis

```text
.read inventory_queries.sql
```

## Example Query

```sql
SELECT
    Brand,
    SUM(Quantity) AS total_units
FROM inventory
GROUP BY Brand
ORDER BY total_units DESC;
```

This query groups inventory records by brand, calculates total inventory for each brand, and sorts the results from highest to lowest.

## Dataset Privacy

The dataset in this repository is a sanitized sample created for demonstration purposes.

Sensitive company information has been removed or replaced. Inventory quantities, pricing, and other operational values do not reflect actual company data.

## Tools

- SQLite
- SQL
- CSV
- GitHub

## Purpose

This project was created to strengthen practical SQL skills and demonstrate how SQL can be applied to inventory, operations, and supply chain analysis.

## Author

**Samuel Lee**  
Georgia Institute of Technology

This project was independently created for portfolio and educational purposes.

© 2026 Samuel Lee. All rights reserved. This project is provided for portfolio and educational viewing purposes.
