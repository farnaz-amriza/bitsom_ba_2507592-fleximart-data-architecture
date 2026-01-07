
-- DATA INSERTS FOR FLEXIMART DATA WAREHOUSE
-- Database: fleximart_dw

USE fleximart_dw;

-- INSERT DATA INTO dim_date (30 dates)

INSERT INTO dim_date 
(date_key, full_date, day_of_week, day_of_month, month, month_name, quarter, year, is_weekend)
VALUES
-- January 2024 (15 rows)
(20240101, '2024-01-01', 'Monday', 1, 1, 'January', 'Q1', 2024, FALSE),
(20240103, '2024-01-03', 'Wednesday', 3, 1, 'January', 'Q1', 2024, FALSE),
(20240105, '2024-01-05', 'Friday', 5, 1, 'January', 'Q1', 2024, FALSE),
(20240106, '2024-01-06', 'Saturday', 6, 1, 'January', 'Q1', 2024, TRUE),
(20240108, '2024-01-08', 'Monday', 8, 1, 'January', 'Q1', 2024, FALSE),
(20240110, '2024-01-10', 'Wednesday', 10, 1, 'January', 'Q1', 2024, FALSE),
(20240112, '2024-01-12', 'Friday', 12, 1, 'January', 'Q1', 2024, FALSE),
(20240113, '2024-01-13', 'Saturday', 13, 1, 'January', 'Q1', 2024, TRUE),
(20240115, '2024-01-15', 'Monday', 15, 1, 'January', 'Q1', 2024, FALSE),
(20240117, '2024-01-17', 'Wednesday', 17, 1, 'January', 'Q1', 2024, FALSE),
(20240119, '2024-01-19', 'Friday', 19, 1, 'January', 'Q1', 2024, FALSE),
(20240120, '2024-01-20', 'Saturday', 20, 1, 'January', 'Q1', 2024, TRUE),
(20240123, '2024-01-23', 'Tuesday', 23, 1, 'January', 'Q1', 2024, FALSE),
(20240126, '2024-01-26', 'Friday', 26, 1, 'January', 'Q1', 2024, FALSE),
(20240131, '2024-01-31', 'Wednesday', 31, 1, 'January', 'Q1', 2024, FALSE),

-- February 2024 (15 rows – Leap Year)
(20240201, '2024-02-01', 'Thursday', 1, 2, 'February', 'Q1', 2024, FALSE),
(20240203, '2024-02-03', 'Saturday', 3, 2, 'February', 'Q1', 2024, TRUE),
(20240205, '2024-02-05', 'Monday', 5, 2, 'February', 'Q1', 2024, FALSE),
(20240207, '2024-02-07', 'Wednesday', 7, 2, 'February', 'Q1', 2024, FALSE),
(20240209, '2024-02-09', 'Friday', 9, 2, 'February', 'Q1', 2024, FALSE),
(20240210, '2024-02-10', 'Saturday', 10, 2, 'February', 'Q1', 2024, TRUE),
(20240212, '2024-02-12', 'Monday', 12, 2, 'February', 'Q1', 2024, FALSE),
(20240214, '2024-02-14', 'Wednesday', 14, 2, 'February', 'Q1', 2024, FALSE),
(20240216, '2024-02-16', 'Friday', 16, 2, 'February', 'Q1', 2024, FALSE),
(20240217, '2024-02-17', 'Saturday', 17, 2, 'February', 'Q1', 2024, TRUE),
(20240219, '2024-02-19', 'Monday', 19, 2, 'February', 'Q1', 2024, FALSE),
(20240221, '2024-02-21', 'Wednesday', 21, 2, 'February', 'Q1', 2024, FALSE),
(20240223, '2024-02-23', 'Friday', 23, 2, 'February', 'Q1', 2024, FALSE),
(20240224, '2024-02-24', 'Saturday', 24, 2, 'February', 'Q1', 2024, TRUE),
(20240229, '2024-02-29', 'Thursday', 29, 2, 'February', 'Q1', 2024, FALSE);




-- INSERT DATA INTO dim_product (15 products)

INSERT INTO dim_product 
(product_id, product_name, category, subcategory, unit_price)
VALUES
-- Electronics (6 products)
('ELEC101', 'Apple MacBook Air M2', 'Electronics', 'Laptops', 98000),
('ELEC102', 'Samsung Galaxy S23', 'Electronics', 'Smartphones', 82000),
('ELEC103', 'Sony Bravia 43-inch LED TV', 'Electronics', 'Televisions', 45000),
('ELEC104', 'Bose QuietComfort 45', 'Electronics', 'Audio', 32000),
('ELEC105', 'Logitech MX Master 3S', 'Electronics', 'Accessories', 9500),
('ELEC106', 'Canon EOS 1500D DSLR', 'Electronics', 'Cameras', 38000),

-- Fashion (5 products)
('FASH201', 'Nike Revolution Running Shoes', 'Fashion', 'Footwear', 4200),
('FASH202', 'Levi’s Slim Fit Jeans', 'Fashion', 'Clothing', 3500),
('FASH203', 'Adidas Sports T-Shirt', 'Fashion', 'Clothing', 1500),
('FASH204', 'Puma Casual Sneakers', 'Fashion', 'Footwear', 5800),
('FASH205', 'Ray-Ban Classic Sunglasses', 'Fashion', 'Accessories', 7200),

-- Home & Kitchen (4 products)
('HOME301', 'Philips Mixer Grinder', 'Home & Kitchen', 'Appliances', 6200),
('HOME302', 'Prestige Pressure Cooker 5L', 'Home & Kitchen', 'Cookware', 2800),
('HOME303', 'Ikea Study Table', 'Home & Kitchen', 'Furniture', 9500),
('HOME304', 'Milton Insulated Water Bottle', 'Home & Kitchen', 'Utilities', 850);




-- INSERT DATA INTO dim_customer (12 customers)

INSERT INTO dim_customer (customer_id, customer_name, city, state, customer_segment) VALUES
('CUST001', 'John Doe', 'Mumbai', 'Maharashtra', 'Silver'),
('CUST002', 'Jane Smith', 'Delhi', 'Delhi', 'Gold'),
('CUST003', 'Rajesh Kumar', 'Bangalore', 'Karnataka', 'Bronze'),
('CUST004', 'Anita Patel', 'Mumbai', 'Maharashtra', 'Silver'),
('CUST005', 'Vikram Singh', 'Chennai', 'Tamil Nadu', 'Gold'),
('CUST006', 'Priya Sharma', 'Delhi', 'Delhi', 'Bronze'),
('CUST007', 'Suresh Reddy', 'Bangalore', 'Karnataka', 'Silver'),
('CUST008', 'Neha Kapoor', 'Mumbai', 'Maharashtra', 'Gold'),
('CUST009', 'Amit Verma', 'Chennai', 'Tamil Nadu', 'Silver'),
('CUST010', 'Kiran Iyer', 'Bangalore', 'Karnataka', 'Gold'),
('CUST011', 'Rohit Jain', 'Delhi', 'Delhi', 'Silver'),
('CUST012', 'Simran Kaur', 'Chandigarh', 'Punjab', 'Bronze');



-- INSERT DATA INTO fact_sales (40 transactions)

INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount)
VALUES
-- January 2024 (higher electronics on weekends)
(20240101, 1, 1, 1, 98000, 0, 98000),
(20240103, 2, 2, 1, 82000, 2000, 80000),
(20240105, 7, 3, 2, 4200, 0, 8400),
(20240106, 3, 4, 1, 45000, 0, 45000),
(20240106, 4, 5, 1, 32000, 1000, 31000),
(20240108, 8, 6, 3, 3500, 0, 10500),
(20240110, 9, 7, 2, 1500, 0, 3000),
(20240112, 12, 8, 1, 6200, 0, 6200),
(20240113, 1, 9, 1, 98000, 3000, 95000),
(20240113, 10, 10, 1, 5800, 0, 5800),
(20240115, 5, 11, 2, 9500, 0, 19000),
(20240117, 6, 12, 1, 38000, 0, 38000),
(20240119, 11, 1, 1, 7200, 0, 7200),
(20240120, 2, 2, 2, 82000, 0, 164000),
(20240120, 14, 3, 1, 9500, 0, 9500),
(20240123, 13, 4, 1, 2800, 0, 2800),
(20240126, 7, 5, 2, 4200, 0, 8400),
(20240131, 15, 6, 3, 850, 0, 2550),

-- February 2024 (steady + weekend spikes)
(20240201, 3, 7, 1, 45000, 0, 45000),
(20240203, 4, 8, 1, 32000, 0, 32000),
(20240203, 2, 9, 1, 82000, 2000, 80000),
(20240205, 8, 10, 2, 3500, 0, 7000),
(20240207, 12, 11, 1, 6200, 0, 6200),
(20240209, 9, 12, 3, 1500, 0, 4500),
(20240210, 1, 1, 1, 98000, 0, 98000),
(20240210, 10, 2, 1, 5800, 0, 5800),
(20240212, 5, 3, 2, 9500, 0, 19000),
(20240214, 11, 4, 1, 7200, 0, 7200),
(20240216, 6, 5, 1, 38000, 0, 38000),
(20240217, 2, 6, 2, 82000, 0, 164000),
(20240219, 14, 7, 1, 9500, 0, 9500),
(20240221, 13, 8, 2, 2800, 0, 5600),
(20240223, 7, 9, 1, 4200, 0, 4200),
(20240224, 3, 10, 1, 45000, 0, 45000),
(20240224, 4, 11, 1, 32000, 1000, 31000),
(20240229, 1, 12, 1, 98000, 0, 98000);
