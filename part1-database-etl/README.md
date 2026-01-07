# FlexiMart Data Architecture Project

## Part 1: Executive Overview

Part 1 of the assessment focuses on designing and implementing a normalized relational database and an end-to-end ETL pipeline for the FlexiMart retail dataset. 
The objective is to transform raw CSV files containing data quality issues into a clean, structured MySQL database that supports reliable transactional analysis.

A relational schema adhering to **Third Normal Form (3NF)** was developed, comprising customers, products, orders, and order_items tables. 
Surrogate keys were used as primary keys to ensure stable relationships and simplify joins, while foreign key constraints were enforced to maintain referential integrity. 
This design separates order-level and line-item data, enabling accurate aggregation and scalable querying.

The ETL pipeline, built using Python (Pandas) and MySQL, performs data extraction, cleaning, transformation, and dependency-aware loading. 
Key transformations include deduplication, standardization, data type alignment, and derivation of calculated fields such as order item subtotals. 
Data is loaded in a controlled sequence (customers -> products -> orders -> order_items) to preserve foreign key relationships, resulting in a clean, validated database ready for downstream analytics.
The pipeline includes validation steps to:
 1) Verify successful foreign key mapping
 2) Detect unmatched records before loading
 3) Ensure numeric and date fields conform to schema definitions

SQL business/validation queries were executed post-load to confirm that all relationships between tables were correctly maintained.

By the end of Part 1, a clean, normalized relational database was successfully populated from raw source files using a reproducible ETL pipeline. 
The resulting database supports accurate transactional analysis and serves as a reliable foundation for downstream analytics and reporting tasks
