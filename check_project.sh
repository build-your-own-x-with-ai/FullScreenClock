#!/bin/bash
# 项目完整性检查脚本

echo "🔍 Fullscreen Clock 项目完整性检查"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 检查计数器
TOTAL=0
PASSED=0
FAILED=0

# 检查函数
check_file() {
    TOTAL=$((TOTAL + 1))
    if [ -f "$1" ]; then
        echo "✅ $1"
        PASSED=$((PASSED + 1))
    else
        echo "❌ $1 (缺失)"
        FAILED=$((FAILED + 1))
    fi
}

check_dir() {
    TOTAL=$((TOTAL + 1))
    if [ -d "$1" ]; then
        echo "✅ $1/"
        PASSED=$((PASSED + 1))
    else
        echo "❌ $1/ (缺失)"
        FAILED=$((FAILED + 1))
    fi
}

echo "📄 检查文档文件..."
check_file "README.md"
check_file "CHANGELOG.md"
check_file "RELEASE.md"
check_file "PROJECT_SUMMARY.md"
check_file "QUICK_REFERENCE.md"
check_file "STRUCTURE.md"
check_file "DOCS_INDEX.md"
check_file ".gitignore"
echo ""

echo "💻 检查源代码文件..."
check_file "lib/main.dart"
check_file "lib/clock_screen.dart"
check_file "lib/settings_screen.dart"
check_file "lib/config.dart"
echo ""

echo "🔧 检查构建脚本..."
check_file "build_release.bat"
check_file "build_release.sh"
check_file "build_multi.bat"
check_file "build_multi.sh"
check_file "run_dev.bat"
check_file "run_dev.sh"
check_file "generate_icon.py"
echo ""

echo "⚙️ 检查配置文件..."
check_file "pubspec.yaml"
check_file "flutter_launcher_icons.yaml"
check_file "analysis_options.yaml"
echo ""

echo "🎨 检查资源文件..."
check_file "assets/icon.png"
check_file "assets/icon.svg"
echo ""

echo "🖥️ 检查平台目录..."
check_dir "android"
check_dir "ios"
check_dir "linux"
check_dir "macos"
check_dir "windows"
check_dir "web"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 检查结果统计"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "总计: $TOTAL 项"
echo "通过: $PASSED 项 ✅"
echo "失败: $FAILED 项 ❌"
echo ""

if [ $FAILED -eq 0 ]; then
    echo "✨ 所有检查通过！项目结构完整。"
    echo ""
    echo "🚀 下一步操作："
    echo "   1. 运行: flutter pub get"
    echo "   2. 运行: dart run flutter_launcher_icons"
    echo "   3. 运行: ./run_dev.sh"
    exit 0
else
    echo "⚠️  发现 $FAILED 个问题，请检查缺失的文件。"
    exit 1
fi
