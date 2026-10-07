import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryDark,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryDark,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryDark,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGrey,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.grey,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.grey,
  );
}