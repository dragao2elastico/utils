@echo off
chcp 65001
color a
setlocal

>nul 2>&1 net session
if %errorLevel% neq 0 (
    echo The script needs to be run with administrator privileges.
    echo Please run the command prompt as administrator and try again.
    pause
    exit /b
)

whether a file was dragged into the script
if "%1"=="" (
    echo Drag a file into this script to delete the Start Menu shortcut.
    pause
    exit /b
)

set "filename=%~n1"

echo Deleting Start Menu shortcut...
del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\%Filename%.lnk" /q

echo Shortcut successfully deleted from Start Menu.
pause
