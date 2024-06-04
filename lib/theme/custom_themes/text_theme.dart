import 'package:flutter/material.dart';

class XTextTheme {
  

  static TextTheme appTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 36.0, fontWeight: FontWeight.w400,color: Colors.white),

    // --  for headers
    titleLarge: const TextStyle().copyWith(fontSize: 22.0, fontWeight: FontWeight.w700,color: Colors.white),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600,color: Colors.white),
    titleSmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w400,color: Colors.white),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500,color: Colors.white),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal,color: Colors.white),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500,color: Colors.white.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.normal,color: Colors.white),
    labelMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal,color: Colors.white.withOpacity(0.5)),

    displaySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal,color: Colors.white, fontStyle: FontStyle.italic),
    displayMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal,color: Colors.white, fontStyle: FontStyle.italic),
    
  );
}