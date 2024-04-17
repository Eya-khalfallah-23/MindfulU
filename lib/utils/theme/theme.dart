import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';
import '../constants/colors.dart';

class MentalHAppTheme {
  MentalHAppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Urbanist',
    brightness: Brightness.light,
    primaryColor: MhColors.blue,
    scaffoldBackgroundColor: MhColors.light,
    textTheme: MhTextTheme.lightTextTheme,
    chipTheme: MhChipTheme.lightChipTheme,
    appBarTheme: MhAppBarTheme.lightAppBarTheme,
    checkboxTheme: MhCheckboxTheme.lightCheckBoxTheme,
    bottomSheetTheme: MhBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MhElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MhOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MhTextFieldTheme.lightInputDecorationTheme,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Urbanist',
    brightness: Brightness.dark,
    primaryColor: MhColors.blue,
    scaffoldBackgroundColor: MhColors.dark,
    textTheme: MhTextTheme.darkTextTheme,
    chipTheme: MhChipTheme.darkChipTheme,
    appBarTheme: MhAppBarTheme.darkAppBarTheme,
    checkboxTheme: MhCheckboxTheme.darkCheckBoxTheme,
    bottomSheetTheme: MhBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: MhElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MhOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MhTextFieldTheme.darkInputDecorationTheme,
  );
}
