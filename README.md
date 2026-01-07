# FlexiMart Data Architecture Project

**Student Name:** Amriza Farnaz  
**Student ID:** bitsom_ba_2507592  
**Email:** farnaz.amriza04@gmail.com  
**Date:** 08/01/2025

## Project Overview

This project builds a complete data architecture for FlexiMart, including relational databases, a NoSQL product catalog, and a data warehouse. It demonstrates ETL pipelines via Python, MongoDB operations, dimensional modeling, and OLAP analytics to support business reporting and decision-making.

## Repository Structure
├── part1-database-etl/
│ ├── etl_pipeline.py
│ ├── schema_documentation.md
│ ├── business_queries.sql
│ └── data_quality_report.txt
├── part2-nosql/
│ ├── nosql_analysis.md
│ ├── mongodb_operations.js
│ └── fleximart_db.products_catalog.json
├── part3-datawarehouse/
│ ├── star_schema_design.md
│ ├── warehouse_schema.sql
│ ├── warehouse_data.sql
│ └── analytics_queries.sql
└── README.md


## Technologies Used

- Python 3.x, pandas, mysql-connector-python
- MySQL 8.0 / PostgreSQL 14
- MongoDB 6.0

## Setup Instructions

### Database Setup

```bash
# Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py

# Run Part 1 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql


### MongoDB Setup

mongosh < part2-nosql/mongodb_operations.js


## Key Learnings

- Learned how to design and implement a **star schema** for a retail sales warehouse.
- Understood how **NoSQL (MongoDB)** handles flexible product data with nested documents and dynamic attributes.
- Gained experience with **ETL pipelines** to extract, transform, and load data into relational and warehouse systems.
- Developed **OLAP queries** to perform drill-down, top-N analysis, and customer segmentation.

## Challenges Faced

1. **Handling different product attributes in MongoDB** – Solved by using embedded documents for specifications and reviews.
2. **Ensuring accurate aggregation in OLAP queries** – Solved by using LEFT JOINs for full customer coverage and `ROLLUP` with `GROUPING` to show year/quarter/month totals.
3. **Loading tables without foreign key violations using Python** – Solved by identifying the correct tables with the relevant columns and joining/merging on common columns to maintain proper FK relationships.
