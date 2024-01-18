@echo off
chcp 65001
color a
setlocal

if "%1"=="" (
    echo Drag a file into this script to create a Start Menu shortcut.
    pause
    exit /b
)

set "file=%~1"

set "tempFile=%TEMP%\temp.lnk"

echo Creating temporary shortcut...
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%tempFile%'); $Shortcut.TargetPath = '%file%'; $Shortcut.Save()"

echo Modifying the shortcut...
powershell -Command "$bytes = [System.IO.File]::ReadAllBytes('%tempFile%'); $bytes[0x15] = $bytes[0x15] -bor 0x20; [System.IO.File]::WriteAllBytes ('%tempFile%', $bytes)"

echo Moving shortcut to Start Menu...
move "%tempFile%" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\%~n1.lnk"

echo Shortcut successfully created in the Start Menu.
pause
