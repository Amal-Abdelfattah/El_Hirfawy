import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.ai,
      error: AppColors.error,
      brightness: Brightness.light,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
    ),

    textTheme: const TextTheme(
      headlineLarge: AppTextStyles.heading1,
      headlineMedium: AppTextStyles.heading2,
      headlineSmall: AppTextStyles.heading3,
      bodyLarge: AppTextStyles.body,
      bodyMedium: AppTextStyles.body,
      bodySmall: AppTextStyles.bodySmall,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.lightGrey),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.lightGrey),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
    ),
  );
}
