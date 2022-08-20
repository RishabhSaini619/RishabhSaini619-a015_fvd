import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool darkMode = false;
// ThemeData themeData;
ValueNotifier<ThemeMode> currentTheme = ValueNotifier(ThemeMode.system);