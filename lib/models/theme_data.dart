import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class themeData with ChangeNotifier {
  static SharedPreferences? _sharedPreferences;
  ThemeData greenTheme = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
      displayLarge: TextStyle(color: Colors.white),
      headlineLarge: TextStyle(color: Colors.white),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  ThemeData redTheme = ThemeData(
    primaryColor: Colors.red,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
      displayLarge: TextStyle(color: Colors.white),
      headlineLarge: TextStyle(color: Colors.white),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  bool _isGreen = true;
  void changeTheme(bool value) {
    _isGreen = value;
    saveShare(value);
    notifyListeners();
  }

  Future<void> createShare() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveShare(bool value) async {
    _sharedPreferences?.setBool("temarenk", value);
  }

  void loadShare() async {
    _isGreen = _sharedPreferences?.getBool("temarenk") ?? true;
  }

  bool get getisGreen => _isGreen;
  ThemeData get getselect => _isGreen ? greenTheme : redTheme;
}
