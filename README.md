# Tech Database Management System

## 📜 Project Overview  
The *Tech Database Management System* is a MySQL-based solution for efficiently managing the operations of an Apple Store. It centralizes product, customer, and order data into structured relational databases, ensuring scalability, enhanced performance, and improved customer experience.

---

## 🎯 Goals  
- *Centralized Data Management:* Unified handling of product, customer, and order information.  
- *Enhanced Customer Experience:* Efficient order tracking and shipment updates.  
- *Efficient Product Management:* Maintain accurate records of inventory, product specifications, and pricing.  
- *Streamlined Order Management:* Record and manage details of customer orders and purchases.  
- *Scalable Database Design:* Support for future expansion and efficient data retrieval.

---

## 🛠️ Features  
- *Product Database:* Manages product details, specifications, stock levels, and pricing.  
- *Customer Database:* Stores customer information, including profiles, contact details, and shipping addresses.  
- *Order Database:* Tracks customer orders, costs, and order statuses.  
- *Order Items Database:* Records individual items, quantities, and prices for each order.  
- *Optimized Query Support:* Efficiently retrieves data, checks inventory, and generates order history.  

---

## 📂 Database Structure  

### 1. *Products Database*
- Fields: Product_ID, Name, Model, Category, Specifications, Price, Stock.  

### 2. *Customers Database*
- Fields: Customer_ID, First Name, Last Name, Email, Phone, Address.  

### 3. *Orders Database*
- Fields: Order_ID, Customer_ID, Order Date, Total Cost, Order Status.  

### 4. *Order Items Database*
- Fields: Order_ID, Product_ID, Quantity, Price.  

### Relationships:  
- *A customer* can place multiple orders.  
- *Each order* can include multiple items linked to the products database.  

---

## 📝 Business Questions (EDA)  
1. *Top-Selling Products:* Identify the most popular products based on quantity sold.  
2. *Low Stock Levels:* Determine which products need restocking based on inventory levels.  

---

## 🔧 Tools & Technologies  
- *Database:* MySQL  
- *Data Management:* CSV, Excel  

---

## 💡 Getting Started  

### Prerequisites:  
- Install [MySQL](https://www.mysql.com/downloads/).  
- Use an SQL client like MySQL Workbench for easy database management.
