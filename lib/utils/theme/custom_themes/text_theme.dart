import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class MhTextTheme {
  MhTextTheme._();

  /// Customizable light theme text
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: MhColors.textBlue),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 30.0,
        fontWeight: FontWeight.w600,
        color: MhColors.blue),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: MhColors.textPrimary),
    titleLarge: const TextStyle().copyWith(
        fontSize: 15.0,
        fontWeight: FontWeight.w600,
        color: MhColors.blue),
    titleMedium: const TextStyle().copyWith(
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        color: MhColors.textPrimary),
    titleSmall: const TextStyle().copyWith(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: MhColors.textPrimary),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: MhColors.textPrimary),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: MhColors.textPrimary),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: MhColors.textPrimary),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5)),
  );

  /// Customizable dark theme text
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 34.0, fontWeight: FontWeight.bold, color: MhColors.white),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 22.0, fontWeight: FontWeight.w400, color: MhColors.white),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: MhColors.white),
    titleLarge: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: MhColors.white),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: MhColors.white),
    titleSmall: const TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: MhColors.white),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: MhColors.white),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: MhColors.white),
    bodySmall: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Colors.white.withOpacity(0.5)),
    labelLarge: const TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: MhColors.white),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Colors.white.withOpacity(0.5)),
  );
}
