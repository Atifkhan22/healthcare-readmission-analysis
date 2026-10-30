-- =====================================================
-- HEALTHCARE READMISSION ANALYSIS
-- CLINICAL ANALYSIS
-- =====================================================

-- USE healthcare_readmission; 

-- ANALYSIS 1: READMISSION RATE BY PRIMARY DIAGNOSIS CATEGORY
-- Objective: Identify diagnosis categories with higher
-- 30-day readmission rates.

-- SELECT
--     diag_1_category,
--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,
--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate
-- FROM diabetes_readmission
-- GROUP BY diag_1_category
-- ORDER BY readmission_rate DESC;



-- ANALYSIS 2: READMISSION RATE BY PRIMARY DIAGNOSIS CATEGORY
-- Objective: Compare diagnosis categories with at least
-- 100 encounters to reduce the influence of very small groups.

-- SELECT
--     diag_1_category,
--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,
--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate
-- FROM diabetes_readmission
-- GROUP BY diag_1_category
-- HAVING COUNT(*) >= 100
-- ORDER BY readmission_rate DESC;

