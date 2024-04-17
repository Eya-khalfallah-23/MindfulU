import 'package:flutter/material.dart';

import '../../constants/colors.dart';

///--- Outlined Light & Dark Button Themes ---
class MhOutlinedButtonTheme {
  MhOutlinedButtonTheme._();

  /// Light Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.black,
    side: const BorderSide(color: MhColors.orange),
    textStyle: const TextStyle(
        fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ));

  /// Dark Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    side: const BorderSide(color: MhColors.orange),
    textStyle: const TextStyle(
        fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ));
}