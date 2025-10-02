import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const bg = Color(0xFFF5F6FA);
  static const sidebar = Colors.white;
  static const card = Colors.white;
  static const darkCard = Color(0xFF14213D);
  static const primary = Color(0xFF6C4DFF);
  static const accent = Color(0xFFEA4C89);
  static const textDark = Color(0xFF0F172A);
  static const textLight = Color(0xFF64748B);
}

ThemeData buildTheme() {
  final base = ThemeData(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.bg,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: Colors.white,
    ),
    textTheme: GoogleFonts.interTextTheme(
      base.textTheme,
    ).copyWith(bodyMedium: GoogleFonts.inter(color: AppColors.textDark)),
  );
}

BoxDecoration cardDecoration({Color? color}) => BoxDecoration(
  color: color ?? AppColors.card,
  borderRadius: BorderRadius.circular(16),
  boxShadow: const [
    BoxShadow(
      blurRadius: 12,
      spreadRadius: 0,
      offset: Offset(0, 6),
      color: Color(0x1518273A),
    ),
  ],
);
