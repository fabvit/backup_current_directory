@echo off

::
:: Backup of the Current Directory
:: (C) Copyright 2000 - Fabio VITALE
::
:: Uso: Copiare questo file batch nella directory che si intende zippare.
::      Copiare il file doff.exe in una cartella presente nel PATH (es. C:\Windows\System32)
::      Lanciare questo file batch dalla directory che si intende zippare.
::

:: imposto la directory corrente come il folder da backuppare
set FOLDER_NAME=%CD%

:: estraggo solo il nome della cartella dal percorso completo
for %%f in ("%FOLDER_NAME%") do set LAST_PART_OF_FOLDER_NAME=%%~nxf

:: formatto il timestamp corrente usando doff.exe 
for /f "tokens=1-6 delims=/ " %%a in ('doff yyyy/mm/dd/hh/mi/ss') do (
set yyyy=%%a
set mm=%%b
set dd=%%c

set hh=%%d
set mi=%%e
set ss=%%f
)
set NICE_DATE=%yyyy%-%mm%-%dd%_%hh%.%mi%.%ss%

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

:: eseguo lo zip del folder corrente e delòle sue sottocartelle
"C:\Program Files\7-Zip\7z.exe" a -tzip "%FOLDER_NAME%\bak\%LAST_PART_OF_FOLDER_NAME%_%NICE_DATE%_backup.zip" -r "%FOLDER_NAME%\*.*" -x!*.zip

echo.
echo.
echo.

pause