-- SQL Project - EDA

-- https://www.kaggle.com/datasets/bhadramohit/customer-shopping-latest-trends-dataset/data

-- First thing I did was verify the data imported correctly. I`m only looking at the first 10 rows and not the entire dataset.
SELECT * 
FROM shopping_trends 
LIMIT 10;

-- Getting an overview of the data
SELECT COUNT(*) AS Total_Records,
COUNT(DISTINCT `Customer ID`) AS Unique_Customers 
FROM shopping_trends;

-- Checking for missing values
SELECT 
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Missing_Gender,
    SUM(CASE WHEN `Item Purchased` IS NULL THEN 1 ELSE 0 END) AS Missing_Items,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Missing_Category,
    SUM(CASE WHEN `Purchased Amount (USD)` IS NULL THEN 1 ELSE 0 END) AS Missing_Amount,
    SUM(CASE WHEN Location IS NULL THEN 1 ELSE 0 END) AS Missing_Location,
    SUM(CASE WHEN Size IS NULL THEN 1 ELSE 0 END) AS Missing_Size,
    SUM(CASE WHEN Color IS NULL THEN 1 ELSE 0 END) AS Missing_Color,
    SUM(CASE WHEN Season IS NULL THEN 1 ELSE 0 END) AS Missing_Season,
    SUM(CASE WHEN `Review Rating` IS NULL THEN 1 ELSE 0 END) AS Missing_Rating,
    SUM(CASE WHEN `Subscription Status` IS NULL THEN 1 ELSE 0 END) AS Missing_Status,
    SUM(CASE WHEN `Payment Method` IS NULL THEN 1 ELSE 0 END) AS Missing_Payment,
    SUM(CASE WHEN `Shipping Type` IS NULL THEN 1 ELSE 0 END) AS Missing_Shipping,
    SUM(CASE WHEN `Discount Applied` IS NULL THEN 1 ELSE 0 END) AS Missing_Discount,
    SUM(CASE WHEN `Promo Code Used` IS NULL THEN 1 ELSE 0 END) AS Missing_Promo,
    SUM(CASE WHEN `Previous Purchases` IS NULL THEN 1 ELSE 0 END) AS Missing_Purchases,
    SUM(CASE WHEN `Preferred Payment Method` IS NULL THEN 1 ELSE 0 END) AS Missing_PrefPayment,
    SUM(CASE WHEN `Frequency of Purchases` IS NULL THEN 1 ELSE 0 END) AS Missing_Frequency
FROM shopping_trends;

-- Descriptive statistics for Puchase Amounts
SELECT 
    MIN(`Purchase Amount (USD)`) AS Min_Purchase,
    MAX(`Purchase Amount (USD)`) AS Max_Purchase,
    AVG(`Purchase Amount (USD)`) AS Avg_Purchase,
    STDDEV(`Purchase Amount (USD)`) AS StdDev_Purchase
FROM shopping_trends;

-- Finding the most popular category
SELECT Category, COUNT(*) AS Total_Sold
FROM shopping_trends
GROUP BY Category
ORDER BY Total_Sold DESC;

-- Amount purchased by season
SELECT Season, SUM(`Purchase Amount (USD)`) AS Total_Sales
FROM shopping_trends
GROUP BY Season
ORDER BY Total_Sales DESC;

-- Customer Demographics
SELECT Gender, AVG(`Purchase Amount (USD)`) AS Avg_Spend
FROM shopping_trends
GROUP BY Gender;

-- Behavioral Analysis
SELECT `Discount Applied`, COUNT(*) AS Transactions
FROM shopping_trends
GROUP BY `Discount Applied`;














