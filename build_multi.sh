#!/bin/bash

echo "============================================"
echo "Fullscreen Clock - Multi-Platform Builder"
echo "============================================"
echo ""

# Detect OS
OS="$(uname)"
case $OS in
  'Linux')
    PLATFORM='linux'
    ;;
  'Darwin')
    PLATFORM='macos'
    ;;
  *)
    echo "Unsupported OS: $OS"
    exit 1
    ;;
esac

echo "Detected platform: $PLATFORM"
echo ""
echo "Select build target:"
echo "[1] $PLATFORM"
echo "[2] Android APK"
echo "[3] Android App Bundle"
echo "[4] iOS (macOS only)"
echo "[5] Web"
echo "[6] All available for this platform"
echo "[0] Exit"
echo ""

read -p "Enter your choice (0-6): " choice

prepare() {
    echo ""
    echo "[Prepare] Cleaning previous builds..."
    flutter clean

    echo ""
    echo "[Prepare] Getting dependencies..."
    flutter pub get

    echo ""
    echo "[Prepare] Generating app icons..."
    dart run flutter_launcher_icons

    echo ""
}

build_desktop() {
    echo "[Build] Building $PLATFORM Release..."
    flutter build $PLATFORM --release

    echo ""
    echo "===================================="
    echo "$PLATFORM Build Complete!"

    if [ "$PLATFORM" = "macos" ]; then
        echo "Output: build/macos/Build/Products/Release/fullscreen_clock.app"
    else
        echo "Output: build/linux/x64/release/bundle/"
    fi

    echo "===================================="
}

build_android_apk() {
    echo "[Build] Building Android APK..."
    flutter build apk --release

    echo ""
    echo "===================================="
    echo "Android APK Build Complete!"
    echo "Output: build/app/outputs/flutter-apk/app-release.apk"
    echo "===================================="
}

build_android_bundle() {
    echo "[Build] Building Android App Bundle..."
    flutter build appbundle --release

    echo ""
    echo "===================================="
    echo "Android App Bundle Build Complete!"
    echo "Output: build/app/outputs/bundle/release/app-release.aab"
    echo "===================================="
}

build_ios() {
    if [ "$PLATFORM" != "macos" ]; then
        echo "ERROR: iOS builds are only supported on macOS"
        return 1
    fi

    echo "[Build] Building iOS Release..."
    flutter build ios --release --no-codesign

    echo ""
    echo "===================================="
    echo "iOS Build Complete!"
    echo "Note: Open in Xcode for signing and deployment"
    echo "Output: build/ios/iphoneos/Runner.app"
    echo "===================================="
}

build_web() {
    echo "[Build] Building Web Release..."
    flutter build web --release

    echo ""
    echo "===================================="
    echo "Web Build Complete!"
    echo "Output: build/web/"
    echo "===================================="
}

build_all() {
    echo "[Build 1/X] Building $PLATFORM Release..."
    flutter build $PLATFORM --release
    echo ""

    echo "[Build 2/X] Building Android APK..."
    flutter build apk --release
    echo ""

    if [ "$PLATFORM" = "macos" ]; then
        echo "[Build 3/X] Building iOS Release..."
        flutter build ios --release --no-codesign
        echo ""

        echo "[Build 4/X] Building Web Release..."
        flutter build web --release
    else
        echo "[Build 3/X] Building Web Release..."
        flutter build web --release
    fi

    echo ""
    echo "===================================="
    echo "All Builds Complete!"
    echo "===================================="

    if [ "$PLATFORM" = "macos" ]; then
        echo "macOS:   build/macos/Build/Products/Release/fullscreen_clock.app"
        echo "iOS:     build/ios/iphoneos/Runner.app"
    else
        echo "Linux:   build/linux/x64/release/bundle/"
    fi

    echo "Android: build/app/outputs/flutter-apk/app-release.apk"
    echo "Web:     build/web/"
    echo "===================================="
}

case $choice in
    0)
        echo "Exiting..."
        exit 0
        ;;
    1)
        prepare
        build_desktop
        ;;
    2)
        prepare
        build_android_apk
        ;;
    3)
        prepare
        build_android_bundle
        ;;
    4)
        prepare
        build_ios
        ;;
    5)
        prepare
        build_web
        ;;
    6)
        prepare
        build_all
        ;;
    *)
        echo "Invalid choice!"
        exit 1
        ;;
esac

echo ""
echo "Done!"
