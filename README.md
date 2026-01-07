\# FlexiMart Data Architecture Project

\*\*Student Name:\*\* Amriza Farnaz  

\*\*Student ID:\*\*   bitsom\_ba\_2507592

\*\*Email:\*\* Farnaz.amriza04@gmail.com  

\*\*Date:\*\* \[08/01/2025]

\## Project Overview

This project builds a complete data architecture for FlexiMart, including relational databases, a NoSQL product catalog, and a data warehouse. It demonstrates ETL pipelines via Python, MongoDB operations, dimensional modeling, and OLAP analytics to support business reporting and decision-making.


\## Repository Structure

├── part1-database-etl/

│ ├── etl\_pipeline.py

│ ├── schema\_documentation.md

│ ├── business\_queries.sql

│ └── data\_quality\_report.txt

├── part2-nosql/

│ ├── nosql\_analysis.md

│ ├── mongodb\_operations.js

│ └── fleximart\_db.products\_catalog.json

├── part3-datawarehouse/

│ ├── star\_schema\_design.md

│ ├── warehouse\_schema.sql

│ ├── warehouse\_data.sql

│ └── analytics\_queries.sql

└── README.md


\## Technologies Used

\- \*\*Python 3.x\*\*, `pandas`, `mysql-connector-python`  

\- \*\*MySQL 8.0\*\* / \*\*PostgreSQL 14\*\*  

\- \*\*MongoDB 6.0\*\*  


\## Setup Instructions

\### Relational Database Setup

```bash

\# Create databases

mysql -u root -p -e "CREATE DATABASE fleximart;"

mysql -u root -p -e "CREATE DATABASE fleximart\_dw;"

\# Run Part 1 - ETL Pipeline

python part1-database-etl/etl\_pipeline.py

\# Run Part 1 - Business Queries

mysql -u root -p fleximart < part1-database-etl/business\_queries.sql


\# Load schema

mysql -u root -p fleximart\_dw < part3-datawarehouse/warehouse\_schema.sql

\# Load data

mysql -u root -p fleximart\_dw < part3-datawarehouse/warehouse\_data.sql

\# Run analytics queries

mysql -u root -p fleximart\_dw < part3-datawarehouse/analytics\_queries.sql

\# Run MongoDB operations in mongosh

mongosh < part2-nosql/mongodb\_operations.js



\## **Key Learnings:** 

Learned how to design and implement a star schema for a retail sales warehouse. Understood how NoSQL (MongoDB) handles flexible product data with nested documents and dynamic attributes.
Gained experience with ETL pipelines to extract, transform, and load data into relational and warehouse systems. Developed OLAP queries to perform drill-down, top-N analysis, and customer segmentation.


\##**Challenges Faced:** 
1. Handling different product attributes in MongoDB – Solved by using embedded documents for specifications and reviews.
2. Ensuring accurate aggregation in OLAP queries – Solved by using LEFT JOINs for full customer coverage and ROLLUP with GROUPING to show year/quarter/month totals.
3. Loading tables without foreign key violation using Python - Solved by identifying the correct tables with the relevant columns and then joining/merging on common columns to get the desired FK connection. 

