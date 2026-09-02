import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'config.dart';

class SettingsScreen extends StatefulWidget {
  final ClockConfig config;

  const SettingsScreen({super.key, required this.config});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late ClockConfig _config;

  @override
  void initState() {
    super.initState();
    _config = widget.config;
  }

  Future<void> _pickColor(String title, Color currentColor, Function(Color) onColorChanged) async {
    await showDialog(
      context: context,
      builder: (context) {
        Color selectedColor = currentColor;
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentColor,
              onColorChanged: (color) {
                selectedColor = color;
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () {
                onColorChanged(selectedColor);
                Navigator.of(context).pop();
              },
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildColorButton(String label, Color color, Function(Color) onColorChanged) {
    return ListTile(
      title: Text(label),
      trailing: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onTap: () => _pickColor('选择$label', color, onColorChanged),
    );
  }

  Widget _buildSlider(String label, double value, double min, double max, Function(double) onChanged) {
    return ListTile(
      title: Text('$label: ${value.toStringAsFixed(0)}'),
      subtitle: Slider(
        value: value,
        min: min,
        max: max,
        divisions: ((max - min) / 5).toInt(),
        label: value.toStringAsFixed(0),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('时钟设置'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              await _config.save();
              if (context.mounted) {
                Navigator.pop(context, _config);
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '颜色设置',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          _buildColorButton(
            '背景颜色',
            _config.backgroundColor,
            (color) {
              setState(() {
                _config = _config.copyWith(backgroundColor: color);
              });
            },
          ),
          _buildColorButton(
            '时间颜色',
            _config.timeColor,
            (color) {
              setState(() {
                _config = _config.copyWith(timeColor: color);
              });
            },
          ),
          _buildColorButton(
            '日期颜色',
            _config.dateColor,
            (color) {
              setState(() {
                _config = _config.copyWith(dateColor: color);
              });
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '字体大小',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          _buildSlider(
            '时间字体',
            _config.timeFontSize,
            40.0,
            300.0,
            (value) {
              setState(() {
                _config = _config.copyWith(timeFontSize: value);
              });
            },
          ),
          _buildSlider(
            '日期字体',
            _config.dateFontSize,
            20.0,
            100.0,
            (value) {
              setState(() {
                _config = _config.copyWith(dateFontSize: value);
              });
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '显示设置',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
            title: const Text('显示日期'),
            value: _config.showDate,
            onChanged: (value) {
              setState(() {
                _config = _config.copyWith(showDate: value);
              });
            },
          ),
          SwitchListTile(
            title: const Text('全屏模式'),
            subtitle: const Text('也可以双击屏幕切换'),
            value: _config.isFullscreen,
            onChanged: (value) {
              setState(() {
                _config = _config.copyWith(isFullscreen: value);
              });
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  _config = ClockConfig();
                });
                await _config.save();
              },
              child: const Text('恢复默认设置'),
            ),
          ),
        ],
      ),
    );
  }
}
