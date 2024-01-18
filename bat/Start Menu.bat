@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
    echo Drag a file to create a shortcut in the Start Menu.
    pause
    exit
)

set "TargetFile=%~1"
for %%F in ("%TargetFile%") do set "FileName=%%~NF"
set "FileNameWithoutExtension=!FileName:~0,-4!"

set "ShortcutName=!FileNameWithoutExtension!"

set "ShortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\%ShortcutName%.lnk"

echo [InternetShortcut] > "%ShortcutPath%"
echo URL=file:///%TargetFile% >> "%ShortcutPath%"
echo IconFile=%TargetFile% >> "%ShortcutPath%"
echo IconIndex=0 >> "%ShortcutPath%"

echo Shortcut successfully created for "!FileNameWithoutExtension!"!
pause
