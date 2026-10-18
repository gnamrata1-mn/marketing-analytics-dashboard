-- Marketing Analytics Portfolio SQL Analysis
-- Synthetic dataset | Portfolio / learning use

-- 1. Channel performance
SELECT Channel,
       SUM(Spend) AS total_spend,
       SUM(Revenue) AS total_revenue,
       SUM(Bookings) AS total_bookings,
       SUM(Revenue)/NULLIF(SUM(Spend),0) AS roas,
       SUM(Spend)/NULLIF(SUM(Bookings),0) AS cpa,
       SUM(Bookings)/NULLIF(SUM(Clicks),0) AS conversion_rate
FROM marketing_data
GROUP BY Channel
ORDER BY roas DESC;

-- 2. Market performance
SELECT Country,
       SUM(Spend) AS total_spend,
       SUM(Revenue) AS total_revenue,
       SUM(Bookings) AS total_bookings,
       SUM(Revenue)/NULLIF(SUM(Spend),0) AS roas
FROM marketing_data
GROUP BY Country
ORDER BY roas DESC;

-- 3. Campaigns above overall ROAS
SELECT Campaign,
       SUM(Spend) AS spend,
       SUM(Revenue) AS revenue,
       SUM(Revenue)/NULLIF(SUM(Spend),0) AS roas
FROM marketing_data
GROUP BY Campaign
HAVING SUM(Revenue)/NULLIF(SUM(Spend),0) >
       (SELECT SUM(Revenue)/NULLIF(SUM(Spend),0) FROM marketing_data)
ORDER BY roas DESC;

-- 4. Device performance
SELECT Device,
       SUM(Bookings) AS bookings,
       SUM(Revenue)/NULLIF(SUM(Spend),0) AS roas,
       SUM(Bookings)/NULLIF(SUM(Clicks),0) AS conversion_rate
FROM marketing_data
GROUP BY Device
ORDER BY roas DESC;

-- 5. Monthly performance
SELECT Month,
       SUM(Spend) AS spend,
       SUM(Revenue) AS revenue,
       SUM(Bookings) AS bookings
FROM marketing_data
GROUP BY Month
ORDER BY Month;

-- Corresponding result tables are included in the Excel workbook.
