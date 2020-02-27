echo off

rem batch file to run a script to create a db
rem 9/5/2019

sqlcmd -S localhost -E -i ENVisionDB.sql
rem sqlcmd -S localhost\mssqlserver -E -i BicycleDB_AM.sql
rem sqlcmd -S localhost\sqlexpress -E -i BicycleDB_AM.sql

ECHO .
ECHO if no error messages appear DB was created
PAUSE
