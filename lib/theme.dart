import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get theme {
    final textTheme = GoogleFonts.poppinsTextTheme();

    return ThemeData(
      fontFamily: 'Poppins',
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
      textTheme: textTheme.copyWith(
        headlineLarge: GoogleFonts.poppins(
          textStyle: textTheme.headlineLarge!.copyWith(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        headlineMedium: GoogleFonts.poppins(
          textStyle: textTheme.headlineMedium!.copyWith(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        headlineSmall: GoogleFonts.poppins(
          textStyle: textTheme.headlineSmall!.copyWith(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        bodyLarge: GoogleFonts.poppins(
          textStyle: textTheme.bodyLarge!.copyWith(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        bodyMedium: GoogleFonts.poppins(
          textStyle: textTheme.bodyMedium!.copyWith(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        bodySmall: GoogleFonts.poppins(
          textStyle: textTheme.bodySmall!.copyWith(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
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
        labelStyle: GoogleFonts.poppins(
          textStyle: textTheme.bodyMedium!.copyWith(color: Colors.black),
        ),
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
