// 条件导入：仅在非Web平台导入window_manager
import 'window_helper_web.dart'
    if (dart.library.io) 'window_helper_io.dart';

abstract class WindowHelper {
  static Future<void> initialize() async {
    await WindowHelperImpl.initialize();
  }

  static Future<void> setFullScreen(bool fullscreen) async {
    await WindowHelperImpl.setFullScreen(fullscreen);
  }
}
