/*
=====================================================
Healthcare Patient Demographics Analysis
Data Exploration
Author: Kimberly Lee
=====================================================
*/

USE HealthcarePractice;
GO

-----------------------------------------------------
-- Preview the dataset
-----------------------------------------------------

SELECT *
FROM dbo.Review_patient_history_samp;

-----------------------------------------------------
-- View unique age categories
-----------------------------------------------------

SELECT DISTINCT age
FROM dbo.Review_patient_history_samp
ORDER BY age;

-----------------------------------------------------
-- View unique income categories
-----------------------------------------------------

SELECT DISTINCT income
FROM dbo.Review_patient_history_samp
ORDER BY income;

-----------------------------------------------------
-- Count total patients
-----------------------------------------------------

SELECT COUNT(*) AS TotalPatients
FROM dbo.Review_patient_history_samp;

-----------------------------------------------------
-- Gender Distribution
-----------------------------------------------------

SELECT
    gender,
    COUNT(*) AS PatientCount
FROM dbo.Review_patient_history_samp
GROUP BY gender
ORDER BY PatientCount DESC;
