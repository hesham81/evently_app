import '/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
  );
}
