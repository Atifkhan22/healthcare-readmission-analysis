-- =====================================================
-- HEALTHCARE READMISSION ANALYSIS
-- MEDICATION ANALYSIS
-- =====================================================

-- USE healthcare_readmission;

-- ANALYSIS 1: READMISSION RATE BY DIABETES MEDICATION CHANGE
-- Objective: Compare readmission rates between encounters
-- with and without a diabetes medication change.

-- SELECT
--     `change`,
--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,
--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate
-- FROM diabetes_readmission
-- GROUP BY `change`
-- ORDER BY readmission_rate DESC;

-- ANALYSIS 2: READMISSION RATE BY HbA1c TEST RESULT
-- Objective: Compare readmission rates across HbA1c categories.
-- Missing results are labelled as 'Not Recorded'.

-- SELECT
--     COALESCE(A1Cresult, 'Not Recorded') AS HbA1c_result,
--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,
--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate
-- FROM diabetes_readmission
-- GROUP BY A1Cresult
-- ORDER BY readmission_rate DESC;


-- ANALYSIS 5: READMISSION RATE BY INSULIN USAGE
-- Objective: Compare 30-day readmission rates across
-- different insulin usage categories.

-- SELECT
--     insulin,
--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,
--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate
-- FROM diabetes_readmission
-- GROUP BY insulin
-- ORDER BY readmission_rate DESC;

-- ANALYSIS 6: READMISSION RATE BY NUMBER OF MEDICATIONS
-- Objective: Examine whether encounters involving a higher
-- number of medications have different readmission rates.

SELECT
    CASE
        WHEN num_medications < 10 THEN 'Less than 10'
        WHEN num_medications BETWEEN 10 AND 19 THEN '10-19'
        WHEN num_medications BETWEEN 20 AND 29 THEN '20-29'
        ELSE '30 or more'
    END AS medication_group,

    COUNT(*) AS total_encounters,
    SUM(readmitted_30) AS readmitted_encounters,

    ROUND(
        SUM(readmitted_30) * 100.0 / COUNT(*),
        2
    ) AS readmission_rate

FROM diabetes_readmission

GROUP BY medication_group

ORDER BY
    CASE medication_group
        WHEN 'Less than 10' THEN 1
        WHEN '10-19' THEN 2
        WHEN '20-29' THEN 3
        ELSE 4
    END;
