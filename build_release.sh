#!/bin/bash

echo "===================================="
echo "Building Fullscreen Clock"
echo "===================================="
echo ""

# Detect platform
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

echo "Platform detected: $PLATFORM"
echo ""

echo "[1/4] Cleaning previous builds..."
flutter clean

echo ""
echo "[2/4] Getting dependencies..."
flutter pub get

echo ""
echo "[3/4] Generating app icons..."
dart run flutter_launcher_icons

echo ""
echo "[4/4] Building $PLATFORM Release..."
flutter build $PLATFORM --release

echo ""
echo "===================================="
echo "Build Complete!"
echo "===================================="

if [ "$PLATFORM" = "macos" ]; then
    echo "Output: build/macos/Build/Products/Release/fullscreen_clock.app"
elif [ "$PLATFORM" = "linux" ]; then
    echo "Output: build/linux/x64/release/bundle/"
fi

echo ""
