import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClockConfig {
  Color backgroundColor;
  Color timeColor;
  Color dateColor;
  double timeFontSize;
  double dateFontSize;
  bool showDate;
  bool isFullscreen;

  ClockConfig({
    this.backgroundColor = Colors.black,
    this.timeColor = Colors.white,
    this.dateColor = Colors.grey,
    this.timeFontSize = 120.0,
    this.dateFontSize = 40.0,
    this.showDate = true,
    this.isFullscreen = false,
  });

  // 从 SharedPreferences 加载配置
  static Future<ClockConfig> load() async {
    final prefs = await SharedPreferences.getInstance();
    return ClockConfig(
      backgroundColor: Color(prefs.getInt('backgroundColor') ?? Colors.black.value),
      timeColor: Color(prefs.getInt('timeColor') ?? Colors.white.value),
      dateColor: Color(prefs.getInt('dateColor') ?? Colors.grey.value),
      timeFontSize: prefs.getDouble('timeFontSize') ?? 120.0,
      dateFontSize: prefs.getDouble('dateFontSize') ?? 40.0,
      showDate: prefs.getBool('showDate') ?? true,
      isFullscreen: prefs.getBool('isFullscreen') ?? false,
    );
  }

  // 保存配置到 SharedPreferences
  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('backgroundColor', backgroundColor.value);
    await prefs.setInt('timeColor', timeColor.value);
    await prefs.setInt('dateColor', dateColor.value);
    await prefs.setDouble('timeFontSize', timeFontSize);
    await prefs.setDouble('dateFontSize', dateFontSize);
    await prefs.setBool('showDate', showDate);
    await prefs.setBool('isFullscreen', isFullscreen);
  }

  ClockConfig copyWith({
    Color? backgroundColor,
    Color? timeColor,
    Color? dateColor,
    double? timeFontSize,
    double? dateFontSize,
    bool? showDate,
    bool? isFullscreen,
  }) {
    return ClockConfig(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      timeColor: timeColor ?? this.timeColor,
      dateColor: dateColor ?? this.dateColor,
      timeFontSize: timeFontSize ?? this.timeFontSize,
      dateFontSize: dateFontSize ?? this.dateFontSize,
      showDate: showDate ?? this.showDate,
      isFullscreen: isFullscreen ?? this.isFullscreen,
    );
  }
}
