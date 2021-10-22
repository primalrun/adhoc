USE DP_ODS
GO

DROP TABLE IF EXISTS Staging.PEarHist;
EXEC SP_RENAME 'Staging.PEarHist_JW', 'PEarHist';

