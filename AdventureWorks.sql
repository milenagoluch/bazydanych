--Zad1
BEGIN
	SELECT AVG(Rate) AS ŒredniaStawka FROM HumanResources.EmployeePayHistory;
	SELECT E.*, EPH.Rate FROM HumanResources.Employee E, HumanResources.EmployeePayHistory EPH
	WHERE EPH.BusinessEntityID = E.BusinessEntityID AND EPH.Rate < (SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory);
END;
--Zad2
CREATE OR ALTER FUNCTION dbo.ShipDateFunction(@ID int)  
RETURNS DateTime
AS   
BEGIN  
    DECLARE @Date DateTime;  
    SELECT @Date = ShipDate 
    FROM AdventureWorks2017.Sales.SalesOrderHeader SOH
	WHERE SOH.SalesOrderID = @ID;   
    RETURN @Date;  
END; 

SELECT dbo.ShipDateFunction(44080) AS 'ShipDate';
--Zad3
CREATE OR ALTER PROCEDURE Product @Name VARCHAR(50)
AS 
BEGIN
	SELECT ProductID, ProductNumber, SafetyStockLevel 
	FROM AdventureWorks2017.Production.Product P
	WHERE P.Name=@Name;
END;
EXEC Product @Name = 'Fork End';
--Zad4
select * from AdventureWorks2017.Sales.SalesOrderHeader;
CREATE OR ALTER FUNCTION dbo.CardNumber(@ID int)  
RETURNS NVARCHAR(50)
AS   
BEGIN  
    DECLARE @CardNumber NVARCHAR(50);  
    SELECT @CardNumber = CC.CardNumber 
	FROM AdventureWorks2017.Sales.CreditCard CC
    INNER JOIN AdventureWorks2017.Sales.SalesOrderHeader SOH
	ON SOH.CreditCardID = CC.CreditCardID  
	AND @ID = SOH.SalesOrderID
    RETURN @CardNumber;  
END; 
SELECT dbo.CardNumber(44080) AS 'CardNumber';
--Zad5
CREATE OR ALTER PROCEDURE Division @num1 FLOAT, @num2 FLOAT
AS 
BEGIN
	 DECLARE @result FLOAT; 
	 IF @num1 > @num2
		BEGIN
			SELECT @result = @num1 / @num2;
			PRINT 'Wynik'
			PRINT @result;
		END
	ELSE
		BEGIN
			PRINT 'Niew³aœciwie zdefiniowa³eœ dane wejœciowe'
		END
END;
EXEC Division @num1 = 6, @num2 = 3;