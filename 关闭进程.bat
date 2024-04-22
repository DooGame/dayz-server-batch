taskkill /im DayZServer_x64.exe /F
taskkill /im dayz-server-manager.exe /F

@echo off
echo Stopping DayZ Server Manager and BEC...

taskkill /f /im dayz-server-manager.exe
taskkill /f /im Bec.exe
taskkill /f /im dayz-server-manager.exe

echo DayZ Server Manager and BEC have been stopped.
pause
