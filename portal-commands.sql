-- First SELECT statement
SELECT year
FROM surveys;

-- SELECT more than one field
SELECT year, month, day
FROM surveys;

-- SELECT all fields
SELECT *
FROM surveys;

-- WHERE: filters data that is shown
SELECT *
FROM surveys
WHERE species_id='DM';

-- WHERE: multiple values
SELECT *
FROM surveys
WHERE species_id = 'DM' OR species_id = 'DO';

-- WHERE: numeric columns
SELECT *
FROM surveys
WHERE year >= 2000;

-- WHERE: using AND
SELECT *
FROM surveys
WHERE year >= 2000 AND species_id = 'DM';

-- DISTINCT: unique values
SELECT DISTINCT species_id
FROM surveys;

-- DISTINCT more than one column
SELECT DISTINCT year, species_id
FROM surveys;

-- Calculated values
SELECT year, month, day, weight/1000
FROM surveys;

-- ROUND
SELECT year, month, day, ROUND(weight/1000, 2)
FROM surveys;

-- AS change label
SELECT year, month, day, ROUND(weight/1000, 2) AS weight_kg
FROM surveys;

-- Write a query that returns the plot_id, species_id, sex, and weight in mg.
SELECT plot_id, species_id, sex, weight*1000
FROM surveys;

-- Ordering of results: ORDER BY
SELECT plot_id, species_id, sex, weight*1000 AS weight_mg
FROM surveys
ORDER BY weight_mg;

-- ORDER BY: Descending
SELECT plot_id, species_id, sex, weight*1000 AS weight_mg
FROM surveys
ORDER BY weight_mg DESC;

-- ORDER BY: multiple fields (DESC and ASC)

SELECT plot_id, species_id, sex, weight*1000 AS weight_mg
FROM surveys
ORDER BY species_id ASC, weight_mg DESC;

-- COUNT
SELECT COUNT(*)
FROM surveys;

-- COUNT and summary
SELECT COUNT(*), SUM(weight)
FROM surveys;

-- Write a query that returns the total weight, average weight,
-- minimum and maximum weights for all animals caught over
-- the duration of the survey.
-- Can you modify it so that it calculates these values only for animals >= 5 and <10 grams?
SELECT SUM(weight), AVG(weight), max(weight), min(weight)
FROM surveys
WHERE weight >=5 AND weight <10;

-- GROUP BY
SELECT species_id, SUM(weight), AVG(weight), max(weight), min(weight)
FROM surveys
GROUP BY species_id;

-- HAVING
SELECT species_id, SUM(weight), AVG(weight), max(weight), min(weight)
FROM surveys
GROUP BY species_id
HAVING AVG(weight) >= 20;

-- NULL values
SELECT AVG(weight)
FROM surveys;
-- 42.67

SELECT SUM(weight) / COUNT(*)
FROM surveys;
-- 38.75

-- Exclude null values
SELECT SUM(weight) / COUNT(*)
FROM surveys
WHERE weight IS NOT NULL;

-- NULLS in WHERE !=
SELECT COUNT(*)
FROM surveys
WHERE sex != 'F';
-- 17348

SELECT COUNT(*)
FROM surveys
WHERE sex = 'M';
-- 17348

SELECT COUNT(*)
FROM surveys
WHERE sex != 'F' OR sex IS NULL;
-- 19859: includes NULL values