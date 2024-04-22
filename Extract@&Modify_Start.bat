@echo off
setlocal enabledelayedexpansion

set "folder_names="

for /d %%i in (DayZServer\@*) do (
    set "folder=%%~nxi"
    if /i not "!folder:~0,11!"=="@DayZServer" (
        if not "!folder_names!"=="" (
            set "folder_names=!folder_names!;!folder!"
        ) else (
            set "folder_names=!folder!"
        )
    )
)

REM 使用年月日时间和4位编号作为时间戳
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (
    set "timestamp=%%a_%%b%%c"
)
for /f "tokens=1-2 delims=:" %%a in ('time /t') do (
    set "timestamp=!timestamp!_%%a%%b"
)
set /a "count=1"

:check_exist
if exist "DooZ_!timestamp!_!count!.bat" (
    set /a "count+=1"
    goto check_exist
)

REM 获取start.bat的文件名（不包括扩展名）
for %%F in (start.bat) do set "filename=%%~nF"

REM 备份start.bat
copy start.bat "!filename!_!timestamp!_!count!.bat"

REM 替换start.bat中的set mods=后面的内容
set "new_line=set mods=!folder_names!"
set "temp_file=DooZ_temp.bat"

(for /f "delims=" %%a in (start.bat) do (
    set "line=%%a"
    if "!line:~0,9!"=="set mods=" (
        echo !new_line!
    ) else (
        echo %%a
    )
)) > "!temp_file!"

move /y "!temp_file!" start.bat

endlocal
