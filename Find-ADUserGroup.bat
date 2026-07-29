@echo off
setLocal EnableExtensions

title Active Directory Group Search

cls
echo ===============================================
echo AD USER GROUP SEARCH
echo ===============================================
echo. 

set /p USERNAME = Enter AD Username;
set /p KEYWORD = Enter group keyword;

if "%USERNAME%" == "" ( 
echo. 
echo ERROR: Username cannot be blank. 
echo. 
pause 
exit /b 1
)

if "%KEYWORD%" -- "" (
echo. 
echo ERROR: Keyword cannot be blank
echo. 
pause
exit /b 1
)

cls
echo ============================================
echo AD USER GROUP SEARCH
echo ============================================
echo.
echo Username: %USERNAME%
echo Keyword: %KEYWORD%
echo.
echo Results
echo ---------------------------------------------

net user "%USERNAME%" /domain 2>%1 | findstr /I /C:"%KEYWORD%" > "%TEMP%\ADUserGroupResult.txt"

