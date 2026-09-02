#!/usr/bin/env python3
"""生成应用截图示例图片"""

from PIL import Image, ImageDraw, ImageFont
import os

def create_screenshot(filename, width, height, bg_color, time_text, time_color,
                     date_text=None, date_color=None, show_settings=False):
    """创建截图"""
    img = Image.new('RGB', (width, height), bg_color)
    draw = ImageDraw.Draw(img)

    try:
        # 尝试使用系统字体
        time_font = ImageFont.truetype("arial.ttf", 120)
        date_font = ImageFont.truetype("arial.ttf", 40)
        small_font = ImageFont.truetype("arial.ttf", 20)
    except:
        # 如果系统字体不可用，使用默认字体
        time_font = ImageFont.load_default()
        date_font = ImageFont.load_default()
        small_font = ImageFont.load_default()

    # 绘制时间
    time_bbox = draw.textbbox((0, 0), time_text, font=time_font)
    time_width = time_bbox[2] - time_bbox[0]
    time_height = time_bbox[3] - time_bbox[1]
    time_x = (width - time_width) // 2
    time_y = (height - time_height) // 2
    if date_text:
        time_y -= 50
    draw.text((time_x, time_y), time_text, fill=time_color, font=time_font)

    # 绘制日期
    if date_text:
        date_bbox = draw.textbbox((0, 0), date_text, font=date_font)
        date_width = date_bbox[2] - date_bbox[0]
        date_x = (width - date_width) // 2
        date_y = time_y + time_height + 30
        draw.text((date_x, date_y), date_text, fill=date_color, font=date_font)

    # 绘制设置按钮（右上角）
    if show_settings:
        settings_size = 40
        settings_x = width - settings_size - 20
        settings_y = 20
        draw.ellipse([settings_x, settings_y, settings_x + settings_size,
                     settings_y + settings_size], outline=(200, 200, 200), width=2)
        draw.text((settings_x + 10, settings_y + 8), "⚙", fill=(200, 200, 200), font=date_font)

    # 保存图片
    os.makedirs('screenshots', exist_ok=True)
    img.save(f'screenshots/{filename}')
    print(f"Created: {filename}")

def main():
    """生成所有截图"""
    print("Starting to generate application screenshots...")
    print()

    # 1. 主界面 - 黑色背景，白色时间
    create_screenshot(
        'main_screen.png',
        1200, 800,
        (0, 0, 0),
        '13:45:27.123',
        (255, 255, 255),
        '2026-09-02 星期二',
        (255, 255, 255),
        show_settings=True
    )

    # 2. 蓝色主题
    create_screenshot(
        'blue_theme.png',
        1200, 800,
        (13, 27, 42),
        '09:30:15.456',
        (56, 189, 248),
        '2026-09-02 星期二',
        (147, 197, 253),
        show_settings=True
    )

    # 3. 绿色主题
    create_screenshot(
        'green_theme.png',
        1200, 800,
        (6, 28, 19),
        '16:20:50.789',
        (110, 231, 183),
        '2026-09-02 星期二',
        (167, 243, 208),
        show_settings=True
    )

    # 4. 橙色主题
    create_screenshot(
        'orange_theme.png',
        1200, 800,
        (28, 18, 8),
        '22:15:33.012',
        (251, 146, 60),
        '2026-09-02 星期二',
        (253, 186, 116),
        show_settings=True
    )

    # 5. 只显示时间（无日期）
    create_screenshot(
        'time_only.png',
        1200, 800,
        (0, 0, 0),
        '19:08:42.345',
        (255, 255, 255),
        show_settings=True
    )

    print()
    print("=" * 50)
    print("All screenshots generated successfully!")
    print()
    print("Screenshots saved to: screenshots/")
    print("  - main_screen.png - Main screen (black & white)")
    print("  - blue_theme.png - Blue theme")
    print("  - green_theme.png - Green theme")
    print("  - orange_theme.png - Orange theme")
    print("  - time_only.png - Time only (no date)")
    print()

if __name__ == '__main__':
    main()
