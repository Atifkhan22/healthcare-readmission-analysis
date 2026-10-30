-- ANALYSIS 1: READMISSION RATE BY ADMISSION TYPE
-- Objective: Compare 30-day readmission rates across
-- different types of hospital admission.

-- SELECT
--     admission_type_id,
--     COUNT(*) AS total_encounters,
--     SUM(readmitted_30) AS readmitted_encounters,
--     ROUND(
--         SUM(readmitted_30) * 100.0 / COUNT(*),
--         2
--     ) AS readmission_rate
-- FROM diabetes_readmission
-- GROUP BY admission_type_id
-- ORDER BY readmission_rate DESC;

-- ANALYSIS 5: READMISSION RATE BY DISCHARGE DISPOSITION
-- Objective: Compare 30-day readmission rates across
-- different hospital discharge destinations.

SELECT
    discharge_disposition_id,
    COUNT(*) AS total_encounters,
    SUM(readmitted_30) AS readmitted_encounters,
    ROUND(
        SUM(readmitted_30) * 100.0 / COUNT(*),
        2
    ) AS readmission_rate
FROM diabetes_readmission
GROUP BY discharge_disposition_id
ORDER BY readmission_rate DESC;