# SQL Analysis Findings — Healthcare Readmission Analysis

## Project Objective

To investigate demographic, clinical, admission-related and healthcare-utilization factors associated with 30-day hospital readmission using the UCI Diabetes 130-US Hospitals dataset.

## Dataset Summary

- Total hospital encounters: 101,766
- Hospitals: 130
- Study period: 1999–2008
- Readmitted encounters: 11,357
- Non-readmitted encounters: 90,409
- Overall 30-day readmission rate: 11.16%

## Key Findings

1. Previous inpatient visits showed a strong positive association with readmission. The rate increased from 8.44% for encounters with no previous inpatient visits to 30.70% for encounters with four or more visits.

2. Previous emergency visits showed a similar pattern. Readmission rates increased from 10.47% for zero previous visits to 28.54% for four or more visits.

3. Hospital stays of 7–10 days had the highest observed readmission rate among length-of-stay groups, at 13.63%.

4. The Supplementary Factors primary diagnosis category had a 16.18% readmission rate among categories with at least 100 encounters.

5. Encounters involving a change in diabetes medication had an 11.82% readmission rate, compared with 10.59% when medication was not changed.

6. Encounters with 20–29 medications had the highest readmission rate among medication-count groups, at 12.96%.

## Conclusion

Previous inpatient and emergency healthcare utilization showed particularly strong associations with 30-day readmission. Other factors, including hospital stay duration, primary diagnosis category and medication-related characteristics, also showed differences in observed readmission rates.

These findings can help identify patient groups that may warrant closer attention and support further investigation into hospital readmission patterns.

## Limitations

- The analysis is observational and does not establish causation.
- Multiple encounters may represent the same patient.
- Missing clinical information may influence the results.
- Some categories have relatively small sample sizes.
- The dataset covers 1999–2008 and may not represent current healthcare practices.
- Further statistical analysis would be required to assess independent associations and predictive performance.