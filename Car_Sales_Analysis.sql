/* =====================================================================
   CAR SALES ANALYSIS
   ---------------------------------------------------------------------
   Dataset : Used cars data (table: cars)
   Columns : brand, model, transmission, age, fuel, engine, km, owner,
             price, location, mileage, power, seats, type

   Sections:
     1. Database & Table Setup
     2. Basic Data Exploration
     3. Brand Analysis
     4. Fuel & Transmission Analysis
     5. Location & Owner Analysis
     6. Age, Model & Usage Analysis
     7. Budget & Premium Segments
   ===================================================================== */


/* =====================================================================
   1. DATABASE & TABLE SETUP
   ===================================================================== */

-- Create a new database to store the car data.
CREATE DATABASE car_db;

-- Select the database so that all following queries run inside it.
USE car_db;

-- Create the `cars` table with a column for every attribute in the dataset.
-- Text fields use VARCHAR, whole numbers use INT, and price uses DECIMAL
-- to store exact currency values.
CREATE TABLE cars (
    brand VARCHAR(100),
    model VARCHAR(100),
    transmission VARCHAR(50),
    age INT,
    fuel VARCHAR(50),
    engine VARCHAR(50),
    km INT,
    owner VARCHAR(100),
    price DECIMAL(12,2),
    location VARCHAR(100),
    mileage VARCHAR(50),
    power VARCHAR(50),
    seats INT,
    type VARCHAR(50)
);


/* =====================================================================
   2. BASIC DATA EXPLORATION
   ===================================================================== */

-- View all rows and columns of the table to confirm the data loaded correctly.
SELECT * FROM cars;

-- Count the total number of rows (cars) in the table.
SELECT COUNT(*) FROM cars;

-- Same count as above, but with a readable column name (alias).
SELECT COUNT(*) AS total_cars
FROM cars;


/* =====================================================================
   3. BRAND ANALYSIS
   ===================================================================== */

-- Attempt to count cars per brand.
-- NOTE: This query has no GROUP BY, so it will return an error (or a
-- wrong result) in most SQL modes. The corrected version is the next query.
SELECT brand, COUNT(*) AS total_cars
FROM cars;

-- Number of cars available for each brand, from the most to the least.
SELECT brand, COUNT(*) AS total_cars
FROM cars
GROUP BY brand
ORDER BY total_cars DESC;

-- Average price of each brand, from the most expensive to the cheapest.
-- ROUND(..., 2) limits the average to 2 decimal places.
SELECT 
    brand,
    ROUND(AVG(price), 2) AS average_price
FROM cars
GROUP BY brand
ORDER BY average_price DESC;

-- Top 10 most expensive cars in the dataset, with their age and kilometres driven.
SELECT 
    brand,
    model,
    price,
    age,
    km
FROM cars
ORDER BY price DESC
LIMIT 10;

-- Complete price profile per brand: number of cars, average, minimum and
-- maximum price. Sorted by average price (highest first).
SELECT 
    brand,
    COUNT(*) AS total_cars,
    ROUND(AVG(price), 2) AS average_price,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM cars
GROUP BY brand
ORDER BY average_price DESC;


/* =====================================================================
   4. FUEL & TRANSMISSION ANALYSIS
   ===================================================================== */

-- Number of cars for each fuel type (petrol, diesel, etc.).
SELECT 
    fuel,
    COUNT(*) AS total_cars
FROM cars
GROUP BY fuel
ORDER BY total_cars DESC;

-- Compare manual and automatic cars by count and average price.
SELECT 
    transmission,
    COUNT(*) AS total_cars,
    ROUND(AVG(price), 2) AS average_price
FROM cars
GROUP BY transmission;

-- Combine fuel type and transmission to see which pairing is most common
-- and how the average price differs between them.
SELECT 
    fuel,
    transmission,
    COUNT(*) AS total_cars,
    ROUND(AVG(price), 2) AS average_price
FROM cars
GROUP BY fuel, transmission
ORDER BY total_cars DESC;


/* =====================================================================
   5. LOCATION & OWNER ANALYSIS
   ===================================================================== */

-- Number of cars and average price in each location.
-- Locations with the most cars appear first.
SELECT 
    location,
    COUNT(*) AS total_cars,
    ROUND(AVG(price), 2) AS average_price
FROM cars
GROUP BY location
ORDER BY total_cars DESC;

-- Impact of ownership history on price: number of cars and average price
-- for each owner category (e.g. first owner, second owner).
SELECT 
    owner,
    COUNT(*) AS total_cars,
    ROUND(AVG(price), 2) AS average_price
FROM cars
GROUP BY owner
ORDER BY average_price DESC;


/* =====================================================================
   6. AGE, MODEL & USAGE ANALYSIS
   ===================================================================== */

-- How the car's age affects price: number of cars and average price for
-- each age (in years), from the newest to the oldest.
SELECT 
    age,
    COUNT(*) AS total_cars,
    ROUND(AVG(price), 2) AS average_price
FROM cars
GROUP BY age
ORDER BY age;

-- Top 10 most common brand-and-model combinations in the dataset.
SELECT 
    brand,
    model,
    COUNT(*) AS total_cars
FROM cars
GROUP BY brand, model
ORDER BY total_cars DESC
LIMIT 10;

-- Heavily used cars (more than 100,000 km): how many each brand has
-- and their average price.
SELECT 
    brand,
    COUNT(*) AS high_km_cars,
    ROUND(AVG(price), 2) AS average_price
FROM cars
WHERE km > 100000
GROUP BY brand
ORDER BY high_km_cars DESC;


/* =====================================================================
   7. BUDGET & PREMIUM SEGMENTS
   ===================================================================== */

-- Best-value picks: young cars (5 years old or less) with low usage
-- (50,000 km or less). Shows the 20 cheapest options.
SELECT 
    brand,
    model,
    age,
    km,
    price
FROM cars
WHERE age <= 5
  AND km <= 50000
ORDER BY price ASC
LIMIT 20;

-- Premium segment: cars priced at 10,00,000 (10 lakh) or more.
-- Shows which brands have the most premium cars and their average price.
SELECT 
    brand,
    COUNT(*) AS premium_cars,
    ROUND(AVG(price), 2) AS average_price
FROM cars
WHERE price >= 1000000
GROUP BY brand
ORDER BY premium_cars DESC;
