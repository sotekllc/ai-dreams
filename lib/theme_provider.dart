import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';

import 'package:ai_dreams/theme.dart';

enum UI_THEME { LIGHT, DARK }

final String STORAGE_KEY = 'theme_mode';

class ThemeProvider with ChangeNotifier {
  UI_THEME _mode = UI_THEME.LIGHT;
  final LocalStorage storage;
  late CupertinoThemeData _theme;

  CupertinoThemeData get theme => _theme;

  UI_THEME get mode => _mode;

  ThemeProvider({required this.storage}) {
    var storedThemeMode = storage.getItem(STORAGE_KEY);

    this._mode = UI_THEME.values.firstWhere(
      (e) => e.toString() == storedThemeMode,
      orElse: () => UI_THEME.LIGHT, // fallback if not found
    );

    if (this._mode == UI_THEME.LIGHT) {
      this._theme = lightTheme;
    } else {
      this._theme = darkTheme;
    }
  }

  void _storeThemeMode() {
    storage.setItem(STORAGE_KEY, this._mode.toString());
  }

  void switchToDarkMode() {
    this._mode = UI_THEME.DARK;
    this._theme = darkTheme;
    _storeThemeMode();
    notifyListeners();
  }

  void switchToLightMode() {
    this._mode = UI_THEME.LIGHT;
    this._theme = lightTheme;
    _storeThemeMode();
    notifyListeners();
  }
}
