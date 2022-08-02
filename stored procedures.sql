use BRAINSMITH

----------------------------------------------------------------------------
-----STORED PROCEDURE-------------------
----------------------------------------------------------------------------
CREATE PROCEDURE demoProcedure
AS SET NOCOUNT ON
SELECT * FROM burrito

EXECUTE demoProcedure

CREATE PROCEDURE demoProcedure2
AS SET NOCOUNT OFF
SELECT * FROM burrito

EXEC demoProcedure2

DROP PROCEDURE demoProcedure ---Either Proc or procedure can be used
DROP PROC demoProcedure2

----------------------------------------------------------------------------
-----------PARAMETERISED PROCEDURE------------------------------------------
----------------------------------------------------------------------------

create procedure paramproc
@Param_Name varchar(50)
as
SET NOCOUNT ON
Select * from burrito
where type = @Param_Name

EXEC paramproc @Param_Name = 'sweet'
exec paramproc 'salty'
--Several parameterised names can be called but we must make sure that they're called in the order of creation
DROP PROC paramproc

create procedure paramproc1
@Param_Name varchar(50) = 'Noparameter'
as
SET NOCOUNT ON
Select * from burrito
where type = @Param_Name

EXEC paramproc1 


