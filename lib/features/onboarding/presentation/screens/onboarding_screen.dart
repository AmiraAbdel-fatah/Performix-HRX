import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:performix_hrx/core/Utils/app_colors.dart';
import 'package:performix_hrx/core/Utils/app_routes.dart';
import 'package:performix_hrx/core/Utils/app_styles.dart';
import 'package:performix_hrx/features/onboarding/data/models/onboarding_model.dart';
import 'package:performix_hrx/features/widgets/custom_elevated_button.dart';
import 'package:performix_hrx/features/widgets/onboarding_body.dart';

import '../widgets/buildFThirdIllustration.dart';
import '../widgets/buildFirstIllustration.dart';
import '../widgets/buildSecondIllustration.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late final List<OnBoardingModel> _pages = [
    OnBoardingModel(
      title: 'Manage Your Team',
      description:
          'Keep track of all your employees, their performance, and attendance in one place.',
      icon: Icons.people_alt_rounded,
      iconBgColor: const Color(0xFFE0FDF4),
      iconColor: AppColors.primary,
      illustration: BuildFirstIllustration(),
    ),
    OnBoardingModel(
      title: 'Track Performance',
      description:
          'Monitor employee performance with real-time analytics and insights.',
      icon: Icons.workspace_premium_rounded,
      iconBgColor: const Color(0xFFFEF3C7),
      iconColor: AppColors.warning,
      illustration: BuildSecondIllustration(),
    ),
    OnBoardingModel(
      title: 'Data-Driven Insights',
      description:
          'Make informed decisions with powerful analytics and comprehensive reports.',
      icon: Icons.trending_up_rounded,
      iconBgColor: const Color(0xFFDCFCE7),
      iconColor: AppColors.success,
      illustration: BuildThirdIllustration(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
                child: Text(
                  'Skip',
                  style: AppStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingBody(model: _pages[index]);
                },
              ),
            ),
            // Bottom Section: Indicators and Button
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 40.h),
              child: Column(
                children: [
                  // Dot Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.only(right: 8.w),
                        height: 8.h,
                        width: _currentPage == index ? 24.w : 8.w,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.primary
                              : AppColors.border,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  // Button
                  CustomElevatedButton(
                    text: _currentPage == _pages.length - 1
                        ? 'Get Started'
                        : 'Next',
                    icon: Icons.arrow_forward_rounded,
                    onPressed: () {
                      if (_currentPage < _pages.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.login,
                        );
                      }
                    },
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
