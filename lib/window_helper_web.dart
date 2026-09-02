// Web平台的空实现

class WindowHelperImpl {
  static Future<void> initialize() async {
    // Web平台不需要window manager
  }

  static Future<void> setFullScreen(bool fullscreen) async {
    // Web平台全屏通过SystemChrome处理
  }
}
