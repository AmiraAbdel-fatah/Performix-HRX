import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Utils/app_colors.dart';
import '../../../../core/Utils/app_routes.dart';
import '../../../../core/Utils/app_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
      }
    });

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
            colors: [AppColors.sidebarBg, Color(0xFF042F2E)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),

            // Logo Container
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(28.r),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 3,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Image.asset(
                  "assets/images/Logo.png",
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.bolt, color: AppColors.primary, size: 60.sp),
                ),
              ),
            ),
            SizedBox(height: 32.h),

            Text(
              'Performix HR',
              style: AppStyles.h1.copyWith(
                fontSize: 32.sp,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: -1,
              ),
            ),
            SizedBox(height: 12.h),

            Text(
              'Manage your team effortlessly',
              style: AppStyles.bodyLarge.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            const Spacer(flex: 2),

            // Loading Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.w),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return LinearProgressIndicator(
                          value: _animation.value,
                          backgroundColor: Colors.white12,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                          minHeight: 4.h,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Loading...',
                    style: AppStyles.bodyMedium.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
