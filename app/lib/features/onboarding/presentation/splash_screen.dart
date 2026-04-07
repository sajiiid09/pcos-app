import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoOpacityAnimation;
  late Animation<double> _titleOpacityAnimation;
  late Animation<double> _subtitleOpacityAnimation;
  late Animation<double> _quoteOpacityAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2400),
      vsync: this,
    );

    // Logo scales in from 0.8 to 1.0
    _logoScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOutBack),
      ),
    );

    // Logo fades in
    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.25, curve: Curves.easeOut),
      ),
    );

    // Title fades in after logo
    _titleOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.45, curve: Curves.easeOut),
      ),
    );

    // Subtitle fades in after title
    _subtitleOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.35, 0.55, curve: Curves.easeOut),
      ),
    );

    // Progress bar animates
    _progressAnimation = Tween<double>(begin: 0.0, end: 0.33).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Quote fades in
    _quoteOpacityAnimation = Tween<double>(begin: 0.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.75, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.surface,
              AppColors.surfaceContainerHighest,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Decorative ambient background elements
            Positioned(
              top: -100,
              left: -100,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _logoOpacityAnimation.value * 0.05,
                    child: child,
                  );
                },
                child: Container(
                  width: 384,
                  height: 384,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(230),
                      topRight: const Radius.circular(154),
                      bottomRight: const Radius.circular(115),
                      bottomLeft: const Radius.circular(269),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              right: -60,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _logoOpacityAnimation.value * 0.05,
                    child: child,
                  );
                },
                child: Container(
                  width: 480,
                  height: 480,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(230),
                      topRight: const Radius.circular(154),
                      bottomRight: const Radius.circular(115),
                      bottomLeft: const Radius.circular(269),
                    ),
                  ),
                ),
              ),
            ),

            // Logo and branding cluster
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Abstract floral logo (scale + fade)
                  FadeTransition(
                    opacity: _logoOpacityAnimation,
                    child: ScaleTransition(
                      scale: _logoScaleAnimation,
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: Stack(
                          children: [
                            // Glow behind logo
                            Center(
                              child: Container(
                                width: 96,
                                height: 96,
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            // Logo circle
                            Center(
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceContainerLowest,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.onSurface.withOpacity(0.04),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.spa,
                                  size: 48,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            // Asymmetric floating accent
                            Positioned(
                              top: 0,
                              right: 24,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: AppColors.tertiaryFixed,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.onSurface.withOpacity(0.04),
                                      blurRadius: 4,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.light_mode,
                                  size: 12,
                                  color: AppColors.tertiary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // App name
                  FadeTransition(
                    opacity: _titleOpacityAnimation,
                    child: Text(
                      'Serene',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamilyHeadline,
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                        height: 1.0,
                        letterSpacing: -1.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Tagline
                  FadeTransition(
                    opacity: _subtitleOpacityAnimation,
                    child: Text(
                      'HARMONIZING YOUR CYCLE',
                      style: TextStyle(
                        fontFamily: AppTypography.fontFamilyBody,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.onSurfaceVariant,
                        letterSpacing: 3.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom section: progress bar + quote
            Positioned(
              left: 0,
              right: 0,
              bottom: 96,
              child: FadeTransition(
                opacity: _quoteOpacityAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Smooth progress track
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: AnimatedBuilder(
                        animation: _progressAnimation,
                        builder: (context, child) {
                          return SizedBox(
                            height: 2,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.surfaceContainerHighest,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: _progressAnimation.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Supporting editorial text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Text(
                        '"Softness is not a weakness. It is the strength of a spirit that remains calm in the storm."',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTypography.fontFamilyBody,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.onSurfaceVariant,
                          fontStyle: FontStyle.italic,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom attribution
            Positioned(
              left: 0,
              right: 0,
              bottom: 32,
              child: FadeTransition(
                opacity: _quoteOpacityAnimation,
                child: Text(
                  'A Curated PCOS Companion',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamilyBody,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurfaceVariant.withOpacity(0.4),
                    letterSpacing: 3.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
