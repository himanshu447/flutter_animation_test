import 'package:animation_test/utils/app_theme/text_style_theme.dart';
import 'package:animation_test/utils/constants/string_constants.dart';
import 'package:animation_test/values/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBgColor,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.appBarColor),
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    dividerTheme: const DividerThemeData(color: AppColors.dividerColor),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
    extensions: [TextStyleTheme.light()],
    fontFamily: StringConstant.redHatDisplayFont,
  );

  // that's why we will take care of dark theme later.
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    extensions: [TextStyleTheme.dark()],
    fontFamily: StringConstant.redHatDisplayFont,
  );
}
