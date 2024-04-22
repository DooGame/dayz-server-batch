@echo off
chcp 65001  >nul

set "source_folder=DayZServer"
set "target_folder=keys"

REM 检查目标文件夹是否存在，如果不存在则创建它
if not exist "%source_folder%\%target_folder%" (
    mkdir "%source_folder%\%target_folder%"
)

REM 遍历源文件夹中的所有以@开头的文件夹
for /d %%D in ("%source_folder%\@*") do (
    REM 检查源文件夹中是否存在Keys子文件夹
    if exist "%%D\Keys" (
        REM 遍历Keys子文件夹中的所有.bikey文件
        for %%F in ("%%D\Keys\*.bikey") do (
            REM 检查目标文件夹中是否已存在同名文件
            if not exist "%source_folder%\%target_folder%\%%~nxF" (
                copy "%%F" "%source_folder%\%target_folder%"
                echo 已复制 %%~nxF 从 %%D\Keys 到 %source_folder%\%target_folder%
            ) else (
                choice /C YN /M "文件 %%~nxF 已存在于 %source_folder%\%target_folder%，是否覆盖？(Y/N)"
                if errorlevel 2 (
                    echo 跳过 %%~nxF 从 %%D\Keys
                ) else if errorlevel 1 (
                    copy "%%F" "%source_folder%\%target_folder%"
                    echo 已覆盖 %%~nxF 从 %%D\Keys 到 %source_folder%\%target_folder%
                )
            )
        )
    )
)

echo 任务完成。
pause
