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

--Problem 06--
SELECT
	DepositGroup,
	SUM(DepositAmount) AS [TotalSum]
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup

--Problem 07--
SELECT
	DepositGroup,
	SUM(DepositAmount) AS [TotalSum]
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup
HAVING SUM(DepositAmount) < 150000
ORDER BY TotalSum DESC

--Problem 08--
SELECT
	DepositGroup,
	MagicWandCreator,
	MIN(DepositCharge) AS [MinDepositCharge]
FROM WizzardDeposits
GROUP BY DepositGroup, MagicWandCreator
ORDER BY MagicWandCreator, DepositGroup

--Problem 09--
SELECT 
	CASE
		WHEN Age BETWEEN 0 AND 10  THEN '[0-10]'
		WHEN Age BETWEEN 11 AND 20  THEN '[11-20]'
		WHEN Age BETWEEN 21 AND 30  THEN '[21-30]'
		WHEN Age BETWEEN 31 AND 40  THEN '[31-40]'
		WHEN Age BETWEEN 41 AND 50  THEN '[41-50]'
		WHEN Age BETWEEN 51 AND 60  THEN '[51-60]'
		ELSE '[61+]'
	END AS [AgeGroup],
COUNT(*) AS [WizardCount]
FROM WizzardDeposits
GROUP BY 
CASE
		WHEN Age BETWEEN 0 AND 10  THEN '[0-10]'
		WHEN Age BETWEEN 11 AND 20  THEN '[11-20]'
		WHEN Age BETWEEN 21 AND 30  THEN '[21-30]'
		WHEN Age BETWEEN 31 AND 40  THEN '[31-40]'
		WHEN Age BETWEEN 41 AND 50  THEN '[41-50]'
		WHEN Age BETWEEN 51 AND 60  THEN '[51-60]'
		ELSE '[61+]'
	END

--Problem 10--
SELECT
	LEFT(FirstName, 1) AS [FirstLetter]
FROM WizzardDeposits
WHERE DepositGroup = 'Troll Chest'
GROUP BY LEFT(FirstName, 1)

--Problem 11--
SELECT 
	DepositGroup,
	IsDepositExpired,
	AVG(DepositInterest) AS [AverageInterest]
FROM WizzardDeposits
WHERE DATEPART(YEAR, DepositStartDate) > 1984 
GROUP BY DepositGroup, IsDepositExpired
ORDER BY DepositGroup DESC, IsDepositExpired

--Problem 12--
SELECT
 SUM([Difference]) AS [SumDifference]
 FROM(SELECT 
	FirstName AS [Host Wizard],
	DepositAmount AS [Host Wizard Deposit],
	LEAD(FirstName) OVER (ORDER BY Id) AS [Guest Wizard],
	LEAD(DepositAmount) OVER (ORDER BY Id) AS [Guest Wizard Deposit],
	DepositAmount - LEAD(DepositAmount) OVER (ORDER BY Id) AS [Difference]
FROM WizzardDeposits) AS [DiffTable]

--Problem 13--
USE SoftUni

SELECT
	DepartmentID,
	SUM(Salary) AS [TotalSalary]
FROM Employees
GROUP BY DepartmentID
ORDER BY DepartmentID

--Problem 14--
SELECT
	DepartmentID,
	MIN(Salary) AS [MinimumSalary]
FROM Employees
WHERE DATEPART(YEAR, HireDate) > 1999
AND DepartmentID = 2 
OR DepartmentID = 5
OR DepartmentID = 7
GROUP BY DepartmentID

--Problem 15--
SELECT
	*
INTO NewEmployeesTable
FROM Employees
WHERE Salary > 30000

DELETE FROM NewEmployeesTable
WHERE ManagerID = 42

UPDATE NewEmployeesTable
SET Salary += 5000
WHERE DepartmentID = 1

SELECT
	DepartmentID,
	AVG(Salary) AS [AverageSalary]
FROM NewEmployeesTable
GROUP BY DepartmentID

--Problem 16--
SELECT
	DepartmentID,
	MAX(Salary) AS [MaxSalary]
FROM Employees
GROUP BY DepartmentID
HAVING MAX(Salary) NOT BETWEEN 30000 AND 70000

--Problem 17--
SELECT
	COUNT(*) AS [Count]
FROM Employees
WHERE ManagerID IS NULL
