import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -100,
              right: -80,
              child: Container(
                width: 384,
                height: 384,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              left: -80,
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  color: AppColors.secondaryContainer.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.spa,
                      color: AppColors.onPrimary,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 48),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Join the Serene Community',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamilyHeadline,
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                        height: 1.1,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Empowering you to manage PCOS naturally and effectively.',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamilyBody,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.surfaceContainerLow,
                          AppColors.primaryContainer.withOpacity(0.3),
                        ],
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              color: AppColors.surfaceContainerLow,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.self_improvement,
                                      size: 64,
                                      color: AppColors.primary.withOpacity(0.4),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Wellness starts here',
                                      style: TextStyle(
                                        fontFamily: AppTypography.fontFamilyBody,
                                        fontSize: 14,
                                        color: AppColors.onSurfaceVariant.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.surface.withOpacity(0),
                                      AppColors.surface.withOpacity(0.4),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  AppButton(
                    label: 'Create Account',
                    onPressed: () => context.go('/sign-up'),
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    label: 'Log In',
                    variant: AppButtonVariant.secondary,
                    onPressed: () => context.go('/login'),
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    label: 'Continue as Guest',
                    variant: AppButtonVariant.tertiary,
                    trailingIcon: Icons.arrow_forward,
                    onPressed: () => context.go('/onboarding'),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.encrypted,
                        size: 16,
                        color: AppColors.onSurfaceVariant.withOpacity(0.6),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Your data is secure and encrypted.',
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamilyBody,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.onSurfaceVariant.withOpacity(0.6),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
