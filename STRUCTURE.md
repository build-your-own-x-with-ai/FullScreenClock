# 项目结构图

```
fullscreen_clock/
│
├── 📄 文档文件
│   ├── README.md                    # 项目说明和快速开始指南
│   ├── CHANGELOG.md                 # 版本更新日志
│   ├── RELEASE.md                   # 详细的发布指南（签名、打包、上架）
│   ├── PROJECT_SUMMARY.md           # 项目完成总结
│   ├── QUICK_REFERENCE.md           # 快速参考卡片
│   └── .gitignore                   # Git 忽略配置
│
├── 🔧 构建脚本
│   ├── build_release.bat            # Windows 单平台构建
│   ├── build_release.sh             # Unix 单平台构建
│   ├── build_multi.bat              # Windows 多平台构建（交互式）
│   ├── build_multi.sh               # Unix 多平台构建（交互式）
│   ├── run_dev.bat                  # Windows 开发运行
│   ├── run_dev.sh                   # Unix 开发运行
│   └── generate_icon.py             # 图标生成脚本
│
├── 💻 源代码 (lib/)
│   ├── main.dart                    # 应用入口，窗口初始化
│   ├── clock_screen.dart            # 主时钟显示页面
│   ├── settings_screen.dart         # 设置页面
│   └── config.dart                  # 配置管理类
│
├── 🎨 资源文件 (assets/)
│   ├── icon.png                     # 应用图标源文件 (512x512)
│   └── icon.svg                     # 矢量图标源文件
│
├── ⚙️ 配置文件
│   ├── pubspec.yaml                 # Flutter 依赖配置
│   ├── flutter_launcher_icons.yaml  # 图标生成配置
│   └── analysis_options.yaml        # Dart 分析配置
│
├── 🖥️ 平台配置
│   ├── android/                     # Android 平台配置
│   ├── ios/                         # iOS 平台配置
│   ├── linux/                       # Linux 平台配置
│   ├── macos/                       # macOS 平台配置
│   ├── windows/                     # Windows 平台配置
│   └── web/                         # Web 平台配置
│
└── 📦 构建输出 (build/)
    ├── windows/                     # Windows 构建输出
    ├── macos/                       # macOS 构建输出
    ├── linux/                       # Linux 构建输出
    ├── app/                         # Android 构建输出
    ├── ios/                         # iOS 构建输出
    └── web/                         # Web 构建输出
```

## 文件说明

### 核心源代码

| 文件 | 行数 | 功能 |
|------|------|------|
| `lib/main.dart` | ~40 | 应用入口，初始化窗口管理器 |
| `lib/clock_screen.dart` | ~280 | 主时钟页面，时间显示和交互逻辑 |
| `lib/settings_screen.dart` | ~300 | 设置页面，配置界面 |
| `lib/config.dart` | ~150 | 配置管理，持久化存储 |

### 文档

| 文件 | 用途 |
|------|------|
| `README.md` | 项目概述、功能介绍、快速开始 |
| `CHANGELOG.md` | 版本历史、更新记录、计划功能 |
| `RELEASE.md` | 各平台发布详细指南 |
| `PROJECT_SUMMARY.md` | 完整的项目总结文档 |
| `QUICK_REFERENCE.md` | 快速参考卡片 |

### 脚本

| 文件 | 平台 | 功能 |
|------|------|------|
| `run_dev.bat/.sh` | Win/Unix | 快速启动开发模式 |
| `build_release.bat/.sh` | Win/Unix | 构建当前平台 Release 版本 |
| `build_multi.bat/.sh` | Win/Unix | 交互式多平台构建菜单 |
| `generate_icon.py` | 跨平台 | 生成应用图标（Python） |

## 代码统计

```
总代码行数: ~770 行
- lib/main.dart: ~40 行
- lib/clock_screen.dart: ~280 行
- lib/settings_screen.dart: ~300 行
- lib/config.dart: ~150 行

文档总字数: ~15,000 字
- README.md: ~2,500 字
- RELEASE.md: ~6,000 字
- CHANGELOG.md: ~2,500 字
- PROJECT_SUMMARY.md: ~7,000 字
- QUICK_REFERENCE.md: ~1,500 字

脚本文件: 7 个
文档文件: 5 个
配置文件: 3 个
平台支持: 6 个
```

## 依赖关系

```
main.dart
  ├─→ window_manager (桌面窗口管理)
  ├─→ config.dart (配置管理)
  └─→ clock_screen.dart
       ├─→ config.dart
       ├─→ intl (日期格式化)
       └─→ settings_screen.dart
            ├─→ config.dart
            └─→ flutter_colorpicker (颜色选择)

config.dart
  └─→ shared_preferences (持久化存储)
```

## 构建流程

```
1. 清理
   flutter clean

2. 获取依赖
   flutter pub get

3. 生成图标
   dart run flutter_launcher_icons

4. 构建平台
   flutter build <platform> --release

5. 输出
   build/<platform>/.../
```

## 数据流

```
用户操作
   ↓
ClockScreen / SettingsScreen
   ↓
ClockConfig (配置管理)
   ↓
SharedPreferences (持久化)
   ↓
本地存储
```

## 主要类关系

```
┌─────────────────┐
│   MyApp         │  ← 应用根组件
└────────┬────────┘
         │
    ┌────▼────────────┐
    │ ClockScreen     │  ← 主时钟页面
    └────────┬────────┘
             │
    ┌────────▼──────────┐
    │ SettingsScreen    │  ← 设置页面
    └────────┬──────────┘
             │
    ┌────────▼──────────┐
    │ ClockConfig       │  ← 配置管理（单例）
    └───────────────────┘
```

---

**图例说明：**
- 📄 = 文档
- 🔧 = 脚本
- 💻 = 源代码
- 🎨 = 资源
- ⚙️ = 配置
- 🖥️ = 平台
- 📦 = 构建产物
