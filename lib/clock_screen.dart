import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:window_manager/window_manager.dart';
import 'config.dart';
import 'settings_screen.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  late ClockConfig _config;
  late Timer _timer;
  DateTime _currentTime = DateTime.now();
  bool _isLoading = true;
  bool _localeInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeLocale();
    _loadConfig();
    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  Future<void> _initializeLocale() async {
    await initializeDateFormatting('zh_CN', null);
    setState(() {
      _localeInitialized = true;
    });
  }

  Future<void> _loadConfig() async {
    _config = await ClockConfig.load();
    setState(() {
      _isLoading = false;
    });
    _applyFullscreenMode();
  }

  void _applyFullscreenMode() async {
    if (_config.isFullscreen) {
      // 桌面平台使用 window_manager
      if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
        await windowManager.setFullScreen(true);
      }
      // 移动平台使用 SystemChrome
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
        await windowManager.setFullScreen(false);
      }
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _toggleFullscreen() async {
    setState(() {
      _config = _config.copyWith(isFullscreen: !_config.isFullscreen);
    });
    await _config.save();
    _applyFullscreenMode();
  }

  void _adjustTimeFontSize(bool increase) async {
    setState(() {
      double newSize = _config.timeFontSize + (increase ? 10 : -10);
      newSize = newSize.clamp(40.0, 300.0);
      _config = _config.copyWith(timeFontSize: newSize);
    });
    await _config.save();
  }

  void _adjustDateFontSize(bool increase) async {
    setState(() {
      double newSize = _config.dateFontSize + (increase ? 5 : -5);
      newSize = newSize.clamp(20.0, 100.0);
      _config = _config.copyWith(dateFontSize: newSize);
    });
    await _config.save();
  }

  Future<void> _openSettings() async {
    final updatedConfig = await Navigator.push<ClockConfig>(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsScreen(config: _config),
      ),
    );

    if (updatedConfig != null) {
      setState(() {
        _config = updatedConfig;
      });
      _applyFullscreenMode();
    }
  }

  String _formatTime() {
    return '${_currentTime.hour.toString().padLeft(2, '0')}:'
        '${_currentTime.minute.toString().padLeft(2, '0')}:'
        '${_currentTime.second.toString().padLeft(2, '0')}.'
        '${(_currentTime.millisecond).toString().padLeft(3, '0')}';
  }

  String _formatDate() {
    if (!_localeInitialized) {
      return '${_currentTime.year}-${_currentTime.month.toString().padLeft(2, '0')}-${_currentTime.day.toString().padLeft(2, '0')}';
    }
    return DateFormat('yyyy-MM-dd EEEE', 'zh_CN').format(_currentTime);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return KeyboardListener(
      focusNode: FocusNode()..requestFocus(),
      autofocus: true,
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.f11) {
          _toggleFullscreen();
        }
      },
      child: Scaffold(
        backgroundColor: _config.backgroundColor,
        body: GestureDetector(
          onDoubleTap: _toggleFullscreen,
          child: Stack(
          children: [
            // 主时钟显示区域
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 日期显示
                  if (_config.showDate)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        _formatDate(),
                        style: TextStyle(
                          fontSize: _config.dateFontSize,
                          color: _config.dateColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  // 时间显示
                  Text(
                    _formatTime(),
                    style: TextStyle(
                      fontSize: _config.timeFontSize,
                      color: _config.timeColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Courier New',
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
            ),
            // 控制按钮（始终显示，使用半透明背景）
            Positioned(
              top: 40,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // 设置按钮
                    IconButton(
                      icon: const Icon(Icons.settings, size: 30),
                      color: Colors.white,
                      onPressed: _openSettings,
                      tooltip: '设置',
                    ),
                    const SizedBox(height: 10),
                    // 全屏切换按钮
                    IconButton(
                      icon: Icon(
                        _config.isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                        size: 30,
                      ),
                      color: Colors.white,
                      onPressed: _toggleFullscreen,
                      tooltip: _config.isFullscreen ? '退出全屏' : '进入全屏',
                    ),
                    const Divider(color: Colors.white54, height: 20),
                    // 时间字体大小调整
                    Text(
                      '时间',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, size: 20),
                          color: Colors.white,
                          onPressed: () => _adjustTimeFontSize(false),
                          tooltip: '减小时间字体',
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, size: 20),
                          color: Colors.white,
                          onPressed: () => _adjustTimeFontSize(true),
                          tooltip: '增大时间字体',
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // 日期字体大小调整
                    if (_config.showDate) ...[
                      Text(
                        '日期',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, size: 20),
                            color: Colors.white,
                            onPressed: () => _adjustDateFontSize(false),
                            tooltip: '减小日期字体',
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, size: 20),
                            color: Colors.white,
                            onPressed: () => _adjustDateFontSize(true),
                            tooltip: '增大日期字体',
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
            // 全屏提示
            if (!_config.isFullscreen)
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '双击屏幕或点击右上角按钮进入全屏 | F11 切换全屏',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
    );
  }
}
