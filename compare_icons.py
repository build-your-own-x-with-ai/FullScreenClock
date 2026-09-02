#!/usr/bin/env python3
"""比较图标内容是否相同"""

from PIL import Image
import hashlib

def get_image_hash(path):
    """获取图片内容的哈希值"""
    try:
        with Image.open(path) as img:
            # 转换为统一格式进行比较
            img = img.convert('RGBA')
            return hashlib.md5(img.tobytes()).hexdigest()
    except Exception as e:
        return f"Error: {e}"

def main():
    source = "assets/icon.png"
    ios_icon = "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png"
    macos_icon = "macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_1024.png"

    print("Comparing icon hashes...")
    print(f"Source (assets/icon.png): {get_image_hash(source)}")
    print(f"iOS icon (1024x1024): {get_image_hash(ios_icon)}")
    print(f"macOS icon (1024): {get_image_hash(macos_icon)}")
    print()

    # 显示图标内容
    with Image.open(source) as img:
        print(f"Source icon size: {img.size}, mode: {img.mode}")

    with Image.open(ios_icon) as img:
        print(f"iOS icon size: {img.size}, mode: {img.mode}")

    with Image.open(macos_icon) as img:
        print(f"macOS icon size: {img.size}, mode: {img.mode}")

if __name__ == '__main__':
    main()
