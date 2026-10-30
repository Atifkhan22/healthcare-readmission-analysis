-- =====================================================
-- HEALTHCARE READMISSION ANALYSIS
-- FINAL INSIGHTS AND COMBINED ANALYSIS
-- =====================================================

-- USE healthcare_readmission;

-- ANALYSIS 1: OVERALL READMISSION SUMMARY
-- Objective: Establish the overall readmission rate
-- as a baseline for the final analysis.

-- SELECT
--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,
--     COUNT(*) - SUM(readmitted_30) AS non_readmitted_encounters,

--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate

-- FROM diabetes_readmission;

-- ANALYSIS 2: COMBINED INPATIENT AND EMERGENCY UTILIZATION
-- Objective: Examine readmission rates across combinations
-- of previous inpatient and emergency visits.

-- SELECT
--     CASE
--         WHEN number_inpatient = 0 THEN '0'
--         WHEN number_inpatient = 1 THEN '1'
--         WHEN number_inpatient BETWEEN 2 AND 3 THEN '2-3'
--         ELSE '4+'
--     END AS inpatient_visit_group,

--     CASE
--         WHEN number_emergency = 0 THEN '0'
--         WHEN number_emergency = 1 THEN '1'
--         WHEN number_emergency BETWEEN 2 AND 3 THEN '2-3'
--         ELSE '4+'
--     END AS emergency_visit_group,

--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,

--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate

-- FROM diabetes_readmission

-- GROUP BY
--     inpatient_visit_group,
--     emergency_visit_group

-- HAVING COUNT(*) >= 100

-- ORDER BY readmission_rate DESC;

-- ANALYSIS 3: READMISSION BY AGE AND PREVIOUS INPATIENT VISITS
-- Objective: Examine how age groups and previous inpatient
-- utilization jointly relate to 30-day readmission.

-- SELECT
--     age,

--     CASE
--         WHEN number_inpatient = 0 THEN '0 visits'
--         WHEN number_inpatient = 1 THEN '1 visit'
--         WHEN number_inpatient BETWEEN 2 AND 3 THEN '2-3 visits'
--         ELSE '4 or more visits'
--     END AS inpatient_visit_group,

--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,

--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate

-- FROM diabetes_readmission

-- GROUP BY
--     age,
--     inpatient_visit_group

-- HAVING COUNT(*) >= 100

-- ORDER BY age, readmission_rate DESC;

-- ANALYSIS 4: READMISSION BY DIAGNOSIS AND LENGTH OF STAY
-- Objective: Examine readmission rates across combinations
-- of primary diagnosis categories and hospital stay duration.

-- SELECT
--     diag_1_category,

--     CASE
--         WHEN time_in_hospital BETWEEN 1 AND 3 THEN '1-3 days'
--         WHEN time_in_hospital BETWEEN 4 AND 6 THEN '4-6 days'
--         WHEN time_in_hospital BETWEEN 7 AND 10 THEN '7-10 days'
--         ELSE 'More than 10 days'
--     END AS stay_group,

--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,

--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate

-- FROM diabetes_readmission

-- GROUP BY
--     diag_1_category,
--     stay_group

-- HAVING COUNT(*) >= 100

-- ORDER BY readmission_rate DESC;

-- ANALYSIS 5: FINAL DATASET AND TARGET VALIDATION
-- Objective: Verify total encounters, target distribution,
-- missing target values, and distinct encounter IDs.

SELECT
    COUNT(*) AS total_encounters,

    COUNT(readmitted_30) AS non_missing_targets,

    SUM(CASE
        WHEN readmitted_30 = 1 THEN 1
        ELSE 0
    END) AS readmitted_encounters,

    SUM(CASE
        WHEN readmitted_30 = 0 THEN 1
        ELSE 0
    END) AS non_readmitted_encounters,

    SUM(CASE
        WHEN readmitted_30 IS NULL
          OR readmitted_30 NOT IN (0, 1)
        THEN 1
        ELSE 0
    END) AS invalid_target_values,

    COUNT(DISTINCT encounter_id) AS unique_encounters

FROM diabetes_readmission;