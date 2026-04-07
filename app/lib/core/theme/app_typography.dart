import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  AppTypography._();

  static const String fontFamilyHeadline = 'Manrope';
  static const String fontFamilyBody = 'Inter';

  static TextTheme get textTheme {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: fontFamilyHeadline,
        fontSize: 57,
        fontWeight: FontWeight.w800,
        color: AppColors.onSurface,
        height: 1.1,
        letterSpacing: -1.0,
      ),
      displayMedium: TextStyle(
        fontFamily: fontFamilyHeadline,
        fontSize: 45,
        fontWeight: FontWeight.w800,
        color: AppColors.onSurface,
        height: 1.15,
        letterSpacing: -0.5,
      ),
      displaySmall: TextStyle(
        fontFamily: fontFamilyHeadline,
        fontSize: 36,
        fontWeight: FontWeight.w800,
        color: AppColors.onSurface,
        height: 1.2,
      ),
      headlineLarge: TextStyle(
        fontFamily: fontFamilyHeadline,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.onSurface,
        height: 1.2,
        letterSpacing: -0.25,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamilyHeadline,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.onSurface,
        height: 1.25,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontFamilyHeadline,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
        height: 1.3,
      ),
      titleLarge: TextStyle(
        fontFamily: fontFamilyHeadline,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        height: 1.3,
        letterSpacing: -0.25,
      ),
      titleMedium: TextStyle(
        fontFamily: fontFamilyBody,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface,
        height: 1.4,
        letterSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamilyBody,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface,
        height: 1.4,
        letterSpacing: 0.1,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontFamilyBody,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamilyBody,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
        height: 1.5,
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamilyBody,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurfaceVariant,
        height: 1.5,
        letterSpacing: 0.4,
      ),
      labelLarge: TextStyle(
        fontFamily: fontFamilyBody,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurface,
        height: 1.4,
        letterSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamilyBody,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurface,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamilyBody,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.onSurfaceVariant,
        height: 1.4,
        letterSpacing: 0.5,
      ),
    );
  }
}
