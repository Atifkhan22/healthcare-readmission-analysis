-- =====================================================
-- HEALTHCARE READMISSION ANALYSIS
-- HOSPITAL UTILIZATION ANALYSIS
-- =====================================================

-- USE healthcare_readmission;

-- ANALYSIS 1: READMISSION RATE BY LENGTH OF HOSPITAL STAY
-- Objective: Examine whether readmission rates differ
-- across different hospital stay durations.

-- SELECT
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
-- GROUP BY stay_group
-- ORDER BY
--     CASE stay_group
--         WHEN '1-3 days' THEN 1
--         WHEN '4-6 days' THEN 2
--         WHEN '7-10 days' THEN 3
--         ELSE 4
--     END;

-- ANALYSIS 2: READMISSION RATE BY PREVIOUS INPATIENT VISITS
-- Objective: Examine whether previous inpatient utilization
-- is associated with 30-day readmission.

-- SELECT
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

-- GROUP BY inpatient_visit_group

-- ORDER BY
--     CASE inpatient_visit_group
--         WHEN '0 visits' THEN 1
--         WHEN '1 visit' THEN 2
--         WHEN '2-3 visits' THEN 3
--         ELSE 4
--     END;

-- ANALYSIS 3: READMISSION RATE BY PREVIOUS OUTPATIENT VISITS
-- Objective: Examine whether previous outpatient healthcare
-- utilization is associated with 30-day readmission.

-- SELECT
--     CASE
--         WHEN number_outpatient = 0 THEN '0 visits'
--         WHEN number_outpatient = 1 THEN '1 visit'
--         WHEN number_outpatient BETWEEN 2 AND 3 THEN '2-3 visits'
--         ELSE '4 or more visits'
--     END AS outpatient_visit_group,

--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,

--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate

-- FROM diabetes_readmission

-- GROUP BY outpatient_visit_group

-- ORDER BY
--     CASE outpatient_visit_group
--         WHEN '0 visits' THEN 1
--         WHEN '1 visit' THEN 2
--         WHEN '2-3 visits' THEN 3
--         ELSE 4
--     END;

-- ANALYSIS 4: READMISSION RATE BY PREVIOUS EMERGENCY VISITS
-- Objective: Examine whether previous emergency department
-- utilization is associated with 30-day readmission.

SELECT
    CASE
        WHEN number_emergency = 0 THEN '0 visits'
        WHEN number_emergency = 1 THEN '1 visit'
        WHEN number_emergency BETWEEN 2 AND 3 THEN '2-3 visits'
        ELSE '4 or more visits'
    END AS emergency_visit_group,

    COUNT(*) AS total_encounters,
    SUM(readmitted_30) AS readmitted_encounters,

    ROUND(
        SUM(readmitted_30) * 100.0 / COUNT(*),
        2
    ) AS readmission_rate

FROM diabetes_readmission

GROUP BY emergency_visit_group

ORDER BY
    CASE emergency_visit_group
        WHEN '0 visits' THEN 1
        WHEN '1 visit' THEN 2
        WHEN '2-3 visits' THEN 3
        ELSE 4
    END;
    