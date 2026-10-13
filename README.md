# SQL--inventory-and-supplier-Project
# 📦 Apex Project: SQL Inventory & Supplier Analysis

**Author: Javed Khizer Mohammad**  
**Tools: SQL (MySQL-style syntax)**

## 🎯 Project Overview
This project uses SQL to explore inventory levels, inventory value, supplier ratings, and supplier distribution in the `Apex_Project` database. The analysis connects two imported tables, `Inventory` and `Suppliers`, to answer eight business questions and identify products requiring replenishment.

## 🗂️ Data Used
- **Inventory:** Product_Name, Category, Units_In_Stock, Unit_Cost, Reorder_Level, Supplier_ID.
- **Suppliers:** Supplier_ID, Supplier_Name, Supplier_Rating, State, Category.
- **Relationship:** Inventory.Supplier_ID = Suppliers.Supplier_ID.

## 📊 Reported Findings
The findings below were supplied with the project queries; the underlying datasets were not independently checked.

| Business Question | Reported Result |
|---|---|
| How many product records are in inventory? | 10 |
| What is the total inventory value at unit cost? | $76,600.00 |
| Which inventory category has the most units? | Electronics: 178 units |
| Which products are below their reorder levels? | Office Chairs, Microwave, Air Fryer |
| Which supplier provides the most product records? | All represented suppliers have equal counts |
| Which supplier has the highest rating? | Supplier 1 |
| Which state has the most supplier records? | California: 11 |
| Which supplier category contributes the most inventory value? | Electronics: $40,000.00 |

## 💻 SQL Queries
```sql
USE Apex_Project;

-- Q1: Count inventory records.
SELECT COUNT(*) AS Total_Products
FROM Inventory;

-- Q2: Calculate inventory value at unit cost.
SELECT SUM(Units_In_Stock * Unit_Cost) AS Inventory_Value
FROM Inventory;

-- Q3: Find the inventory category with the most units.
SELECT Category, SUM(Units_In_Stock) AS Total_Stock
FROM Inventory
GROUP BY Category
ORDER BY Total_Stock DESC
LIMIT 1;

-- Q4: Identify products below their reorder levels.
SELECT Product_Name, Units_In_Stock, Reorder_Level
FROM Inventory
WHERE Units_In_Stock < Reorder_Level;

-- Q5: Rank represented suppliers by product-record count.
SELECT Supplier_ID, COUNT(*) AS Product_Count
FROM Inventory
GROUP BY Supplier_ID
ORDER BY Product_Count DESC;

-- Q6: Find a supplier with the highest rating.
SELECT Supplier_Name, Supplier_Rating
FROM Suppliers
ORDER BY Supplier_Rating DESC
LIMIT 1;

-- Q7: Find the state with the most supplier records.
SELECT State, COUNT(*) AS Supplier_Count
FROM Suppliers
GROUP BY State
ORDER BY Supplier_Count DESC
LIMIT 1;

-- Q8: Find the supplier category with the highest inventory value.
SELECT s.Category,
       SUM(i.Units_In_Stock * i.Unit_Cost) AS Inventory_Value
FROM Inventory AS i
INNER JOIN Suppliers AS s
    ON i.Supplier_ID = s.Supplier_ID
GROUP BY s.Category
ORDER BY Inventory_Value DESC
LIMIT 1;
```

## 🧠 SQL Skills Demonstrated
- Aggregation with `COUNT()` and `SUM()`.
- Filtering with `WHERE`.
- Grouping with `GROUP BY`.
- Ranking results with `ORDER BY` and `LIMIT`.
- Combining tables with `INNER JOIN`.
- Calculating inventory value using stock quantities and unit costs.
- Translating business questions into SQL queries.

## 💡 Business Implications
- Prioritize reviewing Office Chairs, Microwave, and Air Fryer for replenishment because their stock is below the reorder level.
- Use category-level stock and value summaries to guide inventory planning.
- Consider supplier ratings alongside price, delivery reliability, and availability when evaluating suppliers.

## 🔎 Interpretation & Data Checks
- `COUNT(*)` counts rows. The result represents distinct products only if each inventory row represents one unique product.
- Q5 counts product records, not total units supplied, and excludes suppliers with no inventory records.
- Q3 groups by **inventory category**; Q8 groups by **supplier category**. These categories may differ.
- Q3, Q6, Q7, and Q8 return one row; tied leaders require additional handling to show every tied result.
- Verify the reported California count of **11 suppliers** against the Suppliers table. It counts supplier rows and is separate from the 10 inventory records.
- Ensure Suppliers.Supplier_ID is unique before joining; duplicate supplier IDs can inflate inventory-value totals.
- Dollar values follow the currency notation supplied with the project.

## 🚀 How to Run
1. Import the datasets into a MySQL-compatible database named `Apex_Project`.
2. Name the tables `Inventory` and `Suppliers` and confirm the column names match the queries.
3. Execute the queries and compare the output with the reported findings.

## 👤 About the Author
I am Javed Khizer Mohammad, an educator developing practical skills in data analytics. This project showcases my use of SQL to investigate business data and communicate actionable findings.

