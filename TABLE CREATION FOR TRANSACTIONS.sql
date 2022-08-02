create database BRAINSMITH 
USE BRAINSMITH 
DROP TABLE EMPLOYEE 
--Creating the employee relations 
CREATE TABLE EMPLOYEE( 
EMPLOYEE_ID INTEGER PRIMARY KEY, 
LAST_NAME  VARCHAR(50) NOT NULL, 
FIRST_NAME VARCHAR(25) NOT NULL, 
MIDDLE_NAME VARCHAR(25), 
SEX VARCHAR(10) NOT NULL, 
STARTDATE DATE NOT NULL, 
ENDDATE DATE NOT NULL, 
CountryId integer not null, 
DeptId integer not null, 
JobId integer not null); 
SELECT* FROM EMPLOYEE  	 	 	 	 	 	 
CREATE TABLE JOBS( 
JOB_ID INTEGER PRIMARY KEY, 
JOB_TITLE VARCHAR(50) NOT NULL, 
SKILLS VARCHAR(50) 
) 
CREATE TABLE COUNTRY( 
COUNTRY_ID INTEGER PRIMARY KEY, 
COUNTRYNAME VARCHAR(50) NOT NULL, 
CITY VARCHAR(50) 
) 
--creating the department relation 
CREATE TABLE DEPARTMENT( 
DEPT_ID INTEGER PRIMARY KEY, 
DEPT_NAME VARCHAR(50) NOT NULL 
) 