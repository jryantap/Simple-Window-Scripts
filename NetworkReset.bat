@echo off
echo Flushing DNS cache...
ipconfig /flushdns
echo.

echo Renewing IP address...
ipconfig /renew
echo.

echo Resetting TCP/IP stack...
netsh int ip reset
echo.

echo Done! You may need to restart your computer for changes to take full effect.
pause