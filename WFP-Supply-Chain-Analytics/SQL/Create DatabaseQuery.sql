/*=========================================================
                CREATE DATABASE
=========================================================*/
CREATE DATABASE Ecommerce_Analysis;

USE Ecommerce_Analysis;
/*=========================================================
                CREATE TABLE
=========================================================*/
CREATE TABLE OnlineRetailClean (
	InvoiceNo VARCHAR(20),
	StockCode VARCHAR(20),
	Description VARCHAR(250),
	Quantity INT,
	InvoiceDate DATETIME,
	UnitePrice DECIMAL(10,2),
	CustomerId VARCHAR(20),
	Country VARCHAR(100),
	SalesAmount DECIMAL(18,2)
);
SELECT TOP 10 * FROM OnlineRetailClean;
SELECT COUNT(*) AS TotalRows
FROM OnlineRetailClean;
/*=========================================================
                BUSINESS QUERIES
=========================================================*/
--FIRST BUSINESS QUESTION"How much revenue did the company generate?"
SELECT
	SUM(Sales_Amount) AS Total_Revenue
FROM OnlineRetailClean;

-- SECOUND BUSNIESS QUESTION "How many transactions are there?"
SELECT 
	COUNT(*) AS Total_no_of_Rows ,
	COUNT (DISTINCT InvoiceNo) as Total_no_of_Unique_Invoice
FROM OnlineRetailClean;

--Top 10 Countries by revenue
SELECT TOP 10
	Country,
	SUM(Sales_Amount) as Revenue
FROM OnlineRetailClean
GROUP BY Country
ORDER BY SUM(Sales_Amount) DESC;

--Question 1 How many sales transactions occurred in the United Kingdom?
SELECT 
	COUNT(*)
FROM OnlineRetailClean
WHERE Country = 'United Kingdom';

