import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

enum LogoSize { small, medium, large }

class AppLogo extends StatelessWidget {
  const AppLogo({
    this.size = LogoSize.medium,
    this.showLabel = true,
    this.labelColor,
    super.key,
  });

  final LogoSize size;
  final bool showLabel;
  final Color? labelColor;

  double get _iconSize => switch (size) {
        LogoSize.small => 24,
        LogoSize.medium => 40,
        LogoSize.large => 80,
      };

  double get _fontSize => switch (size) {
        LogoSize.small => 16,
        LogoSize.medium => 20,
        LogoSize.large => 40,
      };

  @override
  Widget build(BuildContext context) {
    final effectiveLabelColor = labelColor ?? AppColors.primary;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: _iconSize,
          height: _iconSize,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(size == LogoSize.large ? 20 : 12),
          ),
          child: Icon(
            Icons.spa,
            color: AppColors.onPrimary,
            size: _iconSize * 0.6,
          ),
        ),
        if (showLabel) ...[
          SizedBox(width: size == LogoSize.large ? 16 : 10),
          Text(
            'Serene',
            style: TextStyle(
              fontFamily: AppTypography.fontFamilyHeadline,
              fontSize: _fontSize,
              fontWeight: FontWeight.w800,
              color: effectiveLabelColor,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ],
    );
  }
}
