USE healthcare_readmission;

-- =================================================
-- ANALYSIS 1: READMISSION RATE BY AGE GROUP
-- Objective: Identify age groups with higher
-- 30-day hospital readmission rates.
-- =================================================

-- SELECT
--     age,
--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,

--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate

-- FROM diabetes_readmission

-- GROUP BY age

-- ORDER BY age;

-- ANALYSIS 2: READMISSION RATE BY GENDER
-- Objective: Compare 30-day readmission rates
-- between male and female encounters.
-- Missing gender values are excluded from this comparison.

-- SELECT
--     gender,
--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,
--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate
-- FROM diabetes_readmission
-- WHERE gender IS NOT NULL
-- GROUP BY gender
-- ORDER BY readmission_rate DESC;

-- ANALYSIS 3: READMISSION RATE BY RACE
-- Objective: Compare 30-day readmission rates across
-- different racial categories.
-- Missing race values are excluded from the comparison.

-- SELECT
--     race,
--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,
--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate
-- FROM diabetes_readmission
-- WHERE race IS NOT NULL
-- GROUP BY race
-- ORDER BY readmission_rate DESC;

