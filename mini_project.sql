create table student (
	id integer not null IDENTITY(1 ,1) primary key,
	student_name varchar(50) not null, 
	dept varchar(10)not null, 
	major_subject varchar(10) not null, 
	student_id varchar(50) not null, 
	email varchar(50) not null, 
	yourPassword binary(64) not null);

select * from student

CREATE PROCEDURE addStudent
@id integer,
@email VARCHAR(50),
@yourPassword binary(64),
@student_name VARCHAR(50),
@dept VARCHAR(10),
@major_subject VARCHAR(10),
@student_id VARCHAR(50),
@responseMessage NVARCHAR(MAX) OUTPUT
AS
BEGIN
SET NOCOUNT ON
BEGIN TRY
	INSERT INTO student values(@student_name, @dept, @major_subject, @student_id, @email, @yourPassword);
	SET @responseMessage ='Successful'
END TRY
BEGIN CATCH
	SET @responseMessage=ERROR_MESSAGE()
END CATCH
END