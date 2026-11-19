import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html' as html;

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final saved = prefs.getString('theme') ?? 'system';

    _themeMode = switch (saved) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };

    _updateWebTheme(_themeMode);

    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;

    _updateWebTheme(mode);

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'theme',
      switch (mode) {
        ThemeMode.light => 'light',
        ThemeMode.dark => 'dark',
        _ => 'system',
      },
    );

    notifyListeners();
  }
}

void _updateWebTheme(ThemeMode mode) {
  final brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  final isDark = mode == ThemeMode.system
      ? brightness == Brightness.dark
      : mode == ThemeMode.dark;

  html.document.body?.style.backgroundColor =
      isDark ? '#121212' : '#FFFFFF';

  html.document
      .querySelector('meta[name="theme-color"]')
      ?.setAttribute(
        'content',
        isDark ? '#121212' : '#FFFFFF',
      );
}