@echo off
echo ====================================
echo Building Fullscreen Clock - Windows
echo ====================================
echo.

echo [1/4] Cleaning previous builds...
call flutter clean

echo.
echo [2/4] Getting dependencies...
call flutter pub get

echo.
echo [3/4] Generating app icons...
call dart run flutter_launcher_icons

echo.
echo [4/4] Building Windows Release...
call flutter build windows --release

echo.
echo ====================================
echo Build Complete!
echo ====================================
echo Output: build\windows\x64\runner\Release\
echo.
pause
