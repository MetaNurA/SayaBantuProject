import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFF97316);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor: const Color(0xFFF6F7FB),

    cardColor: Colors.white,

    dividerColor: Colors.grey.shade300,

    iconTheme: const IconThemeData(
      color: Color(0xFF374151),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Color(0xFF1F2937),
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Color(0xFF1F2937),
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFF374151),
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF6B7280),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.dark,
    ),

    scaffoldBackgroundColor: const Color(0xFF121212),

    cardColor: const Color(0xFF1E1E1E),

    dividerColor: Colors.white24,

    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: Colors.white70,
      ),
    ),
  );
}