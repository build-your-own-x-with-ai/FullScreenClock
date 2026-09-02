@echo off
echo ====================================
echo Fullscreen Clock - Quick Run
echo ====================================
echo.

echo Getting dependencies...
call flutter pub get

echo.
echo Available devices:
call flutter devices

echo.
echo Starting app...
call flutter run

pause
