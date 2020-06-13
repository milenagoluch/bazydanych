--Zad1
CREATE OR ALTER FUNCTION Fibonacci (@N int)  
RETURNS @Result Table (Fibonacci_number int)
AS
BEGIN  
    DECLARE @Number int = 0;
	DECLARE @N1 int = 1;
	DECLARE @N2 int = 1;
	DECLARE @Count int = 1;

	WHILE @Count <= @N
		BEGIN
		IF @Count = 1 OR @Count = 2
			BEGIN
			SET @Number = 1;
			INSERT INTO @Result
			SELECT @Number;
			END
		ELSE
			BEGIN
			SET @Number = @N1 + @N2;
			SET @N1 = @N2;
			SET @N2 = @Number;
			INSERT INTO @Result
			SELECT @Number;
			END
		SET @Count += 1;
		END
RETURN
END

CREATE OR ALTER PROCEDURE Fib_seq @N int
AS 
BEGIN
SELECT * FROM dbo.Fibonacci(@N);
END

EXEC Fib_seq @N=5;

--Zad2
CREATE TRIGGER Uppercase
ON Person.Person
FOR UPDATE AS
   UPDATE Person.Person
   SET LastName=UPPER(LastName)

--Wywo³anie
UPDATE Person.Person
SET FirstName='Ken' WHERE BusinessEntityID = 1;
--Sprawdzenie
SELECT * FROM Person.Person;

--Zad3
CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER UPDATE AS
BEGIN
	DECLARE @taxrate FLOAT = (SELECT TaxRate FROM DELETED);
	DECLARE @newtaxrate FLOAT = (SELECT TaxRate FROM INSERTED);
IF	(@newtaxrate > @taxrate + 0.3 * @taxrate) OR (@newtaxrate < @taxrate - 0.3 * @taxrate)
BEGIN
	PRINT 'Zmieniono wartoœæ pola TaxRate o wiêcej ni¿ 30%.'
	ROLLBACK;
END
END;

SELECT * FROM Sales.SalesTaxRate
UPDATE Sales.SalesTaxRate
SET TaxRate= '20' WHERE SalesTaxRateID = 28;

