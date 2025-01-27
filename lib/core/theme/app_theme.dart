import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static  lightTheme() {
    final ThemeData myTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.primary,
    );
  }
}
