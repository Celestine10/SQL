----------------------------------------------
---------------TRANSACTIONS-------------------
----------------------------------------------
USE MyPortfolio
select * from Sales_Table
BEGIN TRANSACTION
	UPDATE Sales_Table
	SET [Customer ID] = 'BG-11770', [Customer Name] = 'Johan Clarke', Sales = 200, Quantity=4, Profit = 29
	WHERE [ROW ID] = 21
COMMIT TRANSACTION

--@@error 0 = Success, > 0 means error occured
DECLARE @ERRORRESULTS AS VARCHAR(50)
BEGIN TRANSACTION 
INSERT INTO [dbo].[Sales_Table]
           ([Row ID]
           ,[Customer ID]
           ,[Customer Name]
           ,[State]
           ,[City]
           ,[Category]
           ,[Sub-Category]
           ,[Product Name]
           ,[Sales]
           ,[Quantity]
           ,[Profit])
     VALUES
           (21
           ,'CG-12520'
           ,7,
           'Washington',
			'New England',
           'Funiture',
           'Stools',
           'Buritto side stool',
            411,
            10,
			40)

SET @ERRORRESULTS = @@ERROR

IF (@ERRORRESULTS = 0)
BEGIN
	PRINT 'SUCCESSFUL TRANSACTION!!!'
	COMMIT TRANSACTION
END
ELSE
BEGIN
	PRINT 'TRANSACTION FAILED!'
	ROLLBACK TRANSACTION
END


----------ANOTHER TABLE------------
----------------------------------------------
---------------TRANSACTIONS-------------------
----------------------------------------------

select * from EMPLOYEE

--@@error 0 = Success, > 0 means error occured

DECLARE @ERRORRESULT1 AS VARCHAR(100)
BEGIN TRANSACTION 
INSERT INTO [dbo].[EMPLOYEE]
           ([EMPLOYEE_ID]
           ,[LAST_NAME]
           ,[FIRST_NAME]
           ,[MIDDLE_NAME]
           ,[SEX]
           ,[STARTDATE]
           ,[ENDDATE]
           ,[CountryId]
           ,[DeptId]
           ,[JobId])
     VALUES
           (4671
           ,'AZUKA'
           ,'BRIAN'
           ,'INI'
           ,'M'
           ,'2019-10-19'
           ,'2025-08-11'
           ,9
           ,12
           ,101)


SET @ERRORRESULT1 = @@ERROR

IF (@ERRORRESULT1 = 0)
BEGIN
	PRINT 'SUCCESSFUL TRANSACTION!!!'
	COMMIT TRANSACTION
END
ELSE
BEGIN
	PRINT 'TRANSACTION FAILED!!!'
	ROLLBACK TRANSACTION
END

select * from EMPLOYEE
BEGIN TRANSACTION
	UPDATE EMPLOYEE
	SET [EMPLOYEE_ID] = 4670, LAST_NAME = 'ADEKUNLE', FIRST_NAME = 'GEORGE', MIDDLE_NAME='BOLA'
	WHERE LAST_NAME = 'Adekunle'
COMMIT TRANSACTION

--TRY AND CATCH
BEGIN TRY
BEGIN TRANSACTION

INSERT INTO [dbo].[EMPLOYEE]
           ([EMPLOYEE_ID]
           ,[LAST_NAME]
           ,[FIRST_NAME]
           ,[MIDDLE_NAME]
           ,[SEX]
           ,[STARTDATE]
           ,[ENDDATE]
           ,[CountryId]
           ,[DeptId]
           ,[JobId])
     VALUES
           (4672
           ,'AZONOBI'
           ,'BRIDGET'
           ,'INI'
           ,'M'
           ,'2021-10-17'
           ,GETDATE()
           ,9
           ,11
           ,103)

		   commit TRANSACTION
END TRY

BEGIN CATCH
	PRINT 'YOUR ERROR STATEMENT HAS BEEN CAUGHT'
	ROLLBACK TRANSACTION
END CATCH

--COMMON TABLE EXPRESSIONS (CTE)
--Can be used recurssively.

select * from Sales_Table

WITH CTE_SALES
AS 
(	
	SELECT [Customer Name], City, Sales From Sales_Table
)
SELECT * FROM CTE_SALES
WHERE City LIKE 'Los Angeles%';


------------------------------------------------
-----------GROUPING SETS------------------------
select * from Sales_Table
SELECT [Customer Name], NULL as Null_Column, NULL as Null_Column,  Sum(Sales) as CustomerSales
from Sales_Table 
group by [Customer Name]

UNION ALL

SELECT Category, [Sub-Category], NULL as Null_Column, Sum(Sales) as HighestSales
from Sales_Table 
group by Category, [Sub-Category]

UNION ALL

SELECT [Customer Name], [Sub-Category],  Sum(Sales) as CustomerSales, Profit
from Sales_Table 
group by [Customer Name], [Sub-Category],Profit

----Grouping sets

select * from Sales_Table
SELECT [Customer Name], [Sub-Category], [Product Name], City, [State], Sum(Sales) as CustomerSales, Profit
from Sales_Table
group by GROUPING SETS

(
	([Customer Name]),
	([Customer Name], [Product Name], City, [State],Sales, Profit),
	([Customer Name], [Product Name], Category, [Sub-Category], City, Sales, Profit)
)

---ROLLUP------
SELECT [Customer Name], [Sub-Category], [Product Name], City, [State], Sum(Sales) as CustomerSales, Profit
from Sales_Table
group by ROLLUP

(
	([Customer Name], [Product Name], [Sub-Category], City, [State],Sales, Profit)
)
