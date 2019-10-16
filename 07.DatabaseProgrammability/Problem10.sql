CREATE PROCEDURE  usp_GetHoldersWithBalanceHigherThan @moreThan DECIMAL(18, 2)
AS
BEGIN
	SELECT
		AH.FirstName, 
		ah.LastName
	FROM AccountHolders AS AH
		JOIN Accounts AS A ON A.AccountHolderId = AH.Id
		GROUP BY ah.FirstName, ah.LastName
		HAVING SUM(A.Balance) > @moreThan
		ORDER BY ah.FirstName, ah.LastName
END