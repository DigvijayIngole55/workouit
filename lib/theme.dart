import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: Color(0xFF191A1E), // Dark Gray
        secondary: Color(0xFFE0FF64), // Neon Yellow
        surface: Color(0xFFE4E4E4), // Medium Gray
        background: Color(0xFFF2F2F2), // Light Gray
        error: Color(0xFF212121), // Almost Black
        onPrimary: Colors.white, // Text color on primary
        onSecondary: Colors.black, // Text color on secondary
        onSurface: Colors.black, // Text color on surface
        onBackground: Colors.black, // Text color on background
        onError: Colors.white, // Text color on error
      ),
      scaffoldBackgroundColor: Color(0xFFF2F2F2), // Light Gray
      textTheme: TextTheme(
        headlineLarge: TextStyle(
            color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFFE4E4E4), // Medium Gray
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        labelStyle: TextStyle(color: Colors.black),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Color(0xFFE0FF64), // Neon Yellow
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Color(0xFF212121), // Almost Black
        ),
      ),
    );
  }
}
