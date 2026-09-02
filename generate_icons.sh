#!/bin/bash

echo "Generating app icons for all platforms..."
echo ""

flutter pub get
dart run flutter_launcher_icons

echo ""
echo "Icon generation complete!"
echo ""
echo "Generated icons for:"
echo "- Android"
echo "- iOS"
echo "- Web"
echo "- Windows"
echo "- macOS"
echo "- Linux"
echo ""
