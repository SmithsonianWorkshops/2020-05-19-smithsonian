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
--SELECT *
--FROM surveys
--WHERE year >= 2000;

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

