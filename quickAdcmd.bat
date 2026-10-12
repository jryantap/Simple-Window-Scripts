@echo off
setLocal 
title Quick Adcmd

REM Ask for username
set /p "USER=Enter the username: "

REM Ask for AD group name
set /p "GROUP=Enter the EXACT AD group name: "

REM Display requested information
echo.
echo Requested Information:
echo Username: %USER%
echo AD Group: %GROUP%
echo.

REM Confirm before proceeding
