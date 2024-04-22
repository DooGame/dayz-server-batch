REM 提取DayZServer目录下的所有@开头的模组名称到mods-list.txt文件中
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
echo %folder_names% > mods-list.txt

endlocal
