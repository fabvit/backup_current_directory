@echo off

::
:: Backup the Current Directory
:: (C) Copyright 2000 - Fabio VITALE
::

set FOLDER_NAME=%CD%

for %%f in ("%FOLDER_NAME%") do set LAST_PART_OF_FOLDER_NAME=%%~nxf

for /f "tokens=1-6 delims=/ " %%a in ('doff yyyy/mm/dd/hh/mi/ss') do (
set yyyy=%%a
set mm=%%b
set dd=%%c

set hh=%%d
set mi=%%e
set ss=%%f
)

set NICE_DATE=%yyyy%-%mm%-%dd%_%hh%-%mi%-%ss%

echo.
echo.
echo.

echo -------------------------------------------
echo FOLDER_NAME.............: %FOLDER_NAME%
echo LAST_PART_OF_FOLDER_NAME: %LAST_PART_OF_FOLDER_NAME%
echo NICE_DATE...............: %NICE_DATE%
echo -------------------------------------------

echo.
echo.
echo.

"C:\Program Files\7-Zip\7z.exe" a -tzip "%LAST_PART_OF_FOLDER_NAME%_%NICE_DATE%.zip" "%FOLDER_NAME%\*.*"

echo.
echo.
echo.

pause