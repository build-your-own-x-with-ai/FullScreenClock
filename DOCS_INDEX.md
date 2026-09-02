# 📚 项目文档导航

欢迎来到 Fullscreen Clock 项目！本文档帮助你快速找到需要的信息。

## 🎯 我想要...

### 快速开始使用
→ **[QUICK_REFERENCE.md](QUICK_REFERENCE.md)** - 快速参考卡片，包含所有常用命令和快捷键

### 了解项目功能
→ **[README.md](README.md)** - 项目完整说明，功能特性，使用指南

### 查看项目结构
→ **[STRUCTURE.md](STRUCTURE.md)** - 完整的项目结构图和代码统计

### 发布应用
→ **[RELEASE.md](RELEASE.md)** - 各平台详细的发布指南（签名、打包、上架）

### 查看更新历史
→ **[CHANGELOG.md](CHANGELOG.md)** - 版本更新日志和计划功能

### 了解项目详情
→ **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** - 完整的项目总结和技术实现

---

## 📖 文档分类

### 🚀 入门文档
1. **[QUICK_REFERENCE.md](QUICK_REFERENCE.md)** ⭐ 推荐首读
   - 快捷键速查
   - 常用命令
   - 默认配置
   - 问题排查

2. **[README.md](README.md)**
   - 项目介绍
   - 功能特性
   - 安装依赖
   - 运行和构建

### 🔧 开发文档
3. **[STRUCTURE.md](STRUCTURE.md)**
   - 项目结构图
   - 代码统计
   - 依赖关系
   - 数据流图

4. **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)**
   - 技术实现
   - 已完成功能
   - 技术亮点
   - 未来改进

### 📦 发布文档
5. **[RELEASE.md](RELEASE.md)**
   - Windows 打包
   - macOS 签名和公证
   - Linux 打包（AppImage/Snap/Flatpak）
   - Android 签名和上架
   - iOS 签名和上架
   - Web 部署

6. **[CHANGELOG.md](CHANGELOG.md)**
   - 版本历史
   - 更新日志
   - 计划功能
   - 版本规范

---

## 🎬 快速导航

### 我是第一次使用
```
1. 阅读 QUICK_REFERENCE.md（3 分钟）
2. 执行 flutter pub get
3. 运行 flutter run 或 ./run_dev.sh
4. 开始使用！
```

### 我要开发和修改代码
```
1. 阅读 README.md 的"依赖项"和"项目结构"部分
2. 查看 STRUCTURE.md 了解代码组织
3. 阅读 PROJECT_SUMMARY.md 了解技术实现
4. 开始开发
```

### 我要构建 Release 版本
```
1. 阅读 QUICK_REFERENCE.md 的"构建命令"部分
2. 运行 ./build_release.sh 或 ./build_multi.sh
3. 在 build/ 目录查看输出
```

### 我要发布应用
```
1. 完整阅读 RELEASE.md
2. 按照目标平台的详细步骤操作
3. 更新 CHANGELOG.md 记录版本
4. 创建 Git 标签
```

---

## 📂 脚本使用指南

### 开发运行脚本
| Windows | Unix | 说明 |
|---------|------|------|
| `run_dev.bat` | `run_dev.sh` | 自动安装依赖并运行 |

### 构建脚本
| Windows | Unix | 说明 |
|---------|------|------|
| `build_release.bat` | `build_release.sh` | 构建当前平台 |
| `build_multi.bat` | `build_multi.sh` | 交互式多平台构建 |

### 工具脚本
| 脚本 | 说明 |
|------|------|
| `generate_icon.py` | 生成应用图标（Python） |

**使用方法：**
```bash
# Windows
.\run_dev.bat
.\build_release.bat
.\build_multi.bat

# macOS/Linux（首次需要添加执行权限）
chmod +x *.sh
./run_dev.sh
./build_release.sh
./build_multi.sh
```

---

## 🆘 遇到问题？

### 常见问题快速查找

| 问题 | 查看文档 | 章节 |
|------|----------|------|
| 如何运行？ | QUICK_REFERENCE.md | 快速开始 |
| 构建失败？ | QUICK_REFERENCE.md | 问题排查 |
| 如何配置颜色？ | README.md | 使用说明 |
| 如何发布到商店？ | RELEASE.md | 对应平台章节 |
| 配置保存在哪里？ | PROJECT_SUMMARY.md | 技术实现 |
| 代码在哪个文件？ | STRUCTURE.md | 源代码说明 |

### 问题排查流程
```
1. 检查 QUICK_REFERENCE.md 的"问题排查"部分
2. 运行 flutter clean && flutter pub get
3. 检查 Flutter 版本和环境配置
4. 查看控制台错误信息
5. 搜索相关文档
```

---

## 📊 文档阅读时间估算

| 文档 | 阅读时间 | 适合人群 |
|------|----------|----------|
| QUICK_REFERENCE.md | 3 分钟 | 所有人 ⭐ |
| README.md | 10 分钟 | 新用户 |
| STRUCTURE.md | 5 分钟 | 开发者 |
| PROJECT_SUMMARY.md | 15 分钟 | 深度了解 |
| RELEASE.md | 20 分钟 | 发布者 |
| CHANGELOG.md | 5 分钟 | 关注更新 |

**总计：** 约 60 分钟完整阅读所有文档

---

## 🔗 外部资源

- [Flutter 官方文档](https://flutter.dev/docs)
- [Flutter 中文网](https://flutter.cn/)
- [Dart 语言官网](https://dart.dev/)
- [Flutter Package 仓库](https://pub.dev/)

---

## ✨ 推荐阅读顺序

### 新手用户（只想使用应用）
1. QUICK_REFERENCE.md（必读）
2. README.md 的"功能特性"和"使用说明"部分

### 开发者（想修改代码）
1. QUICK_REFERENCE.md
2. README.md
3. STRUCTURE.md
4. PROJECT_SUMMARY.md
5. 源代码注释

### 发布者（要打包发布）
1. QUICK_REFERENCE.md
2. README.md
3. RELEASE.md（重点）
4. CHANGELOG.md

---

**提示：** 所有文档都支持 Markdown 格式，可以在 GitHub、GitLab 或任何 Markdown 阅读器中完美显示。

**版本：** 1.0.0 | **更新：** 2026-09-02
