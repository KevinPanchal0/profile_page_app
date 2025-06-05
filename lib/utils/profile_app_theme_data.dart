import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppThemeData {
  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xFFFFD600),
    cardColor: const Color(0xFFF5F5F5),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(color: const Color(0xFF7D7D7D), fontSize: 14.sp),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xFFF5F5F5),
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFE0E0E0)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFD600),
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  );

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: const Color(0xFF1C1C1E),
    primaryColor: const Color(0xFFFFD600),
    cardColor: const Color(0xFF2C2C2E),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
      bodyMedium: TextStyle(color: const Color(0xFFB0B0B0), fontSize: 14.sp),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xFF2C2C2E),
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF3A3A3C)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFD600),
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
  );
}
