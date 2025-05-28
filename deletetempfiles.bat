:: this script deletes temp files from a user account and system wide temp folder
:: usually needs admin rights to work. 
@echo off
echo Deleting temp files...
del /q /f /s "%temp%\*"
del /q /f /s "C:\Windows\Temp\"
echo Done.
pause


