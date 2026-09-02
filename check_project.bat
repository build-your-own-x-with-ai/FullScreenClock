@echo off
REM 项目完整性检查脚本 (Windows)

echo 🔍 Fullscreen Clock 项目完整性检查
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

setlocal enabledelayedexpansion
set TOTAL=0
set PASSED=0
set FAILED=0

echo 📄 检查文档文件...
call :check_file "README.md"
call :check_file "CHANGELOG.md"
call :check_file "RELEASE.md"
call :check_file "PROJECT_SUMMARY.md"
call :check_file "QUICK_REFERENCE.md"
call :check_file "STRUCTURE.md"
call :check_file "DOCS_INDEX.md"
call :check_file ".gitignore"
echo.

echo 💻 检查源代码文件...
call :check_file "lib\main.dart"
call :check_file "lib\clock_screen.dart"
call :check_file "lib\settings_screen.dart"
call :check_file "lib\config.dart"
echo.

echo 🔧 检查构建脚本...
call :check_file "build_release.bat"
call :check_file "build_release.sh"
call :check_file "build_multi.bat"
call :check_file "build_multi.sh"
call :check_file "run_dev.bat"
call :check_file "run_dev.sh"
call :check_file "generate_icon.py"
echo.

echo ⚙️ 检查配置文件...
call :check_file "pubspec.yaml"
call :check_file "flutter_launcher_icons.yaml"
call :check_file "analysis_options.yaml"
echo.

echo 🎨 检查资源文件...
call :check_file "assets\icon.png"
call :check_file "assets\icon.svg"
echo.

echo 🖥️ 检查平台目录...
call :check_dir "android"
call :check_dir "ios"
call :check_dir "linux"
call :check_dir "macos"
call :check_dir "windows"
call :check_dir "web"
echo.

echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 📊 检查结果统计
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 总计: %TOTAL% 项
echo 通过: %PASSED% 项 ✅
echo 失败: %FAILED% 项 ❌
echo.

if %FAILED% EQU 0 (
    echo ✨ 所有检查通过！项目结构完整。
    echo.
    echo 🚀 下一步操作：
    echo    1. 运行: flutter pub get
    echo    2. 运行: dart run flutter_launcher_icons
    echo    3. 运行: .\run_dev.bat
    exit /b 0
) else (
    echo ⚠️  发现 %FAILED% 个问题，请检查缺失的文件。
    exit /b 1
)

:check_file
set /a TOTAL+=1
if exist %~1 (
    echo ✅ %~1
    set /a PASSED+=1
) else (
    echo ❌ %~1 ^(缺失^)
    set /a FAILED+=1
)
exit /b

:check_dir
set /a TOTAL+=1
if exist %~1\ (
    echo ✅ %~1\
    set /a PASSED+=1
) else (
    echo ❌ %~1\ ^(缺失^)
    set /a FAILED+=1
)
exit /b
