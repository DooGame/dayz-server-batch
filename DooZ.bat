@echo off
REM ↓任务名称 ↓↓服务器名称 ↓↓↓服务器路径
:DOO
set serverName=DayZ server Doo
set serverLocation="..\DayZServer"
REM set BECLocation="C:\Program Files (x86)\Steam\steamapps\common\DayZServer\BEC"
set serverPort=2302
set serverConfig=serverDZ.cfg
set serverCPU=4
REM ↓模组 
set mods=@Advanced-Weapon-Scopes;@BaseBuildingPlus;@BodyBags;@Breachingcharge;@CC_AdminTools;@CF;@Code-Lock;@Community-Online-Tools;@Dabs-Framework;@DayZ-Editor-Loader;@FlipTransport;@Inventory-Move-Sounds;@Mortys-Weapons;@MuchCarKey;@SNAFU_Weapons;@Tactical-Flava;@VPPAdminTools
REM ↓模组
REM -servermod=@AbandonedVehicleRemover)
title %serverName% DayZ Server Doo
cd "%serverLocation%"
echo (%time%) %serverName% 已经启动。
start /wait "DayZ Server" /min "DayZServer_x64.exe" -config=%serverConfig% -port=%serverPort% -cpuCount=%serverCPU% -mod=%mods% -dologs -adminlog -netlog -freezecheck
REM ↓开启防作弊（已禁用）
REM timeout 25
REM cd /d "%BECLocation%"
REM start "" "bec.exe"
REM ↓4小时自动重启
REM timeout 14390
REM taskkill /im DayZServer_x64.exe /F
REM taskkill /im bec.exe /F
REM ↓崩溃或关闭自检
echo (%time%) WARNING:服务器崩溃或者关闭，5秒后重启......
timeout 5
goto DOO
