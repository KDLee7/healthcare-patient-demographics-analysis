/*
===========================================================
Healthcare Patient Demographics Analysis
Phase 2 - Data Quality Assessment
===========================================================

Purpose:
Evaluate the completeness, consistency, and uniqueness
of the patient demographic data before further analysis.
*/

USE HealthcarePractice;
GO

-----------------------------------------------------------
-- 1. Confirm total number of records
-----------------------------------------------------------

SELECT COUNT(*) AS TotalRecords
FROM dbo.Review_patient_history_samp;

-----------------------------------------------------------
-- 2. Check for missing values in each column
-----------------------------------------------------------

SELECT
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS Missing_ID,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS Missing_Gender,
    SUM(CASE WHEN income IS NULL THEN 1 ELSE 0 END) AS Missing_Income
FROM dbo.Review_patient_history_samp;

-----------------------------------------------------------
-- 3. Check for duplicate patient IDs
-----------------------------------------------------------

SELECT
    id,
    COUNT(*) AS RecordCount
FROM dbo.Review_patient_history_samp
GROUP BY id
HAVING COUNT(*) > 1
ORDER BY RecordCount DESC;

-----------------------------------------------------------
-- 4. Count duplicate patient IDs
-----------------------------------------------------------

SELECT COUNT(*) AS DuplicateIDCount
FROM
(
    SELECT id
    FROM dbo.Review_patient_history_samp
    GROUP BY id
    HAVING COUNT(*) > 1
) AS DuplicateIDs;

-----------------------------------------------------------
-- 5. Validate gender categories
-----------------------------------------------------------

SELECT
    gender,
    COUNT(*) AS PatientCount
FROM dbo.Review_patient_history_samp
GROUP BY gender
ORDER BY PatientCount DESC;

-----------------------------------------------------------
-- 6. Validate age categories
-----------------------------------------------------------

SELECT
    age,
    COUNT(*) AS PatientCount
FROM dbo.Review_patient_history_samp
GROUP BY age
ORDER BY PatientCount DESC;

-----------------------------------------------------------
-- 7. Validate income categories
-----------------------------------------------------------

SELECT
    income,
    COUNT(*) AS PatientCount
FROM dbo.Review_patient_history_samp
GROUP BY income
ORDER BY PatientCount DESC;
