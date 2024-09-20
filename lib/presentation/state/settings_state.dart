import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../../core/strings/app_consts.dart';

class SettingsState extends ChangeNotifier {
  //настройки темы
  final _appSettings = Hive.box(AppConsts.keyMainAppBox);
  SettingsState() {
    _themeIndex = _appSettings.get(AppConsts.keyThemeIndex, defaultValue: 3);
    _textSize = _appSettings.get(AppConsts.keyTextSize, defaultValue: 1);
    _alwaysOn = _appSettings.get(AppConsts.keyAlwaysOn, defaultValue: true);
    _alwaysOn ? WakelockPlus.enable() : WakelockPlus.disable();
  }

  late int _themeIndex;
  int get getThemeIndex => _themeIndex; //получаем значения через геттер
  set setThemeIndex(int index) { //меняем и сохраняем значения через сеттер
    _themeIndex = index;
    _appSettings.put(AppConsts.keyThemeIndex, _themeIndex);
    notifyListeners();
  }

  late int _textSize;
  int get getTextSize => _textSize;
  set setTextSize(int size) {
    _textSize = size;
    _appSettings.put(AppConsts.keyTextSize, _textSize);
    notifyListeners();
  }

  late bool _alwaysOn;
  bool get getAlwaysOn => _alwaysOn;
  set setAlwaysOn(bool onChanged) {
    _alwaysOn = onChanged;
    _appSettings.put(AppConsts.keyAlwaysOn, _alwaysOn);
    _alwaysOn ? WakelockPlus.enable() : WakelockPlus.disable();
    notifyListeners();
  }
}