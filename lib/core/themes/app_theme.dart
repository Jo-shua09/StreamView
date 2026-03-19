import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      fontFamily: 'Mulish',

      textTheme: const TextTheme(
        displayLarge: AppTextStyles.h1Bold,
        headlineMedium: AppTextStyles.h4Bold,
        titleLarge: AppTextStyles.h6Bold,
        bodyLarge: AppTextStyles.bodyXLarge,
        bodyMedium: AppTextStyles.bodyMediumBold,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          textStyle: AppTextStyles.bodyMediumBold.copyWith(
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w500,
          ),
        ),

        // progressIndicatorTheme: ProgressIndicatorThemeData(
        //   color: AppColors.primary,
        //   linearTrackColor: AppColors.gray20,
        //   linearMinHeight: 4
        // ),
      ),
    );
  }
}
