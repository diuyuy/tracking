// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyThemeData {
  static ThemeData themeData = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.WHITE,
    ),
    scaffoldBackgroundColor: AppColors.SCAFFOLD_BACKGROUND_GREY,
    dialogBackgroundColor: AppColors.SCAFFOLD_BACKGROUND_GREY,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.LIGHT_BLUE),
  );
}