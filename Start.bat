@echo off
REM ���������� �������������� ������������·��
:DOO
set serverName=DayZ server Doo
set serverLocation="..\DayZServer"
REM set BECLocation="C:\Program Files (x86)\Steam\steamapps\common\DayZServer\BEC"
set serverPort=2302
set serverConfig=serverDZ.cfg
set serverCPU=4
REM ��ģ�� 
set mods=@Advanced-Weapon-Scopes;@BaseBuildingPlus;@BodyBags;@Breachingcharge;@CC_AdminTools;@CF;@Code-Lock;@Community-Online-Tools;@Dabs-Framework;@DayZ-Editor-Loader;@FlipTransport;@Inventory-Move-Sounds;@Mortys-Weapons;@MuchCarKey;@SNAFU_Weapons;@Tactical-Flava;@VPPAdminTools
REM ��ģ��
REM -servermod=@AbandonedVehicleRemover)
title %serverName% DayZ Server Doo
cd "%serverLocation%"
echo (%time%) %serverName% �Ѿ�������
start /wait "DayZ Server" /min "DayZServer_x64.exe" -config=%serverConfig% -port=%serverPort% -cpuCount=%serverCPU% -mod=%mods% -dologs -adminlog -netlog -freezecheck
REM �����������ף��ѽ��ã�
REM timeout 25
REM cd /d "%BECLocation%"
REM start "" "bec.exe"
REM ��4Сʱ�Զ�����
REM timeout 14390
REM taskkill /im DayZServer_x64.exe /F
REM taskkill /im bec.exe /F
REM ��������ر��Լ�
echo (%time%) WARNING:�������������߹رգ�5�������......
timeout 5
goto DOO
