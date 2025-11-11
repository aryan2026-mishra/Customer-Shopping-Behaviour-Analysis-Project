🛒 Customer Shopping Behaviour Analysis (SQL Project)
📖 Overview

The Customer Shopping Behaviour Analysis project focuses on exploring an e-commerce dataset to uncover key insights about customer purchasing patterns, demographics, sales trends, and promotional impacts.
Using SQL, this project performs in-depth data cleaning, transformation, and analysis to help businesses make data-driven marketing and sales decisions.

🎯 Problem Statements / Business Objectives

The project addresses the following analytical objectives:

Identify the most popular product categories and items to determine which products drive the highest sales.

Analyze customer demographics (age, gender, location) to understand their influence on purchasing behavior.

Evaluate the impact of discounts and promo codes on overall sales performance.

Find relationships between subscription status and purchase frequency to assess customer loyalty.

Determine which payment methods are most preferred and identify seasons driving the highest sales.

Retrieve the top 5 best-selling categories contributing the most to revenue.

Calculate the average purchase amount by gender to compare spending habits.

Detect customers who used a promo code but didn’t apply a discount to identify potential inconsistencies.

Find the season with the highest average purchase amount for strategic marketing campaigns.

Count total purchases by each payment method to analyze payment preferences.

Identify loyal and high-value customers with more than 5 purchases and review ratings above 4.5.

🧩 Dataset Information

Table Name: shopping_behaviour

Column Name	Description	Data Type
customer_id	Unique ID of the customer	INT
age	Age of the customer	INT
gender	Gender of the customer	VARCHAR(20)
item_purchased	Item bought by the customer	VARCHAR(100)
category	Product category	VARCHAR(50)
purchase_amount_usd	Purchase amount in USD	DECIMAL(10,2)
location	Customer’s location	VARCHAR(100)
size	Product size	VARCHAR(10)
color	Product color	VARCHAR(50)
season	Purchase season	VARCHAR(20)
review_rating	Customer rating (1–5)	FLOAT
subscription_status	Whether the customer is subscribed	VARCHAR(10)
shipping_type	Shipping method used	VARCHAR(50)
discount_applied	Whether a discount was applied	VARCHAR(10)
promo_code_used	Whether a promo code was used	VARCHAR(10)
previous_purchases	Number of past purchases	INT
payment_method	Payment method used	VARCHAR(50)
frequency_of_purchases	How often the customer purchases	VARCHAR(50)
🧠 Technologies Used

MySQL / SQL Workbench – for data cleaning and querying

Excel / CSV – for initial data source

Power BI (optional) – for data visualization

Git & GitHub – for version control and project hosting

⚙️ SQL Operations Performed

Data Cleaning & Transformation

Renamed inconsistent column names to snake_case

Standardized data types (e.g., DECIMAL for currency, VARCHAR for categorical data)

Exploratory Data Analysis (EDA)

Aggregated key metrics using GROUP BY, AVG(), COUNT(), and SUM()

Applied logical filters with CASE, WHERE, and sorting with ORDER BY

Business Insights Extraction

Identified best-selling products, customer segments, and revenue-driving seasons

Detected loyalty and high-value customer behavior
