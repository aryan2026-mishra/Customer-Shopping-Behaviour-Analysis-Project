-- ✅ Step 1: Select the correct database
USE Market;

-- ✅ Step 2: Clean and standardize column names (adjust only if exact names match)
-- 🔸 Before running this, verify column names using: SHOW COLUMNS FROM shopping_behaviour;
ALTER TABLE shopping_behaviour
CHANGE `Customer_ID` customer_id INT,
CHANGE `Age` age INT,
CHANGE `Gender` gender VARCHAR(20),
CHANGE `Item_Purchased` item_purchased VARCHAR(100),
CHANGE `Category` category VARCHAR(50),
CHANGE `Purchase_Amount_USD` purchase_amount_usd DECIMAL(10,2),
CHANGE `Location` location VARCHAR(100),
CHANGE `Size` size VARCHAR(10),
CHANGE `Color` color VARCHAR(50),
CHANGE `Season` season VARCHAR(20),
CHANGE `Review_Rating` review_rating FLOAT,
CHANGE `Subscription_Status` subscription_status VARCHAR(10),
CHANGE `Shipping_Type` shipping_type VARCHAR(50),
CHANGE `Discount_Applied` discount_applied VARCHAR(10),
CHANGE `Promo_Code_Used` promo_code_used VARCHAR(10),
CHANGE `Previous_Purchases` previous_purchases INT,
CHANGE `Payment_Method` payment_method VARCHAR(50),
CHANGE `Frequency_of_Purchases` frequency_of_purchases VARCHAR(50);

-- ✅ Step 3: Verify data
SELECT * FROM shopping_behaviour LIMIT 10;

----------------------------------------------------------
-- 🧩 INSIGHT 1: Identify the most popular product categories and items
----------------------------------------------------------
SELECT category, item_purchased, COUNT(*) AS total_purchases
FROM shopping_behaviour
GROUP BY category, item_purchased
ORDER BY total_purchases DESC
LIMIT 10;

----------------------------------------------------------
-- 🧩 INSIGHT 2: Analyze demographics (age, gender, location) influence
----------------------------------------------------------
SELECT gender, location, 
       AVG(purchase_amount_usd) AS avg_spent, 
       AVG(age) AS avg_age
FROM shopping_behaviour
GROUP BY gender, location
ORDER BY avg_spent DESC;

----------------------------------------------------------
-- 🧩 INSIGHT 3: Impact of discounts and promo codes on sales
----------------------------------------------------------
SELECT discount_applied, promo_code_used, 
       COUNT(*) AS total_orders, 
       SUM(purchase_amount_usd) AS total_revenue
FROM shopping_behaviour
GROUP BY discount_applied, promo_code_used
ORDER BY total_revenue DESC;

----------------------------------------------------------
-- 🧩 INSIGHT 4: Subscription status vs purchase frequency
----------------------------------------------------------
SELECT subscription_status,
       frequency_of_purchases,
       COUNT(*) AS customer_count
FROM shopping_behaviour
GROUP BY subscription_status, frequency_of_purchases
ORDER BY customer_count DESC;

----------------------------------------------------------
-- 🧩 INSIGHT 5: Most used payment methods
----------------------------------------------------------
SELECT payment_method, COUNT(*) AS total_transactions
FROM shopping_behaviour
GROUP BY payment_method
ORDER BY total_transactions DESC;

----------------------------------------------------------
-- 🧩 INSIGHT 6: Seasons driving highest total revenue
----------------------------------------------------------
SELECT season,
       COUNT(payment_method) AS total_transactions,
       SUM(purchase_amount_usd) AS total_revenue
FROM shopping_behaviour
GROUP BY season
ORDER BY total_revenue DESC;

----------------------------------------------------------
-- 🧩 INSIGHT 7: Top 5 best-selling items by revenue
----------------------------------------------------------
SELECT item_purchased,
       SUM(purchase_amount_usd) AS total_revenue
FROM shopping_behaviour
GROUP BY item_purchased
ORDER BY total_revenue DESC
LIMIT 5;

----------------------------------------------------------
-- 🧩 INSIGHT 8: Average purchase by gender
----------------------------------------------------------
SELECT gender,
       AVG(purchase_amount_usd) AS avg_purchase
FROM shopping_behaviour
GROUP BY gender;

----------------------------------------------------------
-- 🧩 INSIGHT 9: Customers who used promo code but didn’t apply discount
----------------------------------------------------------
SELECT customer_id,
       CASE 
           WHEN promo_code_used = 'Yes' AND discount_applied = 'No' 
           THEN 'Promo Used - Discount Not Applied'
           ELSE 'Valid/Applied'
       END AS discount_validation
FROM shopping_behaviour;

----------------------------------------------------------
-- 🧩 INSIGHT 10: Season with highest average purchase amount
----------------------------------------------------------
SELECT season,
       AVG(purchase_amount_usd) AS avg_purchase_amount
FROM shopping_behaviour
GROUP BY season
ORDER BY avg_purchase_amount DESC
LIMIT 5;

----------------------------------------------------------
-- 🧩 INSIGHT 11: Total purchases by payment method
----------------------------------------------------------
SELECT payment_method,
       SUM(purchase_amount_usd) AS total_purchase,
       COUNT(*) AS total_orders
FROM shopping_behaviour
WHERE payment_method IN ('Venmo','Cash','Credit Card','PayPal','Bank Transfer','Debit Card')
GROUP BY payment_method
ORDER BY total_purchase DESC;

----------------------------------------------------------
-- 🧩 INSIGHT 12: Loyal and high-rating customers
----------------------------------------------------------
SELECT customer_id
FROM shopping_behaviour
WHERE previous_purchases > 5
  AND review_rating > 4.5;
