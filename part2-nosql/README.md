# Part 2: NoSQL Database Analysis

## Overview
Part 2 explores the use of **MongoDB** for FlexiMart’s expanding product catalog. Unlike relational databases, MongoDB can handle diverse product attributes, nested customer reviews, and frequent schema changes while supporting horizontal scalability. This part combines theoretical analysis with practical implementation of key MongoDB operations.

## Objectives
- **NoSQL Justification:** Explain RDBMS limitations, MongoDB benefits, and trade-offs.  
- **MongoDB Implementation:** Load sample JSON data and perform queries, updates, and aggregations.

## Sample Data
`products_catalog.json` contains 10 products across multiple categories, with nested fields for specifications and reviews.

## Key Tasks
1. Load data into the `products` collection.  
2. Query products by category and price.  
3. Aggregate reviews to find highly rated products.  
4. Update product reviews.  
5. Compute average price and product count per category.  

## Outcome
This part demonstrates the ability to leverage a NoSQL database for flexible, scalable retail data storage and analysis while performing advanced queries and aggregations.
