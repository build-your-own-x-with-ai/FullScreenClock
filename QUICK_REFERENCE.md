# 快速参考卡片

## 🚀 快速开始

```bash
# 1. 安装依赖
flutter pub get

# 2. 运行应用
flutter run

# 或使用脚本
.\run_dev.bat        # Windows
./run_dev.sh         # macOS/Linux
```

## ⌨️ 快捷键

| 操作 | 快捷键 |
|------|--------|
| 切换全屏 | `F11` 或 双击屏幕 |
| 打开设置 | 点击右上角齿轮图标 |
| 调整字体 | 右侧滚轮上下滑动 |

## 🎨 默认配置

| 项目 | 默认值 |
|------|--------|
| 背景颜色 | 黑色 (#000000) |
| 时间颜色 | 白色 (#FFFFFF) |
| 日期颜色 | 白色 (#FFFFFF) |
| 时间字体大小 | 100 |
| 日期字体大小 | 40 |
| 显示日期 | 是 |
| 全屏模式 | 否 |

## 🔨 构建命令

```bash
# 单平台构建
.\build_release.bat              # Windows
./build_release.sh               # macOS/Linux

# 多平台构建（交互式菜单）
.\build_multi.bat                # Windows
./build_multi.sh                 # macOS/Linux

# 手动构建特定平台
flutter build windows --release  # Windows
flutter build macos --release    # macOS
flutter build linux --release    # Linux
flutter build apk --release      # Android
flutter build ios --release      # iOS
flutter build web --release      # Web
```

## 📦 构建输出

| 平台 | 位置 |
|------|------|
| Windows | `build\windows\x64\runner\Release\` |
| macOS | `build/macos/Build/Products/Release/` |
| Linux | `build/linux/x64/release/bundle/` |
| Android | `build/app/outputs/flutter-apk/` |
| iOS | `build/ios/iphoneos/` |
| Web | `build/web/` |

## 🛠️ 常用命令

```bash
# 清理构建
flutter clean

# 获取依赖
flutter pub get

# 生成图标
dart run flutter_launcher_icons

# 查看可用设备
flutter devices

# 运行在指定设备
flutter run -d windows
flutter run -d chrome
```

## 📱 支持平台

- ✅ Windows 10/11
- ✅ macOS 10.14+
- ✅ Linux
- ✅ Android 5.0+
- ✅ iOS 12.0+
- ✅ Web (所有现代浏览器)

## 📚 文档

- [README.md](README.md) - 项目说明
- [RELEASE.md](RELEASE.md) - 发布指南
- [CHANGELOG.md](CHANGELOG.md) - 更新日志
- [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md) - 项目总结

## 🐛 问题排查

### 构建失败
```bash
flutter clean
flutter pub get
dart run flutter_launcher_icons
# 然后重新构建
```

### 配置未保存
- 检查应用是否有写入权限
- 确认 shared_preferences 已正确安装

### 窗口管理问题
- 确认 window_manager 依赖已安装
- 仅在桌面平台（Windows/macOS/Linux）上可用

## 💡 提示

1. 首次运行需要执行 `flutter pub get`
2. 修改图标后需要运行 `dart run flutter_launcher_icons`
3. 构建 Release 版本前建议先运行 `flutter clean`
4. macOS 和 iOS 发布需要签名证书
5. 所有配置自动保存，无需手动保存

## 🔗 相关链接

- [Flutter 官方文档](https://flutter.dev/docs)
- [Flutter 中文网](https://flutter.cn/)
- [Dart 语言官网](https://dart.dev/)

---

**版本**: 1.0.0 | **更新日期**: 2026-09-02
