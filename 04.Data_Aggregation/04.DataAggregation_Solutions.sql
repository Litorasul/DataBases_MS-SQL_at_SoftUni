USE Gringotts

--Problem 01--
SELECT 
	COUNT(*) AS [Count]
FROM WizzardDeposits

--Problem 02--
SELECT
	MAX(MagicWandSize) AS [LongestMagicWand]
FROM WizzardDeposits

--Problem 03--
SELECT
	DepositGroup,
	MAX(MagicWandSize) AS [LongestMagicWand]
FROM WizzardDeposits
GROUP BY DepositGroup

--Problem 04--
SELECT TOP 2
	DepositGroup	
FROM WizzardDeposits
GROUP BY DepositGroup
ORDER BY AVG(MagicWandSize) 

--Problem 05--
SELECT
	DepositGroup,
	SUM(DepositAmount) AS [TotalSum]
FROM WizzardDeposits
GROUP BY DepositGroup