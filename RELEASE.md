# 版本发布指南

本文档说明如何为不同平台打包和发布 Fullscreen Clock 应用。

## 版本号管理

版本号在 `pubspec.yaml` 中定义：

```yaml
version: 1.0.0+1
```

格式：`主版本.次版本.补丁版本+构建号`

更新版本时，修改此行并重新构建所有平台。

## 构建前检查清单

- [ ] 更新 `pubspec.yaml` 中的版本号
- [ ] 测试所有主要功能
- [ ] 检查配置是否正确保存和加载
- [ ] 验证全屏模式在所有平台上工作正常
- [ ] 确认图标已生成（运行 `dart run flutter_launcher_icons`）
- [ ] 更新 CHANGELOG.md（如果有）

## Windows 发布

### 构建

```powershell
.\build_release.bat
```

或使用多平台脚本选择 Windows。

### 输出位置

```
build\windows\x64\runner\Release\
```

### 打包

Windows 版本包含以下文件：
- `fullscreen_clock.exe` - 主程序
- `flutter_windows.dll` - Flutter 运行时
- `data/` - 资源文件夹
- 其他必需的 DLL 文件

**打包步骤：**

1. 将整个 `Release` 文件夹复制到新位置
2. 重命名文件夹为 `fullscreen_clock-windows-v1.0.0`
3. 压缩为 `.zip` 文件

**可选：创建安装程序**

可以使用 Inno Setup 或 NSIS 创建 Windows 安装程序。

## macOS 发布

### 构建

```bash
chmod +x build_release.sh
./build_release.sh
```

### 输出位置

```
build/macos/Build/Products/Release/fullscreen_clock.app
```

### 代码签名（可选但推荐）

```bash
# 查看可用的签名证书
security find-identity -v -p codesigning

# 签名应用
codesign --deep --force --verify --verbose --sign "Developer ID Application: Your Name" fullscreen_clock.app

# 验证签名
codesign --verify --deep --strict --verbose=2 fullscreen_clock.app
```

### 公证（Notarization）

macOS 10.15+ 需要公证：

```bash
# 创建 DMG
hdiutil create -volname "Fullscreen Clock" -srcfolder fullscreen_clock.app -ov -format UDZO fullscreen_clock.dmg

# 上传公证
xcrun notarytool submit fullscreen_clock.dmg --apple-id "your@email.com" --password "app-specific-password" --team-id "TEAM_ID"

# 等待公证完成后，装订公证票据
xcrun stapler staple fullscreen_clock.app
```

### 打包

**方法 1: 直接打包 .app**
```bash
zip -r fullscreen_clock-macos-v1.0.0.zip fullscreen_clock.app
```

**方法 2: 创建 DMG**
```bash
hdiutil create -volname "Fullscreen Clock" -srcfolder fullscreen_clock.app -ov -format UDZO fullscreen_clock-v1.0.0.dmg
```

## Linux 发布

### 构建

```bash
chmod +x build_release.sh
./build_release.sh
```

### 输出位置

```
build/linux/x64/release/bundle/
```

### 打包

**方法 1: Tar.gz 压缩包**
```bash
cd build/linux/x64/release/
tar -czf fullscreen_clock-linux-v1.0.0.tar.gz bundle/
```

**方法 2: AppImage（需要额外工具）**

使用 `appimagetool` 创建 AppImage：

1. 安装 appimagetool
2. 创建 AppDir 结构
3. 运行 `appimagetool AppDir fullscreen_clock.AppImage`

**方法 3: Snap（需要 snapcraft）**

创建 `snap/snapcraft.yaml` 配置文件并运行：
```bash
snapcraft
```

**方法 4: Flatpak（需要 flatpak-builder）**

创建 flatpak manifest 并构建。

## Android 发布

### 构建 APK（测试用）

```bash
flutter build apk --release
```

输出：`build/app/outputs/flutter-apk/app-release.apk`

### 构建 App Bundle（Google Play）

```bash
flutter build appbundle --release
```

输出：`build/app/outputs/bundle/release/app-release.aab`

### 签名配置

在 `android/app/build.gradle` 中配置签名：

```gradle
android {
    ...
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

创建 `android/key.properties`：
```properties
storePassword=your_store_password
keyPassword=your_key_password
keyAlias=your_key_alias
storeFile=/path/to/your/keystore.jks
```

### 发布到 Google Play

1. 登录 [Google Play Console](https://play.google.com/console/)
2. 创建新应用
3. 上传 `.aab` 文件
4. 填写应用详情、截图、描述
5. 提交审核

## iOS 发布

### 构建

```bash
flutter build ios --release
```

### Xcode 配置

1. 打开 `ios/Runner.xcworkspace`
2. 配置 Bundle Identifier
3. 配置签名证书和 Provisioning Profile
4. 选择 "Any iOS Device (arm64)"
5. Product > Archive
6. Distribute App

### 发布到 App Store

1. 在 Xcode Organizer 中选择构建
2. 选择 "Distribute App"
3. 选择 "App Store Connect"
4. 上传到 App Store Connect
5. 在 [App Store Connect](https://appstoreconnect.apple.com/) 中提交审核

## Web 发布

### 构建

```bash
flutter build web --release
```

输出：`build/web/`

### 部署

**方法 1: 静态网站托管**

将 `build/web/` 目录内容上传到：
- GitHub Pages
- Netlify
- Vercel
- Firebase Hosting
- AWS S3 + CloudFront

**方法 2: 自托管**

使用 Nginx 或 Apache：

Nginx 配置示例：
```nginx
server {
    listen 80;
    server_name clock.example.com;
    root /var/www/fullscreen_clock;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

## 发布检查清单

发布前确认：

- [ ] 版本号已更新
- [ ] 所有平台测试通过
- [ ] 图标正确显示
- [ ] 配置保存/加载正常
- [ ] 全屏功能正常
- [ ] 没有控制台错误
- [ ] 文档已更新
- [ ] CHANGELOG 已更新
- [ ] Git 标签已创建（`git tag v1.0.0`）

## 分发渠道

- **GitHub Releases** - 所有平台
- **Microsoft Store** - Windows
- **Mac App Store** - macOS
- **Google Play** - Android
- **App Store** - iOS
- **Snap Store** - Linux
- **Flathub** - Linux

## 版本号约定

- **主版本**：重大功能变更或不兼容更新
- **次版本**：新功能添加，向后兼容
- **补丁版本**：Bug 修复和小改进
- **构建号**：每次构建递增

示例：
- `1.0.0+1` - 初始发布
- `1.0.1+2` - Bug 修复
- `1.1.0+3` - 新功能
- `2.0.0+4` - 重大更新

---

**注意事项：**

1. 首次发布到应用商店需要开发者账号和年费
2. macOS 和 iOS 需要 Apple Developer Program ($99/年)
3. Google Play 需要一次性 $25 注册费
4. Windows 和 Linux 可以免费分发
5. 保护好签名密钥和证书
6. 遵守各平台的应用审核指南
