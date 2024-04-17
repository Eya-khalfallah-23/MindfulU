import 'package:flutter/material.dart';

class MhColors {
  MhColors._();

  //App Basic Colors
  static const Color blue = Color(0xFF1E728E); //0xFF---
  static const Color green = Color(0xFFA4C691);
  static const Color purple = Color(0xFFC29BB6);
  static const Color orange = Color(0xFFEEAFA6);

  //Text Colors
  static const Color textBlue = Color(0xFF1E728E); //0xFF---
  static const Color textGreen = Color(0xFFA4C691);
  static const Color textPurple = Color(0xFFC29BB6);
  static const Color textOrange = Color(0xFFEEAFA6);
  static const Color textPrimary = Color(0xFF6E6E6E);
  static const Color textSecondary = Color(0xFFBBBBBB);
  static const Color textWhite = Colors.white;

  static const Color greenShadow = Color.fromARGB(146, 164, 198, 145);
  static const Color orangeShadow = Color.fromARGB(146, 238, 175, 166);
  //Background Colors
  static const Color light = Color(0xFFF7F4F2);
  static const Color dark = Color(0xFF1E1E1E);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  //Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = MhColors.white.withOpacity(0.1);

  //Button Colors
  static const Color buttonPrimary = Color(0xFF1E728E);
  static const Color buttonSecondary = Colors.white;
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  //Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  //Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  //Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color.fromARGB(200, 187, 187, 187);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
