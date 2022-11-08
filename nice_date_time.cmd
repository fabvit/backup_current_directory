@echo off
set NICE_DATE=%DATE:~-4%.%DATE:~3,2%.%DATE:~0,2%
set NICE_TIME=%TIME:~0,2%.%TIME:~3,2%.%TIME:~6,2%

echo Date........: %DATE%
echo NiceDate....: %NICE_DATE%
echo Time........: %TIME%
echo NiceTime....: %NICE_TIME% 
echo.
echo -----------------------------------
echo NiceTimeDate: %NICE_DATE%-%NICE_TIME% 
echo -----------------------------------
"C:\Program Files\7-Zip\7z.exe" a -tzip "backup_sample_nice_data_time_%NICE_DATE%-%NICE_TIME%.zip" *.txt
echo.
echo.
echo.
pause