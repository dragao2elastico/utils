## Instalation
1. Enable Linux/install terminal
2. Run this command: 
```py
sudo apt install wine
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install wine32
```
3. Test if **Wine** get successfully installed and doesn't have any error running this command: `wine`

## Run Windows app (.exe) with Wine
1. First run `cd` in the directory, example: `cd C:\path\to\your\file`
2. After do this run `wine yourFile.exe`
3. And congratulations, if everything is right the program will start normally

> Batch code:
```bat
cd C:\path\to\your\file
wine yourFile.exe
```

> If you get an error use this one:
```bat
sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386
```
