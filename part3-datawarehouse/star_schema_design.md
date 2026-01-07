**Section 1: Schema Overview**



**FACT TABLE: fact\_sales**

**Grain:** One row per product per order line item

**Business Process:** Sales transactions



**Measures (Numeric Facts):**



quantity\_sold: Number of units sold



unit\_price: Price per unit at time of sale



discount\_amount: Discount applied



total\_amount: Final amount (quantity\_sold × unit\_price - discount\_amount)



**Foreign Keys:**



date\_key → dim\_date



product\_key → dim\_product



customer\_key → dim\_customer



**DIMENSION TABLE: dim\_date**



**Purpose:** Date dimension for time-based analysis

**Type:** Conformed dimension



**Attributes:**



date\_key (PK): Surrogate key (YYYYMMDD)



full\_date: Actual date



day\_of\_week: Monday, Tuesday, etc.



month: 1–12



month\_name: January, February, etc.



quarter: Q1, Q2, Q3, Q4



year: 2023, 2024, etc.



is\_weekend: Boolean





**DIMENSION TABLE: dim\_product**



**Purpose:** Product details for drill-down analysis



**Attributes:**



product\_key (PK): Surrogate key



product\_id: Original product ID from source



product\_name



category



subcategory



brand



price\_range: Low/Medium/High (for reporting)



tags: Array of tags 





**DIMENSION TABLE: dim\_customer**



**Purpose:** Customer information for sales analysis

**Attributes:**



customer\_key (PK): Surrogate key



customer\_id: Original ID from source



customer\_name



city



state



country



loyalty\_tier: Bronze/Silver/Gold



email





---



**Section 2: Design Decisions**



I chose transaction line-item granularity to capture each product in every order separately, allowing precise sales, inventory, and discount analysis. This level enables detailed drill-down (e.g., by product, customer, or date) and roll-up (e.g., daily, monthly, quarterly sales).



Surrogate keys were used instead of natural keys to maintain stable references in the data warehouse, decoupled from operational system changes. Surrogates simplify joins, reduce storage size, and support slowly changing dimensions.



The star schema supports fast analytical queries because fact tables contain numeric measures and foreign keys while dimensions provide descriptive context. Aggregations, such as total sales by category or revenue per city, are straightforward. This design ensures flexibility for generating dashboards, KPIs, and trend analyses while keeping the warehouse efficient and maintainable.





---



**Section 3: Sample Data Flow**



Source Transaction:

Order #101, Customer "Sadhana Bommu", Product "G15 Gaming Laptop", Qty: 2, Price: 89,700



In Data Warehouse:



fact\_sales:



{

  "date\_key": 20240115,

  "product\_key": 5,

  "customer\_key": 12,

  "quantity\_sold": 2,

  "unit\_price": 89700,

  "discount\_amount": 0,

  "total\_amount": 179400

}





dim\_date:



{

  "date\_key": 20240115,

  "full\_date": "2024-01-15",

  "day\_of\_week": "Monday",

  "month": 1,

  "month\_name": "January",

  "quarter": "Q1",

  "year": 2024,

  "is\_weekend": false

}





dim\_product:



{

  "product\_key": 5,

  "product\_name": "G15 Gaming Laptop",

  "category": "Electronics",

  "subcategory": "Laptops",

  "brand": "Dell",

  "price\_range": "High",

  "tags": \["electronics", "laptop", "dell", "gaming"]

}





dim\_customer:



{

  "customer\_key": 12,

  "customer\_name": "Sadhana Bommu",

  "city": "Mumbai",

  "state": "Maharashtra",

  "country": "India",

  "loyalty\_tier": "Silver"

  "email": "sadhana.bommu@gmail.com"

}





**Explanation:**

The transaction flows from the source system into a normalized dimensional model, where the fact table stores quantitative measures, and dimension tables provide context. This structure enables rapid analytical reporting, drill-down by product, customer, or date, and roll-up for aggregated trends.

