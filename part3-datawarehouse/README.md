# Part 3: Data Warehouse and Analytics

## Overview
Part 3 focuses on building a **data warehouse** for FlexiMart to analyze historical sales. 
A **star schema** was designed with `fact_sales` as the central fact table and `dim_date`, `dim_product`, and `dim_customer` as dimensions. 
This schema supports transaction-level granularity for detailed drill-down and roll-up analytics.

## Objectives
- **Star Schema Design:** Documented the fact and dimension tables, including measures, foreign keys, and design decisions.  
- **Data Loading:** Populated the warehouse with sample data (dim_date: 30 dates, dim_product: 15 products, dim_customer: 12 customers, fact_sales: 40 transactions) ensuring referential integrity and realistic patterns.  
- **OLAP Analytics Queries:** Generated SQL queries for:
  1. **Monthly Sales Drill-Down** – aggregate sales by year, quarter, month.  
  2. **Top Products Analysis** – identify top 10 products by revenue and contribution percentage.  
  3. **Customer Segmentation** – categorize customers into High, Medium, Low value segments with total and average revenue.

## Outcome
By the end of Part 3, a functioning data warehouse was implemented with realistic data, supporting multidimensional analysis and decision-making insights through drill-down, top-N, and segmentation queries.
