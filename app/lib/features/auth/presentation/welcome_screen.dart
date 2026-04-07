import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/app_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const _pages = [
    _WelcomePageData(
      icon: Icons.calendar_today,
      title: 'Track symptoms & cycle',
      subtitle: 'Monitor your hormonal health with ease and clarity.',
      chipLabel: 'Today',
      chipValue: 'Hormone Peak',
      chipIcon: Icons.spa,
    ),
    _WelcomePageData(
      icon: Icons.medication_outlined,
      title: 'Manage medications',
      subtitle: 'Stay on top of your supplements and prescriptions.',
      chipLabel: 'Active',
      chipValue: '3 Meds',
      chipIcon: Icons.check_circle,
    ),
    _WelcomePageData(
      icon: Icons.favorite,
      title: 'Build healthier habits',
      subtitle: 'Small daily changes lead to lasting wellness.',
      chipLabel: 'Streak',
      chipValue: '7 Days',
      chipIcon: Icons.local_fire_department,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/get-started');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 16,
              right: 16,
              child: TextButton(
                onPressed: () => context.go('/get-started'),
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontFamily: AppTypography.fontFamilyBody,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                final page = _pages[index];
                return _buildPage(page);
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.surface.withOpacity(0),
                      AppColors.surface,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_pages.length, (index) {
                        final isActive = index == _currentPage;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: isActive ? 10 : 8,
                          height: isActive ? 10 : 8,
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.primary
                                : AppColors.surfaceContainerHighest,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 32),
                    AppButton(
                      label: _currentPage < _pages.length - 1 ? 'Next' : 'Get Started',
                      trailingIcon: Icons.arrow_forward,
                      onPressed: _nextPage,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(_WelcomePageData page) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          const SizedBox(height: 80),
          SizedBox(
            width: 280,
            height: 280,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryContainer.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned.fill(
                  left: 24,
                  top: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer.withOpacity(0.3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(168),
                        bottomRight: Radius.circular(168),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.surfaceContainerLow,
                          AppColors.surfaceContainerLowest,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        page.icon,
                        size: 64,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(9999),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.onSurface.withOpacity(0.06),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.tertiaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            page.chipIcon,
                            size: 20,
                            color: AppColors.tertiary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              page.chipLabel,
                              style: TextStyle(
                                fontFamily: AppTypography.fontFamilyBody,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: AppColors.onSurfaceVariant,
                                letterSpacing: 2.0,
                              ),
                            ),
                            Text(
                              page.chipValue,
                              style: TextStyle(
                                fontFamily: AppTypography.fontFamilyHeadline,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Text(
            page.title,
            style: TextStyle(
              fontFamily: AppTypography.fontFamilyHeadline,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: AppColors.onSurface,
              height: 1.2,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            page.subtitle,
            style: TextStyle(
              fontFamily: AppTypography.fontFamilyBody,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.onSurfaceVariant,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _WelcomePageData {
  const _WelcomePageData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.chipLabel,
    required this.chipValue,
    required this.chipIcon,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String chipLabel;
  final String chipValue;
  final IconData chipIcon;
}
