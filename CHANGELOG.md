# Changelog

All notable changes to Fullscreen Clock will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2026-09-02

### Added
- 初始版本发布
- 精确时间显示（HH:mm:ss.SSS 格式，包含毫秒）
- 日期显示（YYYY-MM-DD 星期格式）
- 自定义背景颜色
- 自定义时间颜色
- 自定义日期颜色
- 时间字体大小调节（40-300）
- 日期字体大小调节（20-100）
- 日期显示/隐藏切换
- 全屏模式支持
- 双击屏幕切换全屏
- F11 快捷键切换全屏
- 右侧滚轮快速调整字体大小
- 设置页面（完整的配置选项）
- 配置自动保存到本地
- 跨平台支持（Windows、macOS、Linux、Android、iOS、Web）
- 应用图标（所有平台）
- 构建脚本（单平台和多平台）
- 开发运行脚本
- 完整的文档（README、RELEASE）

### Technical
- Flutter 框架
- 使用 shared_preferences 进行配置持久化
- 使用 window_manager 管理桌面窗口
- 使用 intl 进行日期格式化
- 使用 flutter_colorpicker 进行颜色选择
- 使用 flutter_launcher_icons 生成应用图标

## 计划中的功能

### [1.1.0] - 未来版本
- [ ] 多时区支持
- [ ] 12/24 小时制切换
- [ ] 秒表功能
- [ ] 倒计时功能
- [ ] 自定义字体选择
- [ ] 背景图片支持
- [ ] 主题预设（经典、霓虹、极简等）
- [ ] 动画效果选项
- [ ] 声音提示（整点报时）

### [1.2.0] - 未来版本
- [ ] 番茄钟功能
- [ ] 提醒功能
- [ ] 世界时钟（多城市显示）
- [ ] 日历视图
- [ ] 天气显示（可选）
- [ ] 快捷键自定义

### [2.0.0] - 未来版本
- [ ] 小部件模式（桌面小部件）
- [ ] 多显示器支持
- [ ] 云同步配置
- [ ] 插件系统
- [ ] 社区主题库

---

## 版本说明

### 版本格式
- **主版本号 (X.0.0)**: 重大功能变更或架构调整
- **次版本号 (0.X.0)**: 新功能添加，向后兼容
- **补丁版本号 (0.0.X)**: Bug 修复和小改进

### 标签说明
- **Added**: 新功能
- **Changed**: 现有功能的变更
- **Deprecated**: 即将移除的功能
- **Removed**: 已移除的功能
- **Fixed**: Bug 修复
- **Security**: 安全相关的修复

[Unreleased]: https://github.com/yourusername/fullscreen_clock/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/yourusername/fullscreen_clock/releases/tag/v1.0.0
