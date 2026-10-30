USE healthcare_readmission;

-- =============================================
-- ANALYSIS 1: OVERALL 30-DAY READMISSION RATE
-- Objective: Calculate the proportion of hospital
-- encounters followed by readmission within 30 days.
-- =============================================

SELECT
    readmitted_30,
    COUNT(*) AS total_encounters,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM diabetes_readmission),
        2
    ) AS percentage

FROM diabetes_readmission

GROUP BY readmitted_30
ORDER BY readmitted_30;