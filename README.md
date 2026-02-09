# Sales Revenue Analysis for an E-Commerce Platform

## 📊 Introduction
This project performs a sales and revenue analysis on a real-world e-commerce dataset using PostgreSQL.
The main goal is to analyze revenue performance, order dynamics, and product category performance through structured SQL queries.

This project simulates a real analytics workflow:
- 1. Database creation
- 2. Schema design with relational constraints
- 3. Data ingestion
- 4. Business-oriented analytical queries

## 📂 Dataset 
The project usess the [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce), which constrains real transactional data from a Brazilian online marketplace.

This dataset includes information about:
- Customers and sellers
- Orders and orders statuses 
- Producst and product categories
- Payments and reviews 
- Geolocation data

## 🛠️ Tech Stack
- **Database:** PostgreSQL
- **Query Language:** SQL
- **Data Source:** CSV files (Kaggle dataset)
- **Environment:** Visual Studio Code 

## 🔍 ANALYSIS QUESTIONS
#### 1️⃣Executive / Revenue Performance
“How is the business doing?” 
- 1. How much total revenue did the platform generate?
- 2. How does revenue trend monthly?
- 3. Is revenue growing or declining over time?
This section evaluates overall business health and growth trends.

#### 2️⃣ Order & Sales Dynamics
These answer: “How are orders behaving?”
- 1. How many total orders were placed?
- 2. How many orders per month?
- 3. What is the average items per order?
- 4. What percentage of orders are completed vs canceled?

#### 3️⃣ Product Categoryies Performance
These answer: “What products drive revenue?”
- 1. Which product categories generate the highest revenue?
- 2. Which product categories sell the highest quantity?

## 📈 The Analysis

### 💰 Revenue Performance

#### Total Revenue (Delivered & Shipped Orders)

To calculate total revenue from fulfilled transactions, only orders with a status of **`delivered`** or **`shipped`** are considered.  
Revenue is defined as the **sum of item-level product prices** from the order items table.

> **Note:** This metric represents **product revenue only** and does not include freight or shipping charges.

```sql
SELECT 
    SUM(oi.price) AS delivered_items_revenue
FROM order_items_dataset oi
INNER JOIN orders_dataset o 
    ON o.order_id = oi.order_id
WHERE o.order_status IN ('delivered', 'shipped');


Total Items Revenue (Delivered & Shipped Orders) **13 372 225.55**