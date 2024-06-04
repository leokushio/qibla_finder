import 'package:flutter/material.dart';
import 'package:qibla_finder/theme/custom_themes/text_theme.dart';

class XAppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    textTheme: XTextTheme.appTextTheme
  );
}