@echo off
title AD Membership Check

REM Ask for the user's domain username
set /p username=Enter username: 

REM Ask for the AD group/membership to search for
set /p membership=Enter membership to search for: 

echo.
echo Checking %username% for "%membership%" membership...
echo --------------------------------------------------

REM Search the user's domain information for the specified membership
REM this is is like the main search command that checks if the user is part of the specified group
net user %username% /domain | findstr /I /C:"%membership%" >nul

REM Display whether the membership was found
if %errorlevel%==0 (
    echo.
    echo RESULT: %membership% - FOUND
) else (
    echo.
    echo RESULT: %membership% - NOT FOUND
)

echo.
pause