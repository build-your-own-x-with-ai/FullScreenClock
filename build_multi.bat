@echo off
setlocal enabledelayedexpansion

echo ============================================
echo Fullscreen Clock - Multi-Platform Builder
echo ============================================
echo.
echo Select build target:
echo [1] Windows
echo [2] Android APK
echo [3] Android App Bundle
echo [4] Web
echo [5] All (Windows + Android + Web)
echo [0] Exit
echo.

set /p choice="Enter your choice (0-5): "

if "%choice%"=="0" goto :end
if "%choice%"=="1" goto :windows
if "%choice%"=="2" goto :android_apk
if "%choice%"=="3" goto :android_bundle
if "%choice%"=="4" goto :web
if "%choice%"=="5" goto :all

echo Invalid choice!
pause
goto :end

:prepare
echo.
echo [Prepare] Cleaning previous builds...
call flutter clean
echo.
echo [Prepare] Getting dependencies...
call flutter pub get
echo.
echo [Prepare] Generating app icons...
call dart run flutter_launcher_icons
echo.
exit /b 0

:windows
call :prepare
echo [Build] Building Windows Release...
call flutter build windows --release
echo.
echo ====================================
echo Windows Build Complete!
echo Output: build\windows\x64\runner\Release\
echo ====================================
goto :done

:android_apk
call :prepare
echo [Build] Building Android APK...
call flutter build apk --release
echo.
echo ====================================
echo Android APK Build Complete!
echo Output: build\app\outputs\flutter-apk\app-release.apk
echo ====================================
goto :done

:android_bundle
call :prepare
echo [Build] Building Android App Bundle...
call flutter build appbundle --release
echo.
echo ====================================
echo Android App Bundle Build Complete!
echo Output: build\app\outputs\bundle\release\app-release.aab
echo ====================================
goto :done

:web
call :prepare
echo [Build] Building Web Release...
call flutter build web --release
echo.
echo ====================================
echo Web Build Complete!
echo Output: build\web\
echo ====================================
goto :done

:all
call :prepare

echo [Build 1/3] Building Windows Release...
call flutter build windows --release
echo.

echo [Build 2/3] Building Android APK...
call flutter build apk --release
echo.

echo [Build 3/3] Building Web Release...
call flutter build web --release
echo.

echo ====================================
echo All Builds Complete!
echo ====================================
echo Windows: build\windows\x64\runner\Release\
echo Android: build\app\outputs\flutter-apk\app-release.apk
echo Web:     build\web\
echo ====================================
goto :done

:done
echo.
pause

:end
