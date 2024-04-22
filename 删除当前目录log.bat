@echo off
echo Deleting .log files in the current directory...

for %%i in (*.log) do (
    echo Deleting %%i...
    del "%%i"
)

echo All .log files have been deleted.
pause
