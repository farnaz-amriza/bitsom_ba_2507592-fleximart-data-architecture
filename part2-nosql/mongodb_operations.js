// MongoDB Operations for FlexiMart Product Catalog
// ------------------------------------------------------------
// Database: fleximart_db
// Collection: products
// ------------------------------------------------------------
// Note:
// All queries below were visually executed and validated using MongoDB Compass. 
// This file documents the equivalent MongoDB shell commands with explanations.
// ------------------------------------------------------------


// ============================================================
// Operation 1: Load Data (1 mark)
// ============================================================
// Purpose:
// Load the product catalog data into MongoDB.
//
// Explanation:
// - mongoimport is used to load external JSON data
// - --db specifies the target database
// - --collection specifies the target collection
// - --jsonArray indicates the file contains an array of documents
//
// This step can also be performed via MongoDB Compass
// (Add Data → Import JSON) or terminal.

// mongoimport --db fleximart_db --collection products --file products_catalog.json --jsonArray



// ============================================================
// Operation 2: Basic Query (2 marks)
// ============================================================
// Purpose:
// Retrieve affordable Electronics products for inventory review.
//
// Query explanation :
// - Filters products where category is "Electronics"
// - Filters products priced below 50,000
// - Uses projection to return only business-relevant fields
//   (name, price, stock), reducing unnecessary data output

db.products.find(
  {
    category: "Electronics",        // Select Electronics category
    price: { $lt: 50000 }           // Price less than 50,000
  },
  {
    _id: 0,                         // Exclude internal MongoDB ID
    name: 1,                        // Include product name
    price: 1,                       // Include product price
    stock: 1                        // Include available stock
  }
);



// ============================================================
// Operation 3: Review Analysis (2 marks)
// ============================================================
// Purpose:
// Identify high-quality products based on customer feedback.
//
// Aggregation explanation:
// - $addFields computes average rating from embedded reviews array
// - $match filters products with average rating >= 4.0
// - $project formats the output for analysis and reporting

db.products.aggregate([
  {
    $addFields: {
      avg_rating: { $avg: "$reviews.rating" } // Calculate average review rating
    }
  },
  {
    $match: {
      avg_rating: { $gte: 4.0 }               // Keep only well-rated products
    }
  },
  {
    $project: {
      _id: 0,
      name: 1,
      category: 1,
      avg_rating: 1
    }
  }
]);



// ============================================================
// Operation 4: Update Operation (2 marks)
// ============================================================
// Purpose:
// Add a new customer review to an existing product.
//
// Update explanation:
// - updateOne targets a single product using product_id
// - $push appends a new review object into the reviews array
// - No schema changes are required due to MongoDB's flexible structure
// - new Date() captures the current timestamp automatically

db.products.updateOne(
  { product_id: "ELEC001" },        // Identify product by ID
  {
    $push: {
      reviews: {
        user_id: "U999",
        rating: 4,
        comment: "Good value",
        date: new Date()
      }
    }
  }
);



// ============================================================
// Operation 5: Complex Aggregation (3 marks)
// ============================================================
// Purpose:
// Perform category-level pricing analysis for business insights.
//
// Aggregation explanation:
// - $group aggregates products by category
// - $avg calculates average price per category
// - $sum counts number of products in each category
// - $project formats the output and renames fields
// - $sort orders results by average price (highest first)

db.products.aggregate([
  {
    $group: {
      _id: "$category",              // Group by category
      avg_price: { $avg: "$price" }, // Calculate average price
      product_count: { $sum: 1 }     // Count products per category
    }
  },
  {
    $project: {
      _id: 0,
      category: "$_id",
      avg_price: { $round: ["$avg_price", 2] }, // Round to 2 decimals
      product_count: 1
    }
  },
  {
    $sort: { avg_price: -1 }         // Sort by avg_price descending
  }
]);
