--Create Trigger
---------------TABLE LEVEL-------------------------------------
CREATE TRIGGER demo_trigger
ON dbo.employee
AFTER INSERT
AS
BEGIN
PRINT 'Insert is not allowed on this table. You need approval'
ROLLBACK TRANSACTION
END
GO

select * from employee
--Test the trigger
Insert into dbo.employee (
emp_id, first_name, last_name, birth_day, sex, salary, super_id, branch_id)
VALUES(109, 'Jones', 'Haller', '1987-12-29', 'M', 45000,107,3 )

--------------------------------------------------------------------------------------
------------------------------------DATABASE LEVEL------------------------------------
CREATE TRIGGER DB_LEVEL_TRIGGER
ON DATABASE
AFTER CREATE_TABLE
AS
BEGIN
PRINT 'CREATION OF NEW TABLE NOT ALLOWED!. YOU NEED APPROVAL'
ROLLBACK TRANSACTION
END
GO

CREATE TABLE DEMOTABLE (
COLUMN_1 VARCHAR);
GO